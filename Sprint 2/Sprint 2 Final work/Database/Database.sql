USE my_health_mate;
CREATE TABLE HOSPITAL
(
	HOSP_ID INT primary key auto_increment,
    HOSP_NAME VARCHAR(100) ,
    COUNTRY VARCHAR(100),
    ADDRESS VARCHAR(1000)
);

CREATE TABLE MEDICINE
(
    MED_NO int PRIMARY KEY auto_increment,
    MED_NAME VARCHAR(20) NOT NULL,
    PRICE INT,
    EXP_DATE DATE,
    Mg_Med varchar(23)
);

CREATE TABLE DOCTOR
(
    DOC_ID int PRIMARY KEY auto_increment,
    DNAME VARCHAR(30),
    GENDER CHAR(1),
    QUALIFICATION VARCHAR(30),
    JOB_SPECIFICATION VARCHAR(30),
    HOSP_ID INT,
    FOREIGN KEY (HOSP_ID) REFERENCES HOSPITAL(HOSP_ID)
);

CREATE TABLE PATIENT
(
    P_SSN int PRIMARY KEY auto_increment,
    P_Name VARCHAR(50),
    age INTEGER,
    Email varchar(255),
    phone int(11),
    P_Password varchar(255)
);

CREATE TABLE DISEASE(
	DISEASE_ID INT PRIMARY KEY AUTO_INCREMENT,
    DISEASE_NAME VARCHAR(40)
);

CREATE TABLE PATIENT_DISEASE(
	P_SSN int,
	DISEASE_ID int,
	FOREIGN KEY (P_SSN) REFERENCES PATIENT(P_SSN),
	FOREIGN KEY (DISEASE_ID) REFERENCES DISEASE(DISEASE_ID),
	PRIMARY KEY(P_SSN,DISEASE_ID)
);

-- Appointment Table
CREATE TABLE APPOINTMENT
(
    APPOINT_DATE DATE   NOT NULL,
    APPOINT_TIME time,
    P_SSN INT ,
    DOC_ID INT,
    FOREIGN KEY (P_SSN)  REFERENCES PATIENT(P_SSN),
    FOREIGN KEY (Doc_ID)  REFERENCES DOCTOR(DOC_ID),
    PRIMARY KEY(P_SSN,DOC_ID)
);
-- Visit Table
CREATE TABLE VISIT
(
	VISIT_ID int auto_increment primary KEY,
    VISIT_DATE DATE,
    P_SSN int,
    HOSP_ID INT,
    FOREIGN KEY (P_SSN) REFERENCES PATIENT (P_SSN),
    FOREIGN KEY (HOSP_ID) REFERENCES HOSPITAL (HOSP_ID)
    
);

-- Purchase Table
CREATE TABLE PURCHASE
(
    P_SSN int,
    MED_NO int,
    FOREIGN KEY (P_SSN) REFERENCES PATIENT (P_SSN),
    FOREIGN KEY (MED_NO) REFERENCES MEDICINE (MED_NO)
);

