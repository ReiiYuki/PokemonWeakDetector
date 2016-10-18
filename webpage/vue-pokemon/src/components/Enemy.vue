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
  <form id="search">
    Search <input name="query" v-model="searchQuery">
  </form><br>
    <table>
      <thead>
        <tr>
          <th v-for="key in columns"
            @click="sortBy(key)"
            :class="{ active: sortKey == key }">
            {{ key | capitalize }}
            <span class="arrow" :class="sortOrders[key] > 0 ? 'asc' : 'dsc'">
            </span>
          </th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="entry in filteredData">
          <td v-for="key in columns"  >
            {{entry[key]}}
          </td>
        </tr>
      </tbody>
    </table>
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
    var sortOrders = {}
    this.columns = ['PokemonName','Move','Image']
    this.columns.forEach(function (key) {
      sortOrders[key] = 1
    })
    return {
      sortKey: '',
      sortOrders: sortOrders,
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
      searchQuery: '',
    }
  },

  computed: {
    filteredData: function () {
      var sortKey = this.sortKey
      var filterKey = this.filterKey && this.filterKey.toLowerCase()
      var order = this.sortOrders[sortKey] || 1
      this.data = [{PokemonName:'None',Move:'None',Image:'None'}]
      if (filterKey) {
        this.data = this.data.filter(function (row) {
          return Object.keys(row).some(function (key) {
            return String(row[key]).toLowerCase().indexOf(filterKey) > -1
          })
        })
      }
      if (sortKey) {
        this.data = this.data.slice().sort(function (a, b) {
          a = a[sortKey]
          b = b[sortKey]
          return (a === b ? 0 : a > b ? 1 : -1) * order
        })
      }
      return this.data
    }
  },
  filters: {
    capitalize: function (str) {
      return str.charAt(0).toUpperCase() + str.slice(1)
    }
  },

  methods: {
    sortBy: function (key) {
      this.sortKey = key
      this.sortOrders[key] = this.sortOrders[key] * -1
    },
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
          self.data_table = [];
        //  self.data = {}
          for(let i in list_pokemon){
            for(let j in list_pokemon[i].Moves){
              self.data.push({"PokemonName":list_pokemon[i].Pokemon,"Move":list_pokemon[i].Moves[j],"Image":url+''+pokemonMapImage.convert(list_pokemon[i].Pokemon)})
            }
            // console.log(list_pokemon[i]);
          }
        //  self.data = self.data_table
          // for(let i in list_pokemon){
          //   if(map.get(list_pokemon[i].Pokemon)){
          //     let key = list_pokemon[i].Pokemon
          //     map.get(key).add(list_pokemon[i].Move)
          //   }
          //   else{
          //     let moveList = new Set();
          //     moveList.add(list_pokemon[i].Move)
          //     map.set(list_pokemon[i].Pokemon,moveList)
          //   }
          // }
          // for (var [key, value] of map.entries()) {
          //   value.forEach(function(move) {
          //     console.log(key,move)
          //      data_table.push({"pokemon_name":key,"move":move,"url":url+''+pokemonMapImage.convert(key)})
          //   });
          // }
          for(var i in self.data){
            console.log(self.data[i]);
          }
        },
        error :function (res) {
          console.log(res,'e');
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
  border: 2px solid #42b983;
  border-radius: 3px;
  background-color: #fff;
}

th {
  background-color: #42b983;
  color: rgba(255,255,255,0.66);
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

td {
  background-color: #f9f9f9;
}

th, td {
  min-width: 120px;
  padding: 10px 20px;
}

th.active {
  color: #fff;
}

th.active .arrow {
  opacity: 1;
}

.arrow {
  display: inline-block;
  vertical-align: middle;
  width: 0;
  height: 0;
  margin-left: 5px;
  opacity: 0.66;
}

.arrow.asc {
  border-left: 4px solid transparent;
  border-right: 4px solid transparent;
  border-bottom: 4px solid #fff;
}

.arrow.dsc {
  border-left: 4px solid transparent;
  border-right: 4px solid transparent;
  border-top: 4px solid #fff;
}

</style>
