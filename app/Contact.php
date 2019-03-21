<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Contact extends Model
{
    protected $fillable = [
        'first_name',
        'last_name',
        'email',
        'favourite',
        'profile_photo',
        'user_id',
    ];

    public function phoneNumbers()
    {
        return $this->hasMany(PhoneNumber::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
