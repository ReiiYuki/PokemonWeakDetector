import json
with open('pokemon_data.json') as poke_data:
    d = json.load(poke_data)
    stat_list = []
    for i in d :
        name = i['name']
        atk = i['attack']
        defe = i['defense']
        spatk = i['sp_atk']
        spdef = i['sp_def']
        spd = i['speed']
        hp = i['hp']
        base_stat = atk+defe+spatk+spdef+spd+hp
        stat_list.append('have_base_stat('+name.lower()+','+str(base_stat)+').')
    out = open('statfact.pl','w')
    for i in stat_list :
        out.write(i+'\n')
    out.close()