INSERT INTO HOSPITAL(HOSP_NAME,COUNTRY,ADDRESS) VALUES
("Mount Sinai Hospital", "Canada", "600 University Avenue, Toronto, ON M5G 1X5"),
("Mayo Clinic", "United States", "200 First St SW, Rochester, MN 55905"),
("Moorfields Eye Hospital", "United Kingdom", "162 City Rd, London EC1V 2PD"),
("Rambam Health Care Campus", "Israel", "HaAliya HaShniya St 8, Haifa"),
("Charité - Universitätsmedizin Berlin", "Germany", "Charitépl. 1, 10117 Berlin"),
("Apollo Hospitals", "India", "21 Greams Lane, Off Greams Road, Chennai, Tamil Nadu 600006"),
("St. Mary's Hospital", "United States", "1216 2nd St SW, Rochester, MN 55902"),
("University Hospital Zurich", "Switzerland", "Raemistrasse 100, 8091 Zurich"),
("National Hospital for Neurology and Neurosurgery", "United Kingdom", "Queen Square, London WC1N 3BG"),
("Seoul National University Hospital", "South Korea", "101 Daehak-ro, Jongno-gu, Seoul"),
("Royal Brisbane and Women's Hospital", "Australia", "Butterfield St, Herston QLD 4029"),
("NewYork-Presbyterian Hospital", "United States", "525 E 68th St, New York, NY 10065"),
("Asan Medical Center", "South Korea", "88 Olympic-ro 43-gil, Songpa-gu, Seoul"),
("Princess Alexandra Hospital", "Australia", "199 Ipswich Rd, Woolloongabba QLD 4102"),
("Hospital Clínic Barcelona", "Spain", "Carrer de Villarroel, 170, 08036 Barcelona"),
("University of Tokyo Hospital", "Japan", "7-3-1 Hongo, Bunkyo City, Tokyo"),
("John Hunter Hospital", "Australia", "Lookout Rd, New Lambton Heights NSW 2305"),
("Massachusetts General Hospital", "United States", "55 Fruit St, Boston, MA 02114"),
("Aalborg University Hospital", "Denmark", "Hobrovej 18-22, 9100 Aalborg"),
("Sir Charles Gairdner Hospital", "Australia", "Hospital Ave, Nedlands WA 6009"),
("Peking Union Medical College Hospital", "China", "1 Shuaifuyuan, Wangfujing St, Dongcheng Qu, Beijing Shi"),
("Guy's and St Thomas' NHS Foundation Trust", "United Kingdom", "Great Maze Pond, London SE1 9RT"),
("CHU Sainte-Justine", "Canada", "3175 Chemin de la Côte-Sainte-Catherine, Montréal, QC H3T 1C5"),
("Samsung Medical Center", "South Korea", "81 Irwon-ro, Gangnam-gu, Seoul"),
("Royal Children's Hospital", "Australia", "50 Flemington Rd, Parkville VIC 3052"),
("Hospital Universitario La Paz", "Spain", "Paseo de la Castellana, 261, 28046 Madrid"),
("Sutter Health CPMC Davies Campus", "United States", "45 Castro St, San Francisco, CA 94114");


INSERT INTO MEDICINE(MED_NAME,PRICE,EXP_DATE,Mg_Med) VALUES
("Paracetamol", "100", "2023-06-30", "10mg"),
("Ibuprofen", "200", "2024-03-15", "20mg"),
("Aspirin", "250", "2022-12-31", "30mg"),
("Acetaminophen", "100", "2023-04-30", "40mg"),
("Naproxen", "200", "2024-08-15", "50mg"),
( "Codeine", "250", "2022-10-31", "60mg"),
("Tramadol", "100", "2023-02-28", "70mg"),
("Morphine", "200", "2024-01-15", "80mg"),
("Hydrocodone", "250", "2022-11-30", "90mg"),
("Oxycodone", "100", "2023-09-30", "100mg"),
("Gabapentin", "200", "2024-04-15", "110mg"),
("Pregabalin", "250", "2022-07-31", "120mg"),
( "Diclofenac", "100", "2023-03-31", "130mg"),
("Methadone", "200", "2024-02-15", "140mg"),
("Fentanyl", "250", "2022-11-30", "150mg"),
("Mirtazapine", "100", "2023-06-30", "160mg"),
("Sertraline", "200", "2024-03-15", "170mg"),
( "Fluoxetine", "250", "2022-12-31", "180mg"),
("Citalopram", "100", "2023-04-30", "190mg"),
("Venlafaxine", "200", "2024-08-15", "200mg"),
("Duloxetine", "250", "2022-10-31", "210mg"),
("Escitalopram", "100", "2023-02-28", "220mg"),
("Amitriptyline", "200", "2024-01-15", "230mg"),
("Bupropion", "250", "2022-11-30", "240mg"),
("Trazodone", "100", "2023-09-30", "250mg"),
("Olanzapine", "200", "2024-04-15", "260mg"),
("Risperidone", "250", "2022-07-31", "270mg"),
("Quetiapine", "100", "2023-03-31", "280mg"),
("Haloperidol", "200", "2024-02-15", "290mg"),
("Clozapine", "250", "2022-11-30", "300mg");

