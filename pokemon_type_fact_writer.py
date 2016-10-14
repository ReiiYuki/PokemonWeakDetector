import json
with open('pokemon_type.json') as poke_data:
    effective_list = []
    typel = ["normal","fighting","flying","poison","ground","rock","bug","ghost","steel","fire","water","grass","electric","psychic","ice","dragon","dark","fairy"]
    d = json.load(poke_data)

    for i in d :
        type = i['name']
        type_list.append('type('+type.lower()+').')
        type_list = []
        for ie in i['ineffective'] :
            ineff = ie['name']
            type_list.append(ineff)
            effective_list.append('effective('+type.lower()+','+ineff.lower()+',0.5).')
        for se in i['super_effective'] :
            sueff = se['name']
            type_list.append(sueff)
            effective_list.append('effective('+type.lower()+','+sueff.lower()+',2).')
        for no in i['no_effect'] :
            noeff = no['name']
            type_list.append(noeff)
            effective_list.append('effective('+type.lower()+','+noeff.lower()+',0).')
        for n in typel :
            if n not in type_list :
                print (n['name'])
