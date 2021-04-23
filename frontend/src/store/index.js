import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from 'vuex-persistedstate';
import Cookies from 'js-cookie';

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    backendUrl: "http://18.191.16.194",
    token: null,
    jwtToken: null,
    refreshToken: null,

    isUser: false,
    isAdmin: false,
  },

  mutations: {
    setToken (state, value) {
      state.token = value
    },

    setJwt (state, tokens) {
      state.jwtToken = tokens.access
      state.refreshToken = tokens.refresh
    },

    setUser(state, value) {
      state.isUser = value
    },

    setAdmin(state, value) {
      state.isAdmin = value
    },
  },

  actions: {
    setToken(context, value) {
      context.commit('setToken', value);
    },

    setJwt(context, value) {
      context.commit('setJwt', value)
    },

    setGroups(context, groups) {
      context.commit('setUser', groups.includes('user'))
      context.commit('setAdmin', groups.includes('admin'))
    }
  },

  modules: {
  },

  plugins: [createPersistedState({
    storage: {
      getItem: key => Cookies.get(key),
      setItem: (key, value) => Cookies.set(key, value, { expires: 3, secure: false }),
      removeItem: key => Cookies.remove(key)
    }
  })],
})

