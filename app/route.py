from flask import Blueprint
from .controller import *
from app import app

#LOGIN
@app.route('/api/products', methods=['GET'])
def showTravelAgents():
    return showProducts()

@app.route('/api/packages/<travelagent_id>', methods=['GET'])
def showPaket(travelagent_id):
    return showPackages(travelagent_id)

@app.route('/api/package/<paket_travelagent_id>', methods=['GET'])
def showPaketSatu(paket_travelagent_id):
    return showPackage(paket_travelagent_id)

@app.route('/api/products/<travelagent>', methods=['GET'])
def showTravelAgent(travelagent):
    return showProduct(travelagent)

@app.route('/api/login', methods=['POST'])
def masuk():
    return login()

@app.route('/api/register', methods=['POST'])
def daftar():
    return register()

@app.route('/api/booking', methods=['POST'])
def bookingtravel():
    return booking()

@app.route('/api/testemail', methods=['POST'])
def test():
    return testemail()

@app.route('/api/register/agent', methods=['POST'])
def tambahAgent():
    return registerAgent()

@app.route('/api/delete/agent/<id>', methods=['DELETE'])
def hapusAgent(id):
    return deleteAgent(id)