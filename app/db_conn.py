from app import app
from flask_sqlalchemy import SQLAlchemy


db = SQLAlchemy(app)

class Data_table(db.Model):
    __tablename__ = 'data'
    time = db.Column(db.DateTime, primary_key=True)
    value = db.Column(db.Float)
    

class View(db.Model):
    __tablename__ = 'data_sum_min'
    extract = db.Column(db.Float, primary_key=True)
    total_value = db.Column(db.Float)

    def __repr__(self):
        return f'Article(extract={self.extract}, total_value={self.total_value})'



            