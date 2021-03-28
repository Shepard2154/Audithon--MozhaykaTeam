import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  {
    path: '/signin',
    component: () => import('../views/SignIn.vue'),
    name: 'signin'
  },
  {
    path: '/signup',
    component: () => import('../views/SignUp.vue'),
    name: 'signup'
  },
  {
    path: '/debt',
    name: 'main',
    component: () => import('../views/Main.vue')
  },
  {
    path: '/repayment-schedule',
    name: 'repayment-schedule',
    component: () => import('../views/Repayment-schedule.vue')
  },
  {
    path: '/servicing-bonds',
    name: 'servicing-bonds',
    component: () => import('../views/Servicing-bonds.vue')
  },
  {
    path: '/predicting',
    name: 'predicting',
    component: () => import('../views/Predicting.vue')
  },
  
]


const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  linkActiveClass: "active",
  routes
})

export default router
