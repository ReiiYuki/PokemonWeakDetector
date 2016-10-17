<template>
  <div>
    <img v-bind:src= "'src/assets/pokemon_sprites/'+item.value" />
    <div class="select_name_div">
      <basic-select :options="pokemon_name"
      :selected-option="item"
      @select="onSelect" v-bind:style="select_name_style">
    </basic-select>
  </div>
  <button type="button" @click="onSubmit" name="button">confirm</button>
</div>
</template>

<script>

import { vSelect } from "vue-select"
import { BasicSelect } from 'vue-search-select'
const END_POINT_SPRITE = '../../api/pokemon_name.json'
const END_POINT = 'http://localhost:9999/'
import 'whatwg-fetch'
export default {
  components: {vSelect,BasicSelect},
  created: function () {
    var self = this;
    $.ajax({
      url:END_POINT_SPRITE,
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
    },
    onSubmit(){
      let enemyName = this.item.text
      let pokemon = {"pokemon":enemyName}
      console.log(JSON.stringify(pokemon))
      var settings = {
        "async": true,
        "crossDomain": true,
        "url": "http://localhost:9999/",
        "method": "POST",
        "headers": {
          "content-type": "application/json",
          "authorization": "Basic YWRtaW46YWRtaW4=",
          "cache-control": "no-cache",
          "postman-token": "00a16689-6c01-8162-613d-18932c0b4a15"
        },
        "processData": false,
        "data": "{\n\"pokemon\":\"pikachu\"\n}"
      }

      $.ajax(settings).done(function (response) {
        console.log(response);
      });
      // var settings = {
      //   "async": true,
      //   "crossDomain": true,
      //   "url": "http://localhost:9999/",
      //   "method": "POST",
      //   "headers": {
      //     "content-type": "application/json",
      //     "authorization": "Basic YWRtaW46YWRtaW4=",
      //     "cache-control": "no-cache",
      //     "postman-token": "f99938bc-cc78-1d9b-5ca3-c0ba65547482"
      //   },
      //   "processData": false,
      //   "data": "{\n\"pokemon\":\"pikachu\"\n}"
      // }
      // $.ajax(settings).done(function (response) {
      //   console.log(response);
      // });
      // $.ajax({
      //   url        : END_POINT,
      //   method     : 'POST',
      //   contentType:    'application/json',
      //   dataType   : 'json',
      //   data       : JSON.stringify(pokemon),
      //   processData: false,
      //   success    : function (res) {
      //     console.log(res);
      //   },
      //   error :function (res) {
      //     console.log(res);
      //   }
      // })
      // fetch(END_POINT,
      //   {
      //     method: 'POST',
      //     headers: {
      //       'Accept': 'application/json',
      //       'Content-Type': 'application/json',
      //     },
      //     body: JSON.stringify(
      //       pokemon
      //     )
      //   }).then(function(response) {
      //     let promise = response.json()
      //     Promise.resolve(promise).then(function(value){
      //     console.log(value.token)
      //     onClose()
      //     })
      //     if (!response.ok) {
      //       throw Error(response.statusText);
      //     }
      //     return response;
        // }).catch(function(error) {
        //   console.log(error);
        // });

        // fetch(END_POINT,
        //          {
        //            method: 'POST',
        //            headers: {
        //              'Accept': 'application/json',
        //              'Content-Type': 'application/json',
        //            },
        //            body:JSON.stringify({
        //              pokemon
        //            })
        //          }).then(function(response) {
        //            if (!response.ok) {
        //              throw Error(response.statusText);
        //            }
        //            return response;
        //          }).then(function(response) {
        //            // console.log('parsed response', response)
        //            return response.json()
        //          }).then(function(json) {
        //            console.log('parsed json', json)
        //            self.setState({rice: json})
        //            console.log('stateset',self.state.rice);
        //          }).catch(function(ex) {
        //            // console.log('parsing failed', ex)
        //          });


    }
  },
}
</script>
<style scoped>
.select_name_div {
  display: inline-block;
  text-transform: capitalize;
}
</style>
