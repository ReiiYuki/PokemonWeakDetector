<template>
  <div id="app" class="text-center">
    <div style="position: fixed; z-index: -98; width: 100%; opacity: .25; height: 100%; background-color:rgba(255, 255, 255,0)">
    </div>
    <div style="position: fixed; z-index: -99; width: 100%; opacity: .25; height: 100%">
  <iframe frameborder="0" height="100%" width="100%"
    src="https://youtube.com/embed/lrHJhKEtQEI?autoplay=1&controls=0&showinfo=0&autohide=1">
  </iframe>
</div>
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
