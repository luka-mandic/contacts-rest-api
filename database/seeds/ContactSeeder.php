<?php

use App\Contact;
use App\PhoneNumber;
use App\User;
use Illuminate\Database\Seeder;

class ContactSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $user = factory(User::class)->create();

        factory(Contact::class, 10)
            ->create([
                'user_id' => $user->id
            ])
            ->each(function ($contact) {
                $contact->phoneNumbers()->saveMany(factory(PhoneNumber::class, 3)->create());
            });
    }
}
