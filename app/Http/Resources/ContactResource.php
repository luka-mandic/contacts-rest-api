<?php

namespace App\Http\Resources;

use App\PhoneNumber;
use Illuminate\Http\Resources\Json\JsonResource;

class ContactResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'first_name' => $this->first_name,
            'last_name' => $this->last_name,
            'profile_photo' => $this->profile_photo,
            'email' => $this->email,
            'favourite' => $this->favourite,
            'phone_numbers' => PhoneNumberResource::collection($this->phoneNumbers),
            'user' => UserResource::make($this->user),
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at
        ];
    }
}