INSERT INTO PATIENT(P_Name,age,email,phone,P_Password) VALUES
( "John Smith", "35","john12@gmail.com","+2-305-540-20976","9Tf&cD#r@pNq"),
( "Sarah Lee", "27", "sarah12@gmail.com","+4-325-590-0987","$y6nBx!v#Gz"),
( "David Wong", "52","david12@gmail.com","+1-350-540-1291","P*m8cL@n#fVw"),
("Rachel Cohen", "44", "rachel12@gmail.com","+4-305-540-1223","J^e7bQ$t#kRc"),
("Andreas Müller", "63","andreas12@gmail.com","+9-312-567-8793","5Hg#dX6@zYj"),
("Ana Rodriguez", "9","ana12@gmail.com","+7-312-540-2763","U!v2wT#z$qK" ),
("Mohamed Ahmed", "41","mohamed12@gmail.com","+0-305-120-1498","C%r1s@f9#dJ"),
("Maryam Khan", "49","maryam12@gmail.com","+9-312-121-21223","N#h3Gx6@kFp"),
("Stefan Schneider", "56","stephen12@gmail.com","+1-3123-0986-1234","8Zl&vS#q7cX"),
( "Sofia Martinez", "37", "sophia12@gmail.com","+2-785-123-9871","B*4WfL#m6tR"),
("Amir Ali", "33","amir12@gmail.com","+1-305-123-0987","Q!7nHc#j2vZ"),
("Emma Wilson", "29","emma12@gmail.com","+2-115-902-1234","K$9yVx#z5pN"),
("Juan Hernandez", "48","juan12@gmail.com","+9-123-098-1234","S#w2Nf9$qLr"),
("Fatima Ali", "41","fatima12@gmail.com","+3-111-540-176","Z!m7Kd#r4hX"),
("Kim Sung", "57", "skim12@gmail.com","+2-225-123-9876","A$6vTc#p5qJ"),
("Laila Ahmed", "24","laila12@gmail.com","+4-344-1345-1093","F#b8Hg7@nXk"),
("Paolo Rossi", "60","paolo12@gmail.com","+1-115-085-22343","D!x2Lc#t6sZ"),
("Anna Nguyen", "31", "anna12@gmail.com","+1-441-134-1209","O%p9Gq#r4kT"),
("Ahmed Khan", "53", "ahmed12@gmail.com","+1-325-0945-2712","R@3fNv#m8jC"),
("Maria Garcia", "39", "maria12@gmail.com","+2-120-230-127","Y#h6Wt5$pLg"),
( "Tariq Malik", "46", "tariq12@gmail.com","+3-305-513-2098","I!u7Qc#f2sZ"),
( "Jennifer Kim", "28", "jennifier12@gmail.com","+1-094-120-1398","X$4mPb#n6kF"),
("Mohammed Ali", "50","ali12@gmail.com","+2-223-540-4578","T#g5Sf6@qLp"),
("Laura Perez", "42", "laura12@gmail.com","+2-315-523-0915","U!v9Nc#j4xR"),
("Daniel Kim", "19",  "deniel2@gmail.com","+4-234-097-2723","E$2hDm#k5sV"),
( "Megan Johnson", "32", "megan12@gmail.com","+2-985-270-8741","B*4vMq#p6cR"),
("Ali Hassan", "43","hassan12@gmail.com","+3-333-530-2763","P!j2Nf#t5rK"),
("Emily Jones", "25","jones12@gmail.com","+3-333-450-0973","G%9dLc#r7hX"),
("Abdullah Ibrahim", "36", "abdullah12@gmail.com","+2-344-543-25678","Y!t7Hc#m8nX"),
("Hannah Brown", "21", "hannah12@gmail.com","+1-986-222-1246","F#p8Gt6@qNc");

