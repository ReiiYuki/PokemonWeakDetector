import json
with open('moves_type.json') as poke_data:
    d = json.load(poke_data)
    for i in d :
        print(i['name'])
