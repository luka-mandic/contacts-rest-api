<?php


namespace App\Http\Controllers;


use App\PhoneNumber;
use Illuminate\Http\Request;


class PhoneNumberController extends Controller
{
    public function update(Request $request, $contactId)
    {
        $phoneNumbers = $request->input('phoneNumbers');

        foreach ($phoneNumbers as $phoneNumber) {
            $phoneNumber['contact_id'] = $contactId;
            PhoneNumber::updateOrCreate(['id' => $phoneNumber['id']], $phoneNumber);
        }
    }
}