import json
with open('moves_type.json') as poke_data:
    move_list = []
    type_list = []
    d = json.load(poke_data)
    for i in d :
        move = i['move_name']
        type = i['type']
        move_list.append('move('+move.lower()+').')
        type_list.append('have_type('+move.lower()+','+type.lower()+').')
    out = open('movefact.pl','w')
    for i in type_list :
        out.write(i+'\n')
    for i in move_list :
        out.write(i+'\n')
    out.close()
