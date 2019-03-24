<?php

namespace App\Http\Controllers;


use App\Contact;
use App\Http\Requests\StoreContact;
use App\Http\Resources\ContactCollection;
use App\Http\Resources\ContactResource;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;


class ContactController extends Controller
{
    /**
     * @return ContactCollection
     */
    public function index()
    {
        return new ContactCollection(auth()->user()->contacts);
    }


    /**
     * @param StoreContact $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(StoreContact $request)
    {
        $contact = new Contact([
            'first_name' => $request->input('first_name'),
            'last_name' => $request->input('last_name'),
            'profile_photo' => $request->input('profile_photo'),
            'favourite' => $request->input('favourite'),
            'email' => $request->input('email'),
            'user_id' => auth()->user()->id
        ]);

        $contact->save();

        $contact->phoneNumbers()->createMany($request->input('phone_numbers'));

        return response()->json($contact->id, 200);
    }

    
    /**
     * @param $id
     * @return ContactResource|\Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        $contact = $this->getContact($id);

        if (isset($contact)) {
            return new ContactResource($contact);
        }

        return response()->json('Not found', 404);
    }


    /**
     * @param StoreContact $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(StoreContact $request, $id)
    {
        $contact = $this->getContact($id);

        if (isset($contact)) {
            $contact->update($request->input());
            (new PhoneNumberController())->update($request, $contact->id);

            return response()->json('Contact updated', 200);
        }

        return response()->json('Not found', 404);
    }


    /**
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy($id)
    {
        $contact = $this->getContact($id);

        if (isset($contact)) {
            $contact->delete();

            return response()->json('Contact deleted', 200);
        }

        return response()->json('Not found', 404);
    }


    /**
     * Here we assure that the user is only viewing/updating/deleting his own contacts
     * @param $id
     * @return mixed
     */
    private function getContact($id)
    {
        return auth()->user()->contacts()->where('id', $id)->first();
    }
}
