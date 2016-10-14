<template>
  <div id="app">
    <img src="./assets/logo.png">
    <h1>{{ msg }}</h1>
    <span>Pokemon1: {{ poke1_selected }}</span>
    <select v-model="poke1_selected">
      <option v-for="option in options" v-bind:value="option.text">
       {{ option.text }}
     </option>
    </select>
    &nbsp;&nbsp;
    <span>Pokemon2: {{ poke2_selected }}</span>
    <select v-model="poke2_selected">
      <option v-for="option in options" v-bind:value="option.text">
       {{ option.text }}
     </option>
    </select>
    &nbsp;&nbsp;
    <span>Pokemon3: {{ poke3_selected }}</span>
    <select v-model="poke3_selected">
      <option v-for="option in options" v-bind:value="option.text">
       {{ option.text }}
     </option>
    </select>
    <br><br>
    <span>Pokemon4: {{ poke4_selected }}</span>
    <select v-model="poke4_selected">
      <option v-for="option in options" v-bind:value="option.text">
       {{ option.text }}
     </option>
    </select>
    &nbsp;&nbsp;
    <span>Pokemon5: {{ poke5_selected }}</span>
    <select v-model="poke5_selected">
      <option v-for="option in options" v-bind:value="option.text">
       {{ option.text }}
     </option>
    </select>
    &nbsp;&nbsp;
    <span>Pokemon6: {{ poke6_selected }}</span>
    <select v-model="poke6_selected">
      <option v-for="option in options" v-bind:value="option.text">
       {{ option.text }}
     </option>
    </select>
  </div>
</template>

<script>
export default {
  data () {
    return {
      msg: 'Enemy Pokemon',
      poke1_selected: 'A',
      poke2_selected: 'A',
      poke3_selected: 'A',
      poke4_selected: 'A',
      poke5_selected: 'A',
      poke6_selected: 'A',
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
