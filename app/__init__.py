from flask import Flask
from flask_cors import CORS
from flask_mail import Mail
from logging import FileHandler, WARNING

app = Flask(__name__)

app.config['MAIL_SERVER']='smtp.gmail.com'
app.config['MAIL_PORT'] = 465
app.config['MAIL_USERNAME'] = 'anggajiyanfajar@gmail.com'
app.config['MAIL_PASSWORD'] = 'dzqalrmjjnbgbagb'
app.config['MAIL_USE_TLS'] = False
app.config['MAIL_USE_SSL'] = True
file_handler = FileHandler('errorlog.txt')
file_handler.setLevel(WARNING)
CORS(app)

mail = Mail(app)

from app import route