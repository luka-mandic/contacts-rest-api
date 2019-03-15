<?php

use App\Contact;
use Faker\Generator as Faker;

$factory->define(Contact::class, function (Faker $faker) {
    return [
        'first_name' => $faker->firstName,
        'last_name' => $faker->lastName,
        'profile_photo' => $faker->imageUrl(),
        'email' => $faker->unique()->safeEmail,
        'favourite' => $faker->boolean,
        'user_id' => 1,
    ];
});
