import pyodbc
import getpass
from flask import Flask, render_template, jsonify
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

@app.route("/api/<target>")
def query(target):
    allowed_tables = {"feetypes", "fees", "lots", "projects"}
    if target.lower() not in allowed_tables:
        return jsonify({"error": "Invalid table"}), 400
    sqlQuery = f"SELECT * FROM dbo.tbl_{target}"
    cursor = conn.cursor()
    cursor.execute(sqlQuery)
    columns = [desc[0] for desc in cursor.description]
    results = []
    for row in cursor:
        results.append(dict(zip(columns, row)))
    return jsonify(results)

# @app.route("/<target>")
# def query(target):
#     allowed_tables = {"feetypes", "fees", "lots", "projects"}
#     if target.lower() not in allowed_tables:
#         return "Invalid table", 400
#     sqlQuery = f"SELECT * FROM dbo.tbl_{target}"
#     cursor = conn.cursor()
#     cursor.execute(sqlQuery)
#     results = []
#     for row in cursor:
#         results.append(" | ".join(str(col) for col in row))
#     return "<br>".join(results)

if __name__ == '__main__':
    app.run(debug=True)
