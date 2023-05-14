from Database.db import db,my_cursor
from Services.prediction_services import disease_order
import pickle
import numpy as np

def login_function(email,password):
    my_cursor.execute(f'''
            SELECT email FROM PATIENT 
            WHERE email='{email}' AND P_Password ='{password}'
''')
    record = my_cursor.fetchone()
    print('record : ',record)
    if(record == None):
        return False
    else:
        return True  
    
def registration_function(name,email,password,age,phone):
    try:
        record  = [name,age,email,phone,password]
        my_cursor.execute('''
            INSERT INTO PATIENT(P_Name,age,email,phone,P_Password) 
            VALUES (%s,%s,%s,%s,%s)''', record)
        db.commit()
        return True
    except:
        return False
    

def get_precautions(disease):
    my_cursor.execute(f'''
            SELECT Precaution_1, Precaution_2, Precaution_3, Precaution_4
            FROM Precautions 
            WHERE Disease_name = "{disease}"
                ''')
    p_list = my_cursor.fetchone()

    return p_list
    

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
    disease_no = model.predict([features])

    disease  = disease_order[disease_no[0]]
    return disease

def view_medical_history(email):
    my_cursor.execute(f'''
        SELECT DISTINCT PD.Datee, DOC.DNAME, D.DISEASE_NAME, PD.treatment 
        FROM patient_disease AS PD
        INNER JOIN doctor AS DOC ON DOC.DOC_ID = PD.DOC_ID
        INNER JOIN disease AS D ON D.DISEASE_ID = PD.DISEASE_ID 
        iNNER JOIN patient AS P ON P.P_SSN = PD.P_SSN
        WHERE P.Email = '{email}'
                            ''')

    records = my_cursor
    med_his = []

    for i in records:
        d = {}
        d['date'] = i[0]
        d['doctor'] = i[1]
        d['diagnosis'] = i[2]
        d['treatment'] = i[3]
        med_his.append(d)

    print(med_his)
    return med_his
    # print(my_cursor.fetchall())

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
    
    print(patient_id,doctor_id)

    record = [date,time,patient_id[0],doctor_id[0]]
    my_cursor.execute('''
                INSERT INTO APPOINTMENT(APPOINT_DATE,APPOINT_TIME,P_SSN,DOC_ID)
                VALUES (%s,%s,%s,%s)''',record)
    db.commit()