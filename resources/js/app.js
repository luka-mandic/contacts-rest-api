/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */
import Index from "./components/Index";
import Create from "./components/Create";
import Show from "./components/Show";
import Edit from "./components/Edit";


require('./bootstrap');

window.Vue = require('vue');

import VueRouter from 'vue-router'

Vue.use(VueRouter);

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i);
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default));

Vue.component(
    'passport-clients',
    require('./components/passport/Clients.vue').default
);

Vue.component(
    'passport-authorized-clients',
    require('./components/passport/AuthorizedClients.vue').default
);

Vue.component(
    'passport-personal-access-tokens',
    require('./components/passport/PersonalAccessTokens.vue').default
);

Vue.component(
    'index',
    require('./components/Index.vue').default
);

Vue.component(
    'create',
    require('./components/Create.vue').default
);

Vue.component(
    'show',
    require('./components/Show.vue').default
);

Vue.component(
    'edit',
    require('./components/Edit.vue').default
);


const routes = [
    { path: '/', component: Index },
    { path: '/create', component: Create },
    { path: '/contact/:id', component: Show },
    { path: '/contact/:id/edit', component: Edit }
];

const router = new VueRouter({
    routes
});

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',
    router
});
