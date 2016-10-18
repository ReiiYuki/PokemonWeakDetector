from flask import Flask,request,jsonify
from pyswip import Prolog
from flask.ext.cors import CORS, cross_origin

app = Flask(__name__)
cors = CORS(app)
app.config['CORS_HEADERS'] = 'Content-Type'

@app.route('/', methods=['POST'])
@cross_origin()
def get_result():
   pokemon = request.json['pokemon']
   prolog = Prolog()
   prolog.consult('src/engine.pl')
   re_list = list(prolog.query('pokerule:beat(Pokemon,Move,'+pokemon+')'))
   poke_list = []
   temp = {"Pokemon":"",'Moves':[]}
   for i in re_list :
      if temp['Pokemon'] != i['Pokemon'] :
         temp['Moves'] = list(set(temp['Moves']))
         poke_list.append(temp)
         temp = {"Pokemon":i['Pokemon'],"Moves":[]}
         temp["Moves"].append(i['Move'])
      else :
         temp["Moves"].append(i['Move'])
   temp['Moves'] = list(set(temp['Moves']))
   poke_list.append(temp)
   return jsonify(poke_list[1:len(poke_list)])

if __name__ == '__main__':
   app.run('0.0.0.0',9999)
