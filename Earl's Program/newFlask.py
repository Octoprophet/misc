import pyodbc
import getpass
from flask import Flask, render_template, jsonify, request
app = Flask(__name__)

#database credentials
server= 'arcgissql'
database = 'FCSA_ENG_PM_TEST'
username = "pythonConnect"
password = "IHopeThisWorks954"

#connection info
connectionString = (
    f'DRIVER={{ODBC Driver 17 for SQL Server}};'
    f'SERVER={server};DATABASE={database};UID={username};PWD={password};'
    'TrustServerCertificate=yes;'
)

#connect to database
conn = pyodbc.connect(connectionString)

#--------------------------------

@app.route("/")
def index():
    return render_template("fetch.html")

@app.route("/api/<target>")
def query(target):
    allowed_tables = {"feetypes", "fees", "lots", "projects"}
    if target.lower() not in allowed_tables:
        return jsonify({"error": "Invalid table"}), 400
    if target.lower() == "fees":
        sqlQuery = "select S.chrsize, FT.chrFeeType, F.FeeAmount from dbo.tbl_Fees F INNER JOIN dbo.tbl_Sizes S ON F.SizeID = S.ID INNER JOIN dbo.tbl_FeeTypes FT ON F.FeeType = FT.ID WHERE F.dtFeeEffective = '2025-03-17';"
    else:
        sqlQuery = f"SELECT * FROM dbo.tbl_{target}"
    cursor = conn.cursor()
    cursor.execute(sqlQuery)
    columns = [desc[0] for desc in cursor.description]
    results = []
    for row in cursor:
        results.append(dict(zip(columns, row)))
    return jsonify(results)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
