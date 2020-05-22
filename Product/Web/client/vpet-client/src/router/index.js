import Vue from 'vue'
import VueRouter from 'vue-router'
import ProfilePage from '@/components/ProfilePage'
import PetPage from '@/components/PetPage'
import FriendsPage from '@/components/FriendsPage'
import MapPage from '@/components/MapPage'
import LogInPage from '@/components/LogInPage'
import RegisterPage from '@/components/RegisterPage'

Vue.use(VueRouter)

export default new VueRouter({
  routes: [
    {
      path: '/',
      name: 'ProfilePage',
      component: ProfilePage
    },
    {
      path: '/pet',
      name: 'PetPage',
      component: PetPage
    },
    {
      path: '/friends',
      name: 'FriendsPage',
      component: FriendsPage
    },
    {
      path: '/map',
      name: 'MapPage',
      component: MapPage
    },
    {
      path: '/login',
      name: 'LogInPage',
      component: LogInPage
    },
    {
      path: '/register',
      name: 'RegisterPage',
      component: RegisterPage
    }
  ]
})
