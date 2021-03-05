import Vue from 'vue'
import axios from 'axios'

const client = axios.create({
  timeout: 5000
})

Vue.prototype.$axios = client
