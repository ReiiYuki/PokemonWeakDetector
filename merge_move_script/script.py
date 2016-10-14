import csv

moves = open('moves.csv',"r")
reader = csv.reader(moves)
moves_type = open('types.csv',"r")
reader_type = csv.reader(moves_type)
LIST_TYPE = []
# print(len(moves_type.readlines()))
next(reader_type,None)
for row in reader_type:
    move_type = {"id":row[0],"move":row[1]}
    LIST_TYPE.append(move_type)
    print(move_type)


merge_type_move = open('moves_type.json')

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
for row in moves:
    
