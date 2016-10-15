# PokemonWeakDetector

Web Application to find pokemon that can beat your or your opponent's pokemon.

##Structure
1. Knowledge Base

  We use prolog as our logical programming tool to store the knowledgebase fact and rule of pokemon.
2. RESTful Api

  Prolog is good. It has many module which support http request and response, but the most impressive me is it supports JSON.
3. Front-End

  Vue.js serve the web page. Why Vue.js? Because "Last year is Angular Year, This year is React year" Next year might be Vue2 year!!!!

##API Guidline to use it

1. Go to src.

  ```
  cd src
  ```
2. Type this in your bash.

  ```
  swipl engine.pl
  ```
3. Start the server

  ```
  server(__your port number__).
  ```
4. Now we can post json data which has `pokemon` with pokemon name to your address and port.

##Issue
Prolog is too damn difficult to find any answer so sad ;(

##Special Thank
Our data come from two of this, I don't any word more than "Thank you" for making our project finish. :D

https://pokeapi.co/

https://market.mashape.com/phalt/pokeapi
