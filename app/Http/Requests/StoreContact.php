<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;


class StoreContact extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
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
     * @return array
     */
    public function rules(Request $request)
    {
        $contactId = $request->input('id');

        $rules = [];
        $rules['first_name'] = 'required|max:255';
        $rules['last_name'] = 'required|max:255';
        $rules['profile_photo'] = 'required|max:255';
        $rules['favourite'] = 'required';
        $rules['email'] = 'required|max:255|unique:contacts,email,' . $contactId . ',id,user_id,' . auth()->user()->id;

        // only make phone number validation rules if the phone numbers are present
        if (!empty($request->input('phone_numbers'))) {
            foreach ($request->input('phone_numbers') as $index => $phoneNumber) {
                $rules['phone_numbers.' . $index . '.label'] = 'nullable|max:255';
                $rules['phone_numbers.' . $index . '.number'] =
                    'required|max:255|unique:phone_numbers,number,' . $phoneNumber['id'] . ',id,contact_id,' . $contactId;
            }
            $rules['phone_numbers.*.number'] = 'distinct';
        }

        return $rules;
    }

    public function attributes()
    {
        return [
            'phone_numbers.*.label' => 'phone label',
            'phone_numbers.*.number' => 'phone number',
        ];
    }
}
