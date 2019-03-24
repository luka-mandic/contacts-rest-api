<template>
    <div id="root">
        <div class="text-center font-weight-bold pb-3" style="font-size: 1.5rem;">
            <a href="#" v-on:click.prevent="showAll = true" class="mr-3">All contacts</a>
            |
            <a href="" v-on:click.prevent="showAll = false" class="ml-3">My favourites</a>
        </div>
        <hr>

        <div class="mb-5" style="display: flex;align-items: center;justify-content: center;">
            <input type="search" v-model="searchQuery" class="form-control" style="width: 500px; font-size: 1.2rem"
                   placeholder="Search">
        </div>
        <div class="row">
            <div v-for="(contact, index) in filteredContacts" class="col-sm-3">
                <router-link :to="'/contact/' + contact.id" style="">
                    <div class="card mb-4" style="width: 255px; height: 211px">
                        <div class="pull-left">
                            <button class="pull-left btn btn-sm" v-on:click.prevent="">
                                <i v-if="contact.favourite" v-on:click='contactFavourite(contact)'
                                   class="fas fa-heart fa-lg mt-2 ml-2"></i>
                                <i v-else v-on:click='contactFavourite(contact)'
                                   class="far fa-heart fa-lg  mt-2 ml-2"></i>
                            </button>
                                <i v-on:click.prevent="deleteContact(contact, index)" class="float-right fas fa-trash-alt fa-lg mt-2 mr-2"></i>
                        </div>

                        <img :src="contact.profile_photo" class="card-img-top mx-auto mt-1"
                             style="border-radius: 50%; width: 150px; height: 112px" alt="...">
                        <div class="card-body">
                            <p class="card-text text-center" style="font-size: 1rem;">
                                {{ contact.first_name }} {{ contact.last_name }}
                            </p>
                        </div>
                    </div>
                </router-link>
            </div>

            <router-link to="/create">
                <div class="card mb-4 ml-3 p-4" style="width: 255px; height: 211px">
                    <i class="mt-5 text-center fas fa-plus fa-lg"></i>
                    <div class="card-body">
                        <p class="card-text text-center" style="font-size: 1rem;">
                            Create a new contact
                        </p>
                    </div>
                </div>
            </router-link>
        </div>
    </div>
</template>

<script>
    import ApiSetup from "./ApiSetup";

    export default {
        mixins: [ApiSetup],
        data() {
            return {
                contacts: [],
                //if show all then display all
                showAll: true,
                searchQuery: '',
            };
        },
        computed: {
            filteredContacts: function () {
                // If there is no search query we are filtering for favourite contacts
                if (this.searchQuery === '') {
                    return this.contacts.filter((contact) => {
                        if (this.showAll) {
                            return contact
                        }
                        return contact.favourite;
                    })
                }

                // If there is a search query we are filtering for the search term
                return this.contacts.filter((contact) => {
                    let full_name = contact.first_name + ' ' + contact.last_name;
                    return full_name.toUpperCase().match(this.searchQuery.toUpperCase());
                })
            }
        },

        mounted() {
            this.getContacts();
        },

        methods: {
            getContacts() {
                this.authInstance.get('api/contacts')
                    .then(response => {
                        this.contacts = response.data.data;
                    });
            },

            contactFavourite(contact) {
                contact.favourite = !contact.favourite;

                this.authInstance.put('api/contacts/' + contact.id, contact)
                    .catch(error => {
                        console.log(error);
                    });
            },

            deleteContact(contact, index) {
                if (confirm('Do you want to delete this contact')) {
                    this.authInstance.delete('api/contacts/' + contact.id)
                        .then(response => {
                            this.contacts.splice(index, 1);
                        });
                }
            }
        }


    }
</script>