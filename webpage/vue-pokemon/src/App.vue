<template>
  <div id="app">
    <img src="./assets/logo.png">
    <h1>{{ msg }}</h1>
    <select v-model="selected">
      <option v-for="option in options" v-bind:value="option.value">
       {{ option.text }}
     </option>
    </select>
    <span>Selected: {{ selected }}</span>
  </div>
</template>

<script>
export default {
  data () {
    return {
      msg: 'Hello Vue!',
      selected: 'A',
      options: [
        { text: 'One', value: 'A' },
        { text: 'Two', value: 'B' },
        { text: 'Three', value: 'C' }
      ]
    }
  }
}
</script>

<style>
body {
  font-family: Helvetica, sans-serif;
}
</style>
