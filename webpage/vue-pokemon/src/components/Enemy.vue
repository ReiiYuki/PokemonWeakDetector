<template>
  <div>
    <span>Pokemon1: </span>
    <select v-model="poke1_selected">
      <option v-for="option in pokemon_name" v-bind:value="'src/assets/pokemon_sprites/'+option.id_img">
       {{ option.name }}
      </option>
    </select>
    <img v-bind:src= "poke1_selected" />
    <span>Pokemon2: </span>
    <select v-model="poke2_selected">
      <option v-for="option in pokemon_name" v-bind:value="'src/assets/pokemon_sprites/'+option.id_img">
       {{ option.name }}
     </option>
    </select>
    <img v-bind:src= "poke2_selected" />
    <span>Pokemon3: </span>
    <select v-model="poke3_selected">
      <option v-for="option in pokemon_name" v-bind:value="'src/assets/pokemon_sprites/'+option.id_img">
       {{ option.name }}
     </option>
    </select>
    <img v-bind:src= "poke3_selected" />
    <br><br>
    <span>Pokemon4: </span>
    <select v-model="poke4_selected">
      <option v-for="option in pokemon_name" v-bind:value="'src/assets/pokemon_sprites/'+option.id_img">
       {{ option.name }}
     </option>
    </select>
    <img v-bind:src= "poke4_selected" />
    <span>Pokemon5: </span>
    <select v-model="poke5_selected">
      <option v-for="option in pokemon_name" v-bind:value="'src/assets/pokemon_sprites/'+option.id_img">
       {{ option.name }}
     </option>
    </select>
    <img v-bind:src= "poke5_selected" />
    <span>Pokemon6: </span>
    <select v-model="poke6_selected">
      <option v-for="option in pokemon_name" v-bind:value="'src/assets/pokemon_sprites/'+option.id_img">
       {{ option.name }}
     </option>
    </select>
    <img v-bind:src= "poke6_selected" />
  </div>
</template>

<script>

var url = 'src/assets/pokemon_sprites/'

export default {

  created: function () {
    var self = this;
    $.ajax({
      url:'../../api/pokemon_name.json',
      complete:function(data){
        self.pokemon_name = data.responseJSON
      }
    })
  },


  data(){
    return {

      poke1_selected: url+'1.png',
      poke2_selected: url+'1.png',
      poke3_selected: url+'1.png',
      poke4_selected: url+'1.png',
      poke5_selected: url+'1.png',
      poke6_selected: url+'1.png',
      pokemon_name:{}
    }
  }
}
</script>
