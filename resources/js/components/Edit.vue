<template>
    <div id="root">
        <div class="row">
            <div class="col-sm-11">
                <h2>Edit contact</h2>
            </div>
            <div class="col-sm-1">
                <button class="btn btn-danger" v-on:click="deleteContact()">Delete</button>
            </div>
        </div>
        <form action="" class="form" style="font-size: 1.2rem">
            <div class="form-group">
                <label>First name:</label>
                <input v-model="contact.first_name" type="text"
                       :class="(errors.first_name) ? 'is-invalid form-control' : 'form-control'" name="first_name">
                <div v-if="errors.first_name" class="invalid-feedback">
                    {{errors.first_name}}
                </div>
            </div>
            <div class="form-group">
                <label>Last name:</label>
                <input v-model="contact.last_name" type="text"
                       :class="(errors.last_name) ? 'is-invalid form-control' : 'form-control'" name="last_name">
                <div v-if="errors.last_name" class="invalid-feedback">
                    {{errors.last_name}}
                </div>
            </div>
            <div class="form-group">
                <label>Email:</label>
                <input v-model="contact.email" type="text"
                       :class="(errors.email) ? 'is-invalid form-control' : 'form-control'" name="email">
                <div v-if="errors.email" class="invalid-feedback">
                    {{errors.email}}
                </div>
            </div>
            <div class="form-group">
                <label>Profile photo url:</label>
                <input v-model="contact.profile_photo" type="text"
                       :class="(errors.profile_photo) ? 'is-invalid form-control' : 'form-control'"
                       name="profile_photo">
                <div v-if="errors.profile_photo" class="invalid-feedback">
                    {{errors.profile_photo}}
                </div>
            </div>
            <div class="form-group">
                <div class="form-check">
                    <input v-model="contact.favourite"
                           :class="(errors.favourite) ? 'is-invalid form-check-input' : 'form-check-input'"
                           type="checkbox" id="defaultCheck" :value="0">
                    <label class="form-check-label" for="defaultCheck">
                        Favourite
                    </label>
                    <div v-if="errors.favourite" class="invalid-feedback">
                        {{errors.favourite}}
                    </div>
                </div>
            </div>

            <h3>Phone numbers</h3>
            <div v-for="(phone_number, index) in contact.phone_numbers">
                <div class="form-group form-inline">
                    <label class="pr-2">Number:</label>
                    <input v-model="phone_number.number" type="text"
                           :class="(errors['phone_numbers.'+index+'.number']) ? 'is-invalid form-control' : 'form-control'">
                    <div v-if="errors['phone_numbers.'+index+'.number']" class="invalid-feedback">
                        {{errors['phone_numbers.'+index+'.number']}}
                    </div>
                    <label class="px-2">Label:</label>
                    <input v-model="phone_number.label" type="text"
                           :class="(errors['phone_numbers.'+index+'.label']) ? 'is-invalid form-control' : 'form-control'">
                    <div v-if="errors['phone_numbers.'+index+'.label']" class="invalid-feedback">
                        {{errors['phone_numbers.'+index+'.label']}}
                    </div>
                    <i v-on:click="removePhoneNumber(index)" style="cursor: pointer;"
                       class="pl-2 fas fa-times fa-lg"></i>
                </div>
            </div>

            <button v-on:click.prevent="addPhoneNumber()" class="btn btn-primary">Add phone number</button>
            <hr>
            <button v-on:click.prevent="updateContact()" class="btn btn-primary mr-3">Update</button>

            <router-link :to="'/contact/' + contact.id">
                <button class="btn btn-danger">Cancel</button>
            </router-link>
        </form>
    </div>
</template>

<script>
    import ApiSetup from "./ApiSetup";

    export default {
        mixins: [ApiSetup],
        data() {
            return {
                contact: {},
                errors: [],
            };
        },
        mounted() {
            this.getContact();
        },

        methods: {
            getContact() {
                this.authInstance.get('/api/contacts/' + this.$route.params.id)
                    .then(response => {
                        this.contact = response.data.data;
                    })
                    .catch(() => {
                        this.$router.push('/');
                    });
            },

            addPhoneNumber() {
                this.contact.phone_numbers.push({
                    id: null,
                    number: '',
                    label: ''
                });
            },

            removePhoneNumber(index) {
                this.contact.phone_numbers.splice(index, 1);
            },

            updateContact() {
                this.authInstance.put('api/contacts/' + this.contact.id, this.contact)
                    .then(response => {
                        this.$router.push('/contact/' + this.contact.id);
                    })
                    .catch(error => {
                        this.errors = error.response.data.errors;
                    });
            },

            deleteContact() {
                if (confirm('Do you want to delete this contact')) {
                    this.authInstance.delete('api/contacts/' + this.contact.id)
                        .then(response => {
                            this.$router.push('/');
                        });
                }
            }
        }
    }
</script>