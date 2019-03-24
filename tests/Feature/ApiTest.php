<?php

namespace Tests\Feature;

use App\Contact;
use Tests\TestCase;
use App\User;
use Illuminate\Foundation\Testing\RefreshDatabase;

class ApiTest extends TestCase
{
    use RefreshDatabase;

    private $headers;
    private $user;
    private $contacts;
    private $jsonPost;


    public function setUp(): void
    {
        parent::setUp();

        $this->user = factory(User::class)->create();
        $this->contacts = factory(Contact::class, 3)->create(['user_id' => $this->user->id]);

        $this->headers = [
            'Accept' => 'application/json',
            'Content-Type' => 'application/json'
        ];

        $this->jsonPost = [
            'id' => null,
            'first_name' => 'test_name',
            'last_name' => 'test_name',
            'profile_photo' => 'test_photo',
            'email' => 'test_email',
            'favourite' => 1,
            'phone_numbers' => [
                [
                    'id' => null,
                    'number' => '12345',
                    'label' => 'test'
                ]
            ],
        ];
    }


    public function testUnauthorizedUserGets401Response()
    {
        $response = $this->withHeaders($this->headers)
            ->get('/api/contacts');

        $response->assertStatus(401);
    }


    public function testUserCanSeeHisContacts()
    {
        $response = $this->actingAs($this->user, 'api')
            ->withHeaders($this->headers)
            ->get('/api/contacts');

        $response->assertStatus(200);
        $response->assertSee($this->contacts->first()->email);
        $response->assertSee($this->contacts->last()->email);
    }


    public function testUserCanSeeSpecificContacts()
    {
        $response = $this->actingAs($this->user, 'api')
            ->withHeaders($this->headers)
            ->get('/api/contacts/' . $this->contacts->first()->id);

        $response->assertStatus(200);
        $response->assertSee($this->contacts->first()->email);
    }


    public function testUserCanCreateContact()
    {
        $response = $this->actingAs($this->user, 'api')
            ->withHeaders($this->headers)
            ->json('POST', '/api/contacts', $this->jsonPost);

        $response->assertStatus(201);

        // the response returned by the store method is the ID of the newly created contact
        $response = $this->actingAs($this->user, 'api')
            ->withHeaders($this->headers)
            ->get('/api/contacts/' . $response->getContent());

        $response->assertSee('test_email');
    }


    public function testUserCanUpdateContact()
    {
        $response = $this->actingAs($this->user, 'api')
            ->withHeaders($this->headers)
            ->json('PUT', '/api/contacts/' . $this->contacts->first()->id, $this->jsonPost);

        $response->assertStatus(200);

        $response = $this->actingAs($this->user, 'api')
            ->withHeaders($this->headers)
            ->get('/api/contacts/' . $this->contacts->first()->id);

        $response->assertDontSee($this->contacts->first()->email);
        $response->assertSee('test_email');
    }

    public function testUserCanDeleteContact()
    {
        $response = $this->actingAs($this->user, 'api')
            ->withHeaders($this->headers)
            ->json('DELETE', '/api/contacts/' . $this->contacts->first()->id);

        $response->assertStatus(200);

        $response = $this->actingAs($this->user, 'api')
            ->withHeaders($this->headers)
            ->get('/api/contacts/' . $this->contacts->first()->id);

        $response->assertStatus(404);
    }
}
