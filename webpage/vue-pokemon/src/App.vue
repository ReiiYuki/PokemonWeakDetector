<template>
  <div id="app" class="app_container">
    <img src="./assets/logo.png">
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
.app_container {
  display: inline-flex;
}
</style>
