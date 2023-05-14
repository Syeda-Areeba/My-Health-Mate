import mysql.connector

db = mysql.connector.connect(
    host="localhost",
    user='root', 
    password = 'root',
    database= 'my_health_mate')

my_cursor = db.cursor()
