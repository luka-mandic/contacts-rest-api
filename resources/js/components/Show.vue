<template>
    <div id="root">
        <div class="row">
            <div class="col-sm-1">
                <router-link to="/">
                    <i class="fas fa-arrow-circle-left fa-3x"></i>
                </router-link>
            </div>
            <div class="col-sm-9">
                <h2>{{contact.first_name}} {{contact.last_name}}</h2>
            </div>
            <div class="col-sm-2">
                <router-link :to="'/contact/' + this.$route.params.id + '/edit'">
                    <button class="btn btn-primary">Edit</button>
                </router-link>
            </div>
        </div>
        <hr>

        <div class="row">
            <div class="col-sm-6">
                <img :src="contact.profile_photo" alt="..." class="img-thumbnail" style="width: 400px;">
            </div>
            <div style="font-size: 1.2rem" class="col-sm-6">
                <p>Email: {{contact.email}}</p>
                <p>
                    Favourite:
                        <i v-if="contact.favourite" v-on:click='contactFavourite(contact)'
                           class="fas fa-heart fa-lg mt-2 ml-2"></i>
                        <i v-else v-on:click='contactFavourite(contact)'
                           class="far fa-heart fa-lg  mt-2 ml-2"></i>
                </p>
                <h4>Phone numbers:</h4>
                <div v-for="phone_number in contact.phone_numbers">
                    <p>
                        <span class="badge badge-pill badge-secondary">{{phone_number.label}}</span>
                        {{phone_number.number}}
                    </p>
                </div>
            </div>
        </div>

    </div>
</template>

<script>
    import ApiSetup from "./ApiSetup";

    export default {
        mixins: [ApiSetup],
        data() {
            return {
                contact: {}
            };
        },
        mounted() {
            this.getContact();
        },

        methods: {
            getContact() {
                console.log(this.$route.query.success);
                this.authInstance.get('/api/contacts/'+this.$route.params.id)
                    .then(response => {
                        this.contact = response.data.data;
                    })
                    .catch(() => {
                        this.$router.push('/');
                    });
            },

            contactFavourite(contact) {
                contact.favourite = !contact.favourite;

                this.authInstance.put('api/contacts/' + contact.id, contact)
                    .catch(error => {
                        console.log(error);
                    });
            },
        }
    }
</script>