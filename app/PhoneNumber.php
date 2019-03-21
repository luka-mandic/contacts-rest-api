<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PhoneNumber extends Model
{

    protected $fillable = [
        'number',
        'label',
        'contact_id',
    ];

    public function contact()
    {
        return $this->belongsTo(Contact::class);
    }
}
