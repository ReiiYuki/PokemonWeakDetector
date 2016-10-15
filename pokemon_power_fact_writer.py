import json

with open('pokemon_move.json') as poke_data:
    d = json.load(poke_data)
    power_list = []
    for i in d :
        power_list.append('power('+(i['name']).lower()+','+str(i['power'])+').')
    out = open('powerfact.pl','w')
    for i in power_list :
        out.write(i+'\n')
    out.close()
