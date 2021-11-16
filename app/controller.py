from flask import jsonify, request, render_template
from .model import akun, travelagents , paket_travelagent, pemesanan,session
from flask_mail import Message
from app import mail

import uuid

def testemail():
    messageRecipient = Message('Feedback Mongga', sender = 'anggajiyanfajar@gmail.com', recipients = ['anggajiyanfajar@gmail.com'])
    messageRecipient.html = render_template('mail.html', name='Angga')
    mail.send(messageRecipient)
    return jsonify(msg='pesan berhasil dibuat!')

def showProducts():
    database_data = session.query(travelagents).all()
    products = []
    for data in database_data:
        data = {
            'travelagent_id' : data.travelagent_id,
            'nama' : data.nama,
            'lokasi' : data.lokasi,
        }
        products.append(data)
    return jsonify(products)

def showProduct(input_nama):
    database_data = session.query(travelagents).filter(travelagents.nama==input_nama).first()
    if database_data==None:
        return jsonify(msg="Travel agent tidak dapat ditemukan")
    else:
        data = {
            'travelagent_id' : database_data.travelagent_id,
            'nama' : database_data.nama,
            'lokasi' : database_data.lokasi,
        }
        return jsonify(data)

def showPackages(id):
    database_data = session.query(paket_travelagent).filter(paket_travelagent.travelagent_id==id).all()
    packages = []
    if database_data==[]:
        return jsonify(msg="Paket Travel Agent Masih Belum Ada")
    else:
        for data in database_data:
            data = {
                'paket_travelagent_id' : data.paket_travelagent_id,
                'nama' : data.nama,
                'lokasi' : data.lokasi,
                'harga' : data.harga,
                'keterangan' : data.keterangan,
            }
            packages.append(data)
        return jsonify(packages)

def showPackage(id):
    database_data = session.query(paket_travelagent).filter(paket_travelagent.paket_travelagent_id==id).first()
    if database_data==None:
        return jsonify(msg="Paket Travel Agent Tidak Ditemukan")
    else:
        data = {
            'paket_travelagent_id' : database_data.paket_travelagent_id,
            'nama' : database_data.nama,
            'lokasi' : database_data.lokasi,
            'harga' : database_data.harga,
            'keterangan' : database_data.keterangan,
        }
        return jsonify(data)

def login():
    input_email = request.json.get('email')
    input_password = request.json.get('password')
    database_data = session.query(akun).filter(akun.email==input_email).first()
    if input_email==None or input_password==None:
        return jsonify(msg ='isi email dan password!')
    elif input_email=='' or input_password=='':
        return jsonify(msg ='isi email dan password!')
    elif database_data==None:
        return jsonify(msg='Akun tidak ditemukan! Daftar akun terlebih dahulu!')
    elif database_data.sandi!=input_password:
        return jsonify(msg='Password yang anda masukkan salah!')
    else:
        user_data = {
            'akun_id' : database_data.akun_id,
            'email' : database_data.email,
            'msg': 'Success'
        }
        return jsonify(user_data)

def register():
    input_email = request.json.get('email')
    input_sandi = request.json.get('password')
    input_sandi2 = request.json.get('password2')
    input_namalengkap = request.json.get('fullName')
    input_nomorhandphone = request.json.get('handphone')
    database_data = session.query(akun).filter(akun.email==input_email).first()
    if input_email==None or input_sandi==None or input_sandi2==None or input_namalengkap==None or input_nomorhandphone==None:
        return jsonify(msg ='isi semua data diri yang dibutuhkan!')
    elif input_email=='' or input_sandi=='' or input_sandi2=='' or input_namalengkap=='' or input_nomorhandphone=='':
        return jsonify(msg ='isi semua data diri yang dibutuhkan!')
    elif database_data!=None:
        return jsonify(msg='Email sudah terdaftar! Silahkan Login')
    elif input_sandi!=input_sandi2:
        return jsonify(msg='Password yang dimasukkan masih salah!')
    else:
        data_akun = {
            "akun_id" : uuid.uuid4().hex,
            "email" : input_email,
            "sandi" : input_sandi,
            "nama_lengkap" : input_namalengkap,
            "nomor_hp" : input_nomorhandphone,
        }
    session.add(akun(**data_akun))
    session.commit()
    return jsonify(msg='user berhasil dibuat!')

