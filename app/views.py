from app import app
from flask import render_template, flash, redirect, jsonify
from app.db_conn import Data_table, View
from app.forms import LoginForm
from app.config import OPENID_PROVIDERS
import json


@app.route("/")
def hello_world():
    return render_template('index.html', title = 'Home')
 
 
@app.route('/data')
def users():
    articles = Data_table.query.all()
    return render_template('data_table.html', articles=articles)


@app.route("/get_view", methods = ['GET'])
def get_view():
    articles = View.query.all()
    json_data = json.dumps([{'extract':article.extract, 'total_value': article.total_value} for article in articles])
    return json_data



@app.route('/login', methods = ['GET', 'POST'])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        flash('Login requested for OpenID="' + form.openid.data + '", remember_me=' + str(form.remember_me.data))
        return redirect('/index')
    return render_template('signin.html', 
        title = 'Sign In',
        form = form,
        providers = OPENID_PROVIDERS)


@app.route("/sign_up")
def sign_up():
    return render_template('signup.html', title = 'Sign Up')

