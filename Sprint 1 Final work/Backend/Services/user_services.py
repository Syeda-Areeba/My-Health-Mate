from Database.db import db,my_cursor
import pickle
import numpy as np

def login_fucntion(email,password):
    my_cursor.execute(f'''
            SELECT email FROM Patient WHERE email='{email}' and password='{password}'
                        ''')
    record = my_cursor.fetchone()
    print('record : ',record)
    if(record == None):
        return False
    else:
        return True  
    
def registration_fucntion(name,email,password,age,phone):
    try:
        record  = [name,email,password,age,phone]
        my_cursor.execute('INSERT INTO PATIENT VALUES (%s,%s,%s,%s,%s)',record)
        db.commit()
        return True
    except:
        return False
    

def predict_disease(patient_symps):
    symptom_dict = {}
    my_cursor.execute('SELECT Symptom_Name FROM Symptoms')
    
    for i in my_cursor:
        if(i[0] in patient_symps.keys()):
            symptom_dict[i[0]] = 1
        else:
            symptom_dict[i[0]] = 0

    model = pickle.load(open('.\ML_Models\RF_model.pkl','rb'))
    features = list(symptom_dict.values())
    # print(features)
    disease = model.predict([features])
    # print("Disease : ",)
    
    # print(disease)
    return str(disease[0])

def view_medical_history(email):
    my_cursor.execute(f'''
        SELECT * FROM patient_medical_history
        WHERE P_SSN = (SELECT P_SSN from Patient where email='{email}')
                            ''')
    print(my_cursor.fetchall())

def view_appointments(email):
    my_cursor.execute(f'''
        SELECT A.APPOINT_DATE,A.APPOINT_TIME,Patient.name,Doctor.DName,Hospital.HOSP_NAME 
        FROM Appointment as A
        INNER JOIN Patient ON Patient.P_SSN = A.P_SSN
        INNER JOIN Doctor ON Doctor.DOC_ID = A.DOC_ID
        INNER JOIN Hospital ON Hospital.HOSP_ID = Doctor.HOSP_ID
        WHERE A.P_SSN = (SELECT Patient.P_SSN from Patient WHERE Patient.email='{email}')
            ''')
    print(my_cursor.fetchall())


def schedule_appointment(email,doctor,time,date):
    my_cursor.execute(f"SELECT P_SSN FROM Patient WHERE email = '{email}'")
    patient_id = my_cursor.fetchone()

    my_cursor.execute(f"SELECT DOC_Id FROM Doctor WHERE DName = '{doctor}'")
    doctor_id = my_cursor.fetchone()

    print(patient_id[0],doctor_id[0])

    record = [date,time,patient_id[0],doctor_id[0]]
    my_cursor.execute('INSERT INTO APPOINTMENT VALUES (%s,%s,%s,%s)',record)
    db.commit()


