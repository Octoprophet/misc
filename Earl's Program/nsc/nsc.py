import pyodbc, getpass
from flask import Flask, render_template, jsonify, request
app = Flask(__name__)

# Database credentials
server = 'arcgissql'
database = 'FCSA_ENG_PM_TEST'
username = "pythonConnect"
password = "IHopeThisWorks954"

# Connection info
connectionString = (
    f'DRIVER={{ODBC Driver 17 for SQL Server}};'
    f'SERVER={server};DATABASE={database};UID={username};PWD={password};'
    'TrustServerCertificate=yes;'
)

# Connect to database
conn = pyodbc.connect(connectionString)



# --------------------------------

@app.route("/")
def intro():
    return render_template('nsc.html')

@app.route("/fees")
def fees():
    return render_template('fees.html')

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')