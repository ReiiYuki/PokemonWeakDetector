<template>
  <div class="pokemon_select">
    <img v-bind:src= "'src/assets/pokemon_sprites/'+item.value" />
    <div class="select_name_div">
      <basic-select :options="pokemon_name"
      :selected-option="item"
      @select="onSelect" v-bind:style="select_name_style">
    </basic-select>
  </div>&nbsp;&nbsp;&nbsp;&nbsp;
  <button class="btn btn-primary" type="button" @click="onSubmit" name="button">Go</button>
  <br>
  <div class="table_container">
    <table cellspacing="1" cellpadding="1" border="1">
      <thead>
        <tr>
          <th v-for="key in columns">
            {{ key }}
          </th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="entry in data">
          <td v-for="key in columns">
            <div v-if="key == 'Pokemon'">
              <img v-bind:src="entry[key]" />
            </div>
            <div v-else>
              {{entry[key]}}
            </div>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
  </div>
</div>
</template>

<script>

import { vSelect } from "vue-select"
import { BasicSelect } from 'vue-search-select'
import PokemonMapImage from '../util/PokemonMapImage'
var url = 'src/assets/pokemon_sprites/'
const END_POINT = 'http://localhost:9999/'
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
    this.columns = ['Pokemon','Name','Moves']
    return {
      pokemon_name:[],
      searchText: '', // If value is falsy, reset searchText & searchItem
      item: {
        value: '1.png',
        text: 'bulbasaur'
      },
      pokemonMapImage:{},
      select_name_style: {
        fontSize: '15px',
        width: '200px',
        'text-align': 'center',
      },
      gridColumns: [],
      gridData: [],
      data : [{Pokemon:'',Name:'None',Moves:'None'}],
      searchQuery: '',
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
    },
    onSubmit(){
      let enemyName = this.item.text
      console.log(enemyName)
      let datapokemon = {"pokemon":enemyName}
      var self = this
      var pokemonMapImage = new PokemonMapImage(self.pokemon_name)
      $.ajax({
        url        : END_POINT,
        method     : 'POST',
        contentType: 'application/json',
        dataType   : 'json',
        data       : JSON.stringify(datapokemon),
        success    : function (res) {
          let list_pokemon = res
          let set_pokemon = new Set();
          let keylist=[]
          let list_obj = []
          let map = new Map();
          while(self.data.length>0){self.data.pop()}
          for(let i in list_pokemon){
            let pokemon = {"Pokemon":"","Name":list_pokemon[i].Pokemon,"Moves":""}
            pokemon.Pokemon += url+pokemonMapImage.convert(list_pokemon[i].Pokemon)
            for(let j in list_pokemon[i].Moves){
              if(j==0){
                pokemon.Moves += list_pokemon[i].Moves[j]+""
              }
              else
              pokemon.Moves += " , "+list_pokemon[i].Moves[j]
            }
            console.log(pokemon);
            self.data.push(pokemon)
          }
        },
        error :function (res) {
          console.log(res,'e');
          self.data = [{Pokemon:'',Name:'None',Move:'None'}]
        }
      })
    }
  },
}

</script>
<style scoped>
.select_name_div {
  display: inline-block;
  text-transform: capitalize;
}
table {
  border: 2px solid #4682B4;
  border-radius: 3px;
  background-color: #fff;
  border-collapse: collapse;

}

th {
  background-color: #4682B4;
  color: rgba(255,215,0,1);
  text-align: center;
}

td {
  background-color: #F5FFFA;
}

th, td {
  width: 900px;
  padding: 10px 20px;
}

.table_container {
  width: 900px;
  height: 300px;
  overflow:auto;
  display: inline-block;
  text-align: center;
}

</style>
