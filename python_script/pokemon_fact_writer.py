import json

with open('pokemon_data.json') as poke_data:
    d = json.load(poke_data)
    pokemon_list = []
    type_list = []
    move_list = []
    for i in d :
        name =  i['name']
        pokemon_fact = 'pokemon('+name.lower()+').'
        pokemon_list.append(pokemon_fact)
        moves = i['moves']
        for m in moves :
            move = m['name']
            move_list.append('have('+name.lower()+','+move.lower()+').')
        types = i['types']
        for t in types :
            type = t['name']
            type_list.append('type('+name.lower()+','+type.lower()+').')
    out = open('pokefactrule.pl','w+')
    for i in pokemon_list :
        out.write(i+'\n')
    for i in type_list :
        out.write(i+'\n')
    for i in move_list :
        out.write(i+'\n')
    out.close()
