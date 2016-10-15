import json

data = open('../data/pokemon_data.json','r')
reader = json.load(data)
out = open('pokemon_name.json',"w")
LIST = []
count = 1
for row in reader:
    name = {"value":str(count)+".png",
        "text":row["name"].lower()}
    count+=1
    LIST.append(name)
    print(name)
json.dump(LIST,out,indent=4)
