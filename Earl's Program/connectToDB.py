import pyodbc
import getpass

server= 'arcgissql'
database = 'FCSA_ENG_PM_TEST'
username = "pythonConnect"
password = "IHopeThisWorks954"

connectionString = (
    f'DRIVER={{ODBC Driver 17 for SQL Server}};'
    f'SERVER={server};DATABASE={database};UID={username};PWD={password};'
    'TrustServerCertificate=yes;'
)

conn = pyodbc.connect(connectionString)

SQL_QUERY = """
SELECT * FROM dbo.tbl_FeeTypes
"""

cursor = conn.cursor()
cursor.execute(SQL_QUERY)

for row in cursor:
    print(f'{row[0]} : {row[1]}')

# records = cursor.fetchall()
# print(records[0][1])