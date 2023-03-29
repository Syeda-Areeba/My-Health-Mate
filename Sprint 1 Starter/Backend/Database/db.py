import mysql.connector

db = mysql.connector.connect(
    host="localhost",
    user='root', 
    password = 'root',
    database= 'my_health_mate')

my_cursor = db.cursor()

# my_cursor.execute('DESCRIBE doctor')
# my_cursor.execute('INSERT INTO PATIENT (P_SSN,FNAME) VALUES (%s,%s)',('2','abc'))
# db.commit()

# l = [('4','xyz'),('5','lmn'),('6','pqr')]

# #insertion
# for i in l:
#     my_cursor.execute('INSERT INTO PATIENT (P_SSN,FNAME) VALUES (%s,%s)',i)
#     db.commit()

# name = 'John'
# l = [name]
# print(l)
# my_cursor.execute("SELECT FNAME,LName FROM patient WHERE FNAME = %s",[name])
# f,l = my_cursor.fetchone()
# print(f'FNAME={f} LNAME={l}')

# P_id = '106'
# fname = 'Joey'
# lname = 'Wattson'
# age = 13
# gender = 'F'
# rec_ID = '307'
# print(f'''
#     INSERT INTO PATIENT VALUES ({P_ID},{fname},{lname},{age},{gender},{rec_ID})
#                             ''')
# record  = [P_id,fname,lname,age,gender,rec_ID]
# my_cursor.execute(f'''
    # INSERT INTO PATIENT VALUES ({P_id},{fname},{lname},{age},{gender},{rec_ID})
                            # ''')

# my_cursor.execute('INSERT INTO PATIENT VALUES (%s,%s,%s,%s,%s,%s)',record)
# my_cursor.execute('SELECT * FROM PATIENT')
# print(my_cursor.fetchall())


# print(my_cursor.fetchmany(4))
# print(my_cursor.fetchone()) #for one line output
# print(my_cursor.fetchall())


# for x in my_cursor:  # to show all records
#     print(x)

# for i,x in enumerate(my_cursor):
#     if(i<5):
#         print(x)
#     else:
#         break