<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Contact extends Model
{
    public function phoneNumbers()
    {
        return $this->hasMany(PhoneNumber::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