INSERT INTO DOCTOR(DNAME,GENDER,QUALIFICATION,JOB_SPECIFICATION,HOSP_ID) VALUES 
("Dr. John Smith", "M", "MD", "Cardiologist", 1),
("Dr. Sarah Lee", "F", "DO", "Neurologist", 2),
("Dr. David Wong", "M", "MBBS", "Ophthalmologist",3),
("Dr. Rachel Cohen", "F", "MD", "General Surgeon", 4),
("Dr. Andreas Müller", "M", "MD", "Internal Medicine Specialist", 3),
("Dr. Ana Rodriguez", "F", "MD", "Pediatrician", 2),
("Dr. Mohamed Ahmed", "M", "MBBS", "ENT Specialist", 1),
("Dr. Maryam Khan", "F", "MD", "Oncologist",5),
("Dr. Stefan Schneider", "M", "MD", "Orthopedic Surgeon", 6),
("Dr. Sofia Martinez", "F", "MD", "Dermatologist",7),
("Dr. Amir Ali", "M", "MBBS", "Gastroenterologist", 8),
("Dr. Emma Wilson", "F", "DO", "Physical Therapist",9),
("Dr. Juan Hernandez", "M", "MD", "Urologist",1),
("Dr. Fatima Ali", "F", "MD", "Radiologist", 2),
("Dr. Kim Sung", "M", "MD", "Pulmonologist", 12),
("Dr. Laila Ahmed", "F", "MBBS", "General Practitioner",13),
("Dr. Paolo Rossi", "M", "MD", "Cardiothoracic Surgeon",16),
("Dr. Anna Nguyen", "F", "DO", "Rheumatologist",10),
("Dr. Ahmed Khan", "M", "MD", "Endocrinologist", 11),
("Dr. Maria Garcia", "F", "MD", "Psychiatrist", 12),
("Dr. Tariq Malik", "M", "MBBS", "Hematologist", 20),
("Dr. Jennifer Kim", "F", "DO", "Allergist", 19),
("Dr. Mohammed Ali", "M", "MD", "Plastic Surgeon", 20),
("Dr. Laura Perez", "F", "MD", "Infectious Disease Specialist", 7);

INSERT INTO APPOINTMENT(APPOINT_DATE,APPOINT_TIME,P_SSN,DOC_ID) VALUES
( "2023-04-01", "09:00:00", 1,2),
("2023-04-02", "10:30:00", 2,5),
( "2023-04-03", "12:00:00", 3,7),
( "2023-04-04", "13:30:00", 4,8),
( "2023-04-05", "15:00:00", 5,9),
( "2023-04-06", "16:30:00",6,12),
("2023-04-07", "09:00:00", 7,13),
("2023-04-08", "10:30:00", 8,9),
("2023-04-09", "12:00:00", 9,12),
("2023-04-10", "13:30:00", 10,7),
("2023-04-11", "15:00:00", 11,15),
("2023-04-12", "16:30:00",12,8),
( "2023-04-13", "09:00:00", 13,10),
("2023-04-14", "10:30:00", 14,20),
( "2023-04-15", "12:00:00", 15,13),
("2023-04-16", "13:30:00", 16,6),
("2023-04-17", "15:00:00", 17,19),
( "2023-04-18", "16:30:00", 18,1),
("2023-04-19", "09:00:00", 19,3),
( "2023-04-20", "10:30:00", 20,2),
( "2023-04-21", "12:00:00", 21,13),
("2023-04-22", "13:30:00", 22,9),
("2023-04-23", "15:00:00", 23,12),
("2023-04-24", "16:30:00", 24,20),
("2023-04-25", "09:00:00", 5,18),
( "2023-04-26", "10:30:00", 6,3),
("2023-04-27", "12:00:00", 1,4),
("2023-04-28", "13:30:00", 2,8),
("2023-04-29", "15:00:00", 3,5),
("2023-04-30", "16:30:00", 4,12);


