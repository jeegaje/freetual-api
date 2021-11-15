from flask import Flask
from flask_cors import CORS
from flask_mail import Mail

app = Flask(__name__)

app.config['MAIL_SERVER']='smtp.gmail.com'
app.config['MAIL_PORT'] = 465
app.config['MAIL_USERNAME'] = 'anggajiyanfajar@gmail.com'
app.config['MAIL_PASSWORD'] = 'dzqalrmjjnbgbagb'
app.config['MAIL_USE_TLS'] = False
app.config['MAIL_USE_SSL'] = True

cors = CORS(app, resources={r"/api/*": {"origins": "*"}})
mail = Mail(app)

from app import route