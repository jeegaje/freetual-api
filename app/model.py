from typing import Counter
from sqlalchemy import create_engine, Column, Integer, String, Date, DateTime, ForeignKey
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base

engine = create_engine('mysql+mysqlconnector://admin:freetual123@freetual-team.cqjy1ve55cev.ap-southeast-1.rds.amazonaws.com:3306/holiyey', echo = True)
Session = sessionmaker(bind=engine)
session = Session()
Base = declarative_base()

class akun(Base):
   __tablename__ = 'akun'
   akun_id = Column(String, primary_key =  True)
   nama_lengkap = Column(String)
   email = Column(String)
   sandi = Column(String)
   nomor_hp = Column(String)

class travelagents(Base):
   __tablename__ = 'travelagents'
   travelagent_id = Column(String, primary_key =  True)
   nama = Column(String)
   lokasi = Column(String)

class paket_travelagent(Base):
   __tablename__ = 'paket_travelagent'
   paket_travelagent_id = Column(String, primary_key =  True)
   nama = Column(String)
   lokasi = Column(String)
   keterangan = Column(String)
   harga = Column(String)
   travelagent_id = Column(String)

class pemesanan(Base):
   __tablename__ = 'pemesanan'
   pemesanan_id = Column(String, primary_key =  True)
   nama_lengkap = Column(String)
   nomor_handphone = Column(String)
   alamat = Column(String)
   email = Column(String)
   nama_travelagent = Column(String)
   nama_paket = Column(String)
   keterangan_paket = Column(String)
   lokasi_paket = Column(String)
   harga_paket = Column(String)
   paket_travelagent_id = Column(String)
   travelagent_id = Column(String)
