import requests

for i in range(1,719):
    url ="https://phalt-pokeapi.p.mashape.com/pokemon/"+str(i)+"/"
    response = requests.get(url,headers={
        "X-Mashape-Key": "AtHp2pPkyRmshQJuY7FVU6iff6Rgp1HfOZQjsn0sroX3FjwlIU",
        "Accept": "application/json"
        })
    print (response.json())
