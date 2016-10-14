import json

data = open('../data/pokemon_data.json','r')
reader = json.load(data)
out = open('pokemon_name.json',"w")
LIST = []
for row in reader:
    name = {"name":row["name"]}
    LIST.append(name)
    print(name)
json.dump(LIST,out,indent=4)