INSERT INTO VISIT(VISIT_DATE,P_SSN,HOSP_ID) VALUES
( "2023-03-25", "1", 1),
("2023-04-25", "2", 1),
("2023-05-25", "3", 2),
("2023-06-25", "4", 3),
("2023-07-25", "5", 2),
("2023-08-25", "6",4),
("2023-09-25", "7", 5),
("2023-10-25", "8", 5),
( "2023-11-25", "9", 6),
("2023-12-25", "10", 8),
( "2022-1-25", "11", 7),
("2022-03-25", "12", 3),
( "2022-04-25", "13", 10),
("2022-05-25", "14", 11),
("2022-05-25", "15",5),
("2022-06-25", "16", 8),
("2022-07-25", "16", 7),
("2024-08-25", "16", 4),
("2024-09-25", "17", 1),
("2024-10-25", "18",6),
("2022-08-25", "18", 9),
("2022-09-25", "19", 12),
("2021-08-25", "20", 15),
("2021-10-25", "24", 16),
("2023-03-25", "23", 17),
("2021-01-25", "24", 19),
("2021-01-25", "12", 26),
("2020-06-25", "10", 27),
("2020-01-25", "10", 6),
("2020-08-25", "17", 12);


INSERT INTO PURCHASE VALUES
("1", 5),
("2",6),
("3", 8),
("4", 9),
("5", 10),
("6", 12),
("7", 15),
("8", 13),
("9",18),
("10", 23),
("1", 26),
("2", 30),
("3", 12),
("4", 29),
("5", 12),
("6", 11),
("7", 17),
("8", 28),
("9", 12),
("10", 6),
("1", 9),
("2", 2),
("3", 12),
("4", 11),
("5",10),
("6", 6),
("7", 5),
("8", 19),
("9",18),
("10", 16);

Insert into DISEASE(DISEASE_NAME) Values
 ("Drug Reaction"), 
 ("Malaria"), 
 ("Allergy"), 
 ("Hypothyroidism"),
 ("Psoriasis"), 
 ("GERD"), 
 ("Chronic cholestasis"),
 ("hepatitis A"), 
 ("Osteoarthristis"),
 ("(vertigo) Paroymsal Positional Vertigo"), 
 ("Hypoglycemia"),
 ("Acne"), 
 ("Diabetes"),
 ("Impetigo"), 
 ("Hypertension"), 
 ("Peptic ulcer diseae"), 
 ("Dimorphic hemorrhoids(piles)"),
 ("Common Cold"),
 ("Chicken pox"), 
 ("Cervical spondylosis"), 
 ("Hyperthyroidism"),
 ("Urinary tract infection"), 
 ("Varicose veins"),
 ("AIDS"),
 ("Paralysis (brain hemorrhage)"), 
 ("Typhoid"),
 ("Hepatitis B"), 
 ("Fungal infection"), 
 ("Hepatitis C"), 
 ("Migraine"),
 ("Bronchial Asthma"),
 ("Alcoholic hepatitis"), 
 ("Jaundice"), 
 ("Hepatitis E"), 
 ("Dengue"), 
 ("Hepatitis D"), 
 ("Heart attack"), 
 ("Pneumonia"), 
 ("Arthritis"), 
 ("Gastroenteritis"), 
 ("Tuberculosis");

 INSERT INTO PATIENT_DISEASE VALUES
(1, 2), (2, 3), (3, 4), (4, 5), (5, 6), 
(6, 7), (7, 8),
 (8, 9), (9, 10), 
(10, 11), (11, 12), 
(12, 13),(13, 14), (14, 15),
 (15, 16), (16, 17), (17, 18), (18, 19), (19, 20),
(20, 21), (21, 22), (22, 23), (23, 24), (24, 25), 
(25, 26), (26, 27), (27, 28), (28, 29), (29, 30), (30, 31);