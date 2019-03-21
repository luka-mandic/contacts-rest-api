<?php

namespace App\Http\Controllers;


use App\Contact;
use App\Http\Resources\ContactCollection;
use App\Http\Resources\ContactResource;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;


class ContactController extends Controller
{
    public function index()
    {
        return new ContactCollection(auth()->user()->contacts);
    }


    public function store(Request $request)
    {
        $this->validateRequest($request);

        $contact = new Contact([
            'first_name' => $request->input('first_name'),
            'last_name' => $request->input('last_name'),
            'profile_photo' => $request->input('profile_photo'),
            'favourite' => $request->input('favourite'),
            'email' => $request->input('email'),
            'user_id' => auth()->user()->id
        ]);

        $contact->save();

        $contact->phoneNumbers()->createMany($request->input('phoneNumbers'));
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


    public function update(Request $request, $id)
    {
        $contact = $this->getContact($id);

        if (isset($contact)) {
            $this->validateRequest($request, $id);
            $contact->update($request->input());
            (new PhoneNumberController())->update($request, $contact->id);

            return response()->json('Contact updated', 200);
        }

        return response()->json('Not found', 404);
    }


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
     * Validation for the request inputs
     * The unique validation rule follows this syntax:
     *      unique:table_name, column_name, ignored_id, ignored_column_name, (additional where clause) column_name, column_value
     *      So we want to make sure the email is unique only where the user_id matches the current user's id, and the its own
     *      id is ignored so it doesn't interfere with updating.
     *      The same goes for phone number, we want it to be unique only for this contact_id and it should ignore its own id
     *
     * @param Request $request
     * @param null $contactId
     */
    private function validateRequest(Request $request, $contactId = null)
    {
        $rules = [];
        $rules['first_name'] = 'required|max:255';
        $rules['last_name'] = 'required|max:255';
        $rules['profile_photo'] = 'required|max:255';
        $rules['favourite'] = 'required';
        $rules['email'] = 'required|max:255|unique:contacts,email,' . $contactId . ',id,user_id,' . auth()->user()->id;

        // only make phone number validation rules if the phone numbers are present
        if (!empty($request->input('phoneNumbers'))) {
            foreach ($request->input('phoneNumbers') as $index => $phoneNumber) {
                $rules['phoneNumbers.' . $index . '.label'] = 'nullable|max:255';
                $rules['phoneNumbers.' . $index . '.number'] =
                    'required|max:255|unique:phone_numbers,number,' . $phoneNumber['id'] . ',id,contact_id,' . $contactId;
            }
            $rules['phoneNumbers.*.number'] = 'distinct';
        }

        Validator::make($request->all(), $rules)->validate();
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
