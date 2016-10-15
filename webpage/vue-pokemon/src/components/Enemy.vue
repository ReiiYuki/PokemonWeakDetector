<template>
  <div>
    <img v-bind:src= "'src/assets/pokemon_sprites/'+item.value" />
    <div class="select_name_div">
      <basic-select :options="pokemon_name"
                  :selected-option="item"
                  @select="onSelect" v-bind:style="select_name_style">
      </basic-select>
    </div>

  </div>
</template>

<script>

import { vSelect } from "vue-select"
import { BasicSelect } from 'vue-search-select'
var url = 'src/assets/pokemon_sprites/'
export default {

  components: {vSelect,BasicSelect},
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
      pokemon_name:[],
      searchText: '', // If value is falsy, reset searchText & searchItem
      item: {
            value: '1.png',
            text: 'bulbasaur'
      },
      select_name_style: {
        fontSize: '15px',
        width: '200px',
        'text-align': 'center',
      }
    }
  },

  methods: {
      onSelect (item) {
        this.item = item
      },
      reset () {
        this.item = {}
      },
      selectOption () {
        this.item = this.pokemon_name[0]
      }
    },
}
</script>
<style media="screen" scoped>
  .select_name_div {
    display: inline-block;
    text-transform: capitalize;
  }
</style>
