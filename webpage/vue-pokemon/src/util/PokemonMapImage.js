export default class PokemonMapImage  {
  constructor(pokemonlists){
    this.pokelists = pokemonlists
    this.map = new Map()
    for(let i in this.pokelists){
      this.map.set(this.pokelists[i].text,this.pokelists[i].value)
    }
  }
  convert(text){
    return this.map.get(text)
  }
}