def booking():
    input_nama_lengkap = request.json.get('nama_lengkap')
    input_nomor_handphone = request.json.get('nomor_handphone')
    input_alamat = request.json.get('alamat')
    input_email = request.json.get('email')
    input_nama_travelagent = request.json.get('nama_travelagent')
    input_nama_paket = request.json.get('nama_paket')
    input_keterangan_paket = request.json.get('keterangan_paket')
    input_lokasi_paket = request.json.get('lokasi_paket')
    input_harga_paket = request.json.get('harga_paket')
    input_paket_travelagent_id = request.json.get('paket_travelagent_id')
    input_travelagent_id = request.json.get('travelagent_id')
    database_data = session.query(pemesanan).filter(akun.email==input_email).first()
    if input_nama_lengkap==None or input_nomor_handphone==None or input_alamat==None or input_email==None or input_nama_travelagent==None or input_nama_paket==None or input_keterangan_paket==None or input_lokasi_paket==None or input_harga_paket==None or input_paket_travelagent_id==None or input_travelagent_id==None:
        return jsonify(msg ='Isi semua data diri yang dibutuhkan!')
    elif input_nama_lengkap=='' or input_nomor_handphone=='' or input_alamat=='' or input_email=='' or input_nama_travelagent=='' or input_nama_paket=='' or input_keterangan_paket=='' or input_lokasi_paket=='' or input_harga_paket=='' or input_paket_travelagent_id=='' or input_travelagent_id=='':
        return jsonify(msg ='Isi semua data diri yang dibutuhkan!')
    else:
        data_pemesanan = {
            "pemesanan_id": uuid.uuid4().hex,
            "nama_lengkap": input_nama_lengkap,
            "nomor_handphone": input_nomor_handphone,
            "alamat": input_alamat,
            "email": input_email,
            "nama_travelagent": input_nama_travelagent,
            "nama_paket": input_nama_paket,
            "keterangan_paket": input_keterangan_paket,
            "lokasi_paket": input_lokasi_paket,
            "harga_paket": input_harga_paket,
            "paket_travelagent_id": input_paket_travelagent_id,
            "travelagent_id": input_travelagent_id,
        }
    session.add(pemesanan(**data_pemesanan))
    session.commit()

    messageRecipient = Message('HOLIYEY | Konfirmasi Pesanan', sender = 'anggajiyanfajar@gmail.com', recipients = [f'{input_email}'])
    messageRecipient.html = render_template('mail.html', nama=input_nama_lengkap, nomor_handphone=input_nomor_handphone, alamat=input_alamat, email=input_email, nama_travelagent=input_nama_travelagent, kode_travelagent=input_travelagent_id, nama_paket_travelagent=input_nama_paket, kode_paket_travelagent=input_paket_travelagent_id, harga_paket_travelagent=input_harga_paket, kode_pemesanan=data_pemesanan['pemesanan_id'])
    mail.send(messageRecipient)

    return jsonify(msg='Pemesanan berhasi dibuat!')

def registerAgent():
    input_nama_agent = request.json.get('nama_agent')
    input_lokasi = request.json.get('lokasi')
    database_data = session.query(travelagents).filter(travelagents.nama==input_nama_agent).first()
    if input_nama_agent==None or input_lokasi==None :
        return jsonify(msg ='isi semua data yang dibutuhkan!')
    elif input_nama_agent=='' or input_lokasi=='' :
        return jsonify(msg ='isi semua data yang dibutuhkan!')
    elif database_data!=None:
        return jsonify(msg='Agent sudah terdaftar!')
    else:
        data_agent = {
            "travelagent_id" : uuid.uuid4().hex,
            "nama" : input_nama_agent,
            "lokasi" : input_lokasi,
        }
    session.add(travelagents(**data_agent))
    session.commit()
    return jsonify(msg='Agent berhasil dibuat!')

def deleteAgent(id):
    database_data = session.query(travelagents).filter(travelagents.travelagent_id==id).first()
    if database_data==None:
        return jsonify(msg='Agent tidak ditemukan!')
    else:
        session.delete(database_data)
        session.commit()
        return jsonify(msg='Agent berhasil dihapus!')