import csv
import json

moves = open('moves.csv',"r")
reader = csv.reader(moves)
moves_type = open('types.csv',"r")
reader_type = csv.reader(moves_type)
LIST_TYPE = []
# print(len(moves_type.readlines()))
next(reader_type,None)
for row in reader_type:
    move_type = {"type_id":row[0],"move":row[1]}
    LIST_TYPE.append(move_type)
    # print(move_type)


merge_type_move = open('moves_type.json',"w")
# print()
# print(LIST_TYPE)
next(reader,None)
# 0 id
# 1 identifier
# 2 generation_id
# 3 type_id
# 4 power
# 5 pp
# 6 accuracy
# 7 priority
# 8 target_id
# 9 damage_class_id
# 10 effect_id
# 11 effect_chance
# 12 contest_type_id
# 13 contest_effect_id
# 14 super_contest_effect_id
#
LIST_MOVE_TYPE = []
for row in reader:
    mv_type = ""
    for t in LIST_TYPE:
        if t["type_id"] == row[3]:
            mv_type = t["move"]
            break
    power = row[4]
    accuracy = row[6]
    pp = row[5]
    priority = row[7]
    move = {
        "id":int(row[0]),
        "move_name":row[1],
        "type":mv_type,
        "power":power,
        "pp":pp,
        "accuracy":accuracy,
        "priority":priority,
    }
    temp = json.dumps(move)
    print(temp)
    LIST_MOVE_TYPE.append(move)

    merge_type_move.write(temp+",\n")

print(LIST_MOVE_TYPE[0:1])
# json.dumps(LIST_MOVE_TYPE,merge_type_move,indent=4)
