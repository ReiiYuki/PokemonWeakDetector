<template>
  <div id="app" class="text-center">
    <div style="position: fixed; z-index: -98; width: 100%; height: 100%; background-color:rgba(255, 255, 255,0)">
    </div>
    <div style="position: fixed; z-index: -99; width: 100%; opacity: .3; height: 100%; background-color:rgba(255, 255, 255,0)">
  <iframe frameborder="0" height="100%" width="100%"
    src="https://youtube.com/embed/d3YI3NYywg0?autoplay=1&controls=0&showinfo=0&autohide=1&loop=1">
    <!-- 6xKWiCMKKJg -->
    <!-- d3YI3NYywg0 list -->
    <!-- Nmipdds2PzI -->
  </iframe>
</div>
    <img src="./assets/logo.png">
    <h1 class="enemy-text">{{ msg }}</h1>
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

.enemy-text{
  font-size:2em;
  color: rgb(247, 198, 51);
  text-shadow: 2px 2px 0 rgb(25, 83, 150), 2px -2px 0 rgb(25, 83, 150), -2px 2px 0 rgb(25, 83, 150), -2px -2px 0 rgb(25, 83, 150);
}
</style>
