import requests
import json
f = open('pokemon_move01.json',"w+")
# f.write("[")
for i in range(1875,1876):
    url ="https://phalt-pokeapi.p.mashape.com/move/"+str(i)+"/"
    response = requests.get(url,headers={
        "X-Mashape-Key": "3xqT1p932vmshgU4N82Ol7tqL6tsp1xtuwnjsnBwdUp1iaeopI",
        "Accept": "application/json"
        })
    res = response.json()
    json.dump(res,f,indent=4)
    f.write("\n,\n")
    print ("move no."+str(i))
f.write("]")
