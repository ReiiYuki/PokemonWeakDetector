<template>
  <div id="app" class="text-center">
    <img src="./assets/logo.png">
    <h1>{{ msg }}</h1>
    <Enemy></Enemy>
  </div>
</template>

<script>

import Enemy from './components/Enemy.vue'

export default {
  components:{
    Enemy: Enemy
  },
  data () {
    return {
      msg: 'Enemy Pokemon'
    }
  }
}
</script>

<style>
body {
  font-family: Helvetica, sans-serif;
}
</style>
