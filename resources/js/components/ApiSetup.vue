<script>
    export default {
        data() {
            return {
                token: '',
                authInstance: {},
            };
        },

        mounted() {
            this.getTokenLocalStorage();
            this.setupAxios();
        },

        methods: {
            getTokenLocalStorage() {
                // if no token was passed in look for it in local storage
                if (localStorage.getItem('token_created_by_login')) {
                    this.token = localStorage.getItem('token_created_by_login');
                    return;
                }

                // as a fallback redirect to the login page
                window.location.replace("/login");
            },

            setupAxios() {
                this.authInstance = axios.create({
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json',
                        'Authorization': 'Bearer ' + this.token,
                    }
                });
            },
        }
    }
</script>