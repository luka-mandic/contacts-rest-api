<?php

use App\PhoneNumber;
use Faker\Generator as Faker;

$factory->define(PhoneNumber::class, function (Faker $faker) {
    return [
        'number' => $faker->phoneNumber,
        'label' => $faker->word,
        'contact_id' => 1,
    ];
});
