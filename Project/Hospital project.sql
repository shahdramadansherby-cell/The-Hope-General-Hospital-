-- 1. إنشاء قاعدة البيانات 
CREATE DATABASE IF NOT EXISTS hospital_db;
USE hospital_db;

-- 2. جدول الأطباء (Doctors Table)
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100),
    gender VARCHAR(10),
    specialty VARCHAR(50),
    hourly_rate DECIMAL(10,2),
    overtime_rate DECIMAL(10,2),
    years_worked INT
);

-- 3. جدول المرضى (Patients Table)
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100),
    phone VARCHAR(20),
    dob VARCHAR(20),
    blood_type VARCHAR(10)
);

-- 4. جدول العلاجات (Treatments Table)
CREATE TABLE Treatments (
    treatment_id INT PRIMARY KEY AUTO_INCREMENT,
    treatment_name VARCHAR(100),
    cost DECIMAL(10,2),
    duration_minutes INT,
    doctor_id INT,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) ON DELETE SET NULL
);

-- 5. جدول سجلات العلاج للمرضى (Patient_Treatment Junction Table)
CREATE TABLE Patient_Treatment (
    treatment_record_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    treatment_id INT,
    treatment_date VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (treatment_id) REFERENCES Treatments(treatment_id) ON DELETE CASCADE
);

-- =========================================================
-- إدخال البيانات (50 صف لكل جدول مع وجود مشكلات لتنظيفها)
-- =========================================================

-- 1. إدخال 50 طبيب
INSERT INTO Doctors (full_name, gender, specialty, hourly_rate, overtime_rate, years_worked) VALUES
('Dr. Ahmed Ali', 'M', 'Cardiology', 150.00, 200.00, 5),
('DR. SARAH HASSAN', 'f', 'Neurology', 180.00, 220.00, 8),
('Omar Khaled', 'Male', 'Pediatrics', -50.00, 100.00, 2),
('Dr. Khaled Nabil', 'M', 'Orthopedics', 160.00, 190.00, 6),
('dr. mona zaki', 'Female', 'Cardiology', 170.00, 210.00, 4),
('Hassan Ibrahim', 'm', 'General Surgery', 200.00, 250.00, 12),
('DR. REEM SAMY', 'F', 'Pediatrics', -60.00, 110.00, 3),
('Tamer Hosny', 'Male', 'Neurology', 190.00, 230.00, 9),
('Dr. Youssef Elmasry', 'M', 'Orthopedics', 155.00, 185.00, 5),
('Aya Mustafa', 'female', 'General Surgery', 210.00, 260.00, 10),
('Dr. Mohamed Kamel', 'M', 'Cardiology', 175.00, 215.00, 7),
('DR. NOHA TAREK', 'Female', 'Dermatology', 140.00, 180.00, 4),
('Hany Adel', 'male', 'Pediatrics', -45.00, 90.00, 1),
('dr. sherif osman', 'M', 'Neurology', 195.00, 240.00, 11),
('Fatma Elzahraa', 'f', 'Dermatology', 130.00, 170.00, 3),
('Dr. Amr Gad', 'Male', 'Orthopedics', 165.00, 195.00, 6),
('DR. DINA FOUAD', 'F', 'General Surgery', -80.00, 230.00, 8),
('Mostafa Mahmoud', 'm', 'Cardiology', 185.00, 225.00, 9),
('Dr. Salma Reda', 'Female', 'Pediatrics', 135.00, 175.00, 2),
('Karim Abdelaziz', 'M', 'Neurology', 205.00, 255.00, 13),
('dr. rania tawfik', 'female', 'Dermatology', 145.00, 185.00, 5),
('DR. WALID SAMIR', 'Male', 'Orthopedics', 170.00, 200.00, 7),
('Eslam Nader', 'm', 'General Surgery', 190.00, 240.00, 8),
('Dr. Heba Magdy', 'F', 'Cardiology', 160.00, 200.00, 4),
('Yasser Gala', 'Male', 'Pediatrics', -55.00, 105.00, 3),
('DR. MARWA SABRY', 'f', 'Dermatology', 150.00, 190.00, 6),
('Ahmed Zewail', 'M', 'Neurology', 220.00, 270.00, 15),
('Dr. Laila Elwi', 'Female', 'Orthopedics', 175.00, 210.00, 8),
('dr. Tarek Lotfy', 'm', 'General Surgery', 205.00, 250.00, 10),
('Mai Ezzeldin', 'f', 'Cardiology', 165.00, 205.00, 5),
('Dr. Nabil Farouk', 'Male', 'Pediatrics', 140.00, 180.00, 4),
('DR. SOEHAIR RAMZY', 'F', 'Dermatology', -70.00, 160.00, 7),
('Hisham Abbas', 'm', 'Neurology', 185.00, 225.00, 8),
('Dr. Ghada Adel', 'female', 'Orthopedics', 160.00, 190.00, 5),
('Amir Karara', 'M', 'General Surgery', 215.00, 265.00, 11),
('dr. neveen ibrahim', 'F', 'Cardiology', 170.00, 210.00, 6),
('DR. BASEM YOUSSEF', 'Male', 'Pediatrics', 150.00, 190.00, 5),
('Sawsan Badr', 'f', 'Dermatology', 155.00, 195.00, 9),
('Dr. Ahmed Helmy', 'm', 'Neurology', 200.00, 250.00, 12),
('Mona Zaki II', 'Female', 'Orthopedics', 165.00, 195.00, 4),
('DR. KHALED ELSAWY', 'M', 'General Surgery', 210.00, 260.00, 10),
('dr. doaa farid', 'female', 'Cardiology', -65.00, 200.00, 3),
('Ramy Sabry', 'male', 'Pediatrics', 135.00, 170.00, 2),
('Dr. Yasmine Abdelaziz', 'F', 'Dermatology', 160.00, 200.00, 6),
('Mohamed Henedy', 'M', 'Neurology', 190.00, 230.00, 9),
('DR. HANY RAMZY', 'm', 'Orthopedics', 150.00, 180.00, 5),
('Ayman Zaki', 'Male', 'General Surgery', 225.00, 275.00, 14),
('Dr. Radwa Elsherbiny', 'Female', 'Cardiology', 180.00, 220.00, 7),
('dr. bassam samir', 'm', 'Pediatrics', 145.00, 185.00, 4),
('DR. SHIREEN AHMED', 'f', 'Dermatology', 150.00, 190.00, 5);

-- 2. إدخال 50 مريض
INSERT INTO Patients (full_name, phone, dob, blood_type) VALUES
('Mona Mahmoud', '01012345678', '1995-05-12', 'A+'),
(' mona mahmoud ', '01012345678', '1995-05-12', 'A+'),
('Kareem Youssef', '0119999888', '12/08/1990', 'o_pos'),
('Hoda Mansour', NULL, '2001-01-01', 'B-'),
('Yasser Ibrahim', '01234567890', '1988/11/20', 'AB_NEG'),
(' Fatma Said ', '01000112233', '1992-03-15', 'O+'),
('Kareem Youssef', '0119999888', '12/08/1990', 'o_pos'),
('Ali Reda', '01555443322', '1980-07-04', 'a_pos'),
('Nourhan Ahmed', NULL, '1998/09/30', 'B+'),
(' Mahmoud Hassan ', '01122334455', '1975-12-12', 'O_NEG'),
('Dina Samy', '01099887766', '2003-02-28', 'AB+'),
('Ali Reda', '01555443322', '1980-07-04', 'a_pos'),
('Samed Nabil', '01011112222', '1985-04-10', 'A-'),
('Sarah Othman', '01222233334', '15/06/1993', 'b_pos'),
(' Omar Farooq ', '01144445555', '1978-09-25', 'O+'),
('Eman Tawfik', NULL, '2000/12/05', 'ab_pos'),
('Hassan Fathy', '01055556666', '1991-01-18', 'A_NEG'),
('Laila Mourad', '01566667777', '1983/03/30', 'O+'),
('Mohamed Ashraf', '01177778888', '22-07-1996', 'b_neg'),
('Noha Elsayed', NULL, '1994-10-14', 'A+'),
('Ahmed Shawky', '01088889999', '1982/08/08', 'O_POS'),
('Mariam Samir', '01299990000', '1999-11-11', 'ab_neg'),
('Mostafa Kamel', '01100001111', '01/02/1987', 'B+'),
('Rania Youssef', NULL, '1992-05-20', 'A+'),
('Tarek Elsheikh', '01022223333', '1979/04/15', 'o_neg'),
('Yasmine Sabry', '01533334444', '1997-08-23', 'AB+'),
('Amr Diab', '01144446666', '1961-10-11', 'A+'),
('Nancy Ajram', NULL, '1983/05/16', 'O_POS'),
('Elissa Khoury', '01077779999', '1972-10-27', 'B-'),
('George Wassouf', '01288880000', '1961/12/23', 'a_neg'),
('Assala Nasri', '01111223344', '1969-05-15', 'AB_NEG'),
('Angham Mohamed', NULL, '1972-01-19', 'O+'),
('Saber Rebai', '01033445566', '1967/03/13', 'B+'),
('Wael Kfoury', '01544556677', '1974-09-14', 'a_pos'),
('Sherine Abdelwahab', '01155667788', '1980/10/08', 'o_pos'),
('Majid Almohandis', NULL, '1971-10-25', 'AB+'),
('Hussein Aljassmi', '01066778899', '1979-08-25', 'O_NEG'),
('Kazem Elsahir', '01277889900', '1957/09/12', 'A+'),
('Ramy Ayach', '01188990011', '1980-08-18', 'b_pos'),
('Carole Samaha', NULL, '1972/07/25', 'A_NEG'),
('Myriam Fares', '01099001122', '1983-05-03', 'O+'),
('Haifa Wehbe', '01500112233', '1976/03/10', 'AB_NEG'),
('Joseph Attieh', '01111335577', '1987-03-04', 'B-'),
('Melhem Zein', NULL, '1982-10-21', 'a_pos'),
('Fares Karam', '01022446688', '1973/06/25', 'o_pos'),
(' Diana Karazon ', '01233557799', '1983-10-30', 'O+'),
(' Diana Karazon ', '01233557799', '1983-10-30', 'O+'),
('Marwan Khoury', '01144668800', '1968/02/03', 'A-'),
('Yara Alahmadi', NULL, '1983-06-01', 'B+'),
('Rageh Dawood', '01055779911', '1954-04-22', 'AB+');

-- 3. إدخال 50 إجراء وعلاج طبي
INSERT INTO Treatments (treatment_name, cost, duration_minutes, doctor_id) VALUES
('Cardiac Angiography', 1200.00, 45, 1),
('Brain MRI Scan', 850.00, 30, 2),
('Pediatric Checkup', 200.00, 20, 3),
('Bone Fracture Alignment', 950.00, 60, 4),
('Echocardiogram', 500.00, 25, 1),
('Gallbladder Surgery', 2500.00, 90, 6),
('ECG Test', 150.00, 15, 5),
('Child Vaccination', 100.00, 10, 7),
('Spine CT Scan', 1100.00, 40, 8),
('Joint Replacement Evaluation', 400.00, 30, 9),
('Appendectomy Surgery', 2200.00, 75, 10),
('Neurological Consultation', 300.00, 25, 2),
('Skin Biopsy', 350.00, 20, 12),
('Coronary Artery Bypass', 5000.00, 180, 11),
('Dermatology Consultation', 250.00, 15, 15),
('Knee Arthroscopy', 1800.00, 50, 16),
('Hernia Repair Surgery', 2100.00, 80, 17),
('Holter Monitor Test', 400.00, 30, 18),
('Pediatric Asthma Treatment', 300.00, 25, 19),
('Brain EEG Test', 600.00, 45, 20),
('Laser Skin Treatment', 800.00, 30, 21),
('Hip Replacement Surgery', 4500.00, 120, 22),
('Thyroidectomy', 2800.00, 100, 23),
('Stress Test Cardiology', 450.00, 35, 24),
('Infant Growth Screening', 150.00, 15, 25),
('Acne Scar Removal', 500.00, 40, 26),
('Stroke Rehabilitation Evaluation', 700.00, 60, 27),
('Shoulder Fracture Alignment', 1000.00, 55, 28),
('Mastectomy Surgery', 3500.00, 110, 29),
('Heart Valve Evaluation', 600.00, 30, 30),
('Child Nutrition Consultation', 200.00, 20, 31),
('Eczema Treatment', 300.00, 20, 32),
('Epilepsy Management Test', 750.00, 50, 33),
('Ligament Repair Surgery', 2300.00, 85, 34),
('Gallstone Removal', 2600.00, 95, 35),
('Pacemaker Checkup', 500.00, 25, 36),
('Pediatric Allergy Test', 350.00, 30, 37),
('Psoriasis Treatment', 450.00, 25, 38),
('Migraine Management Consultation', 300.00, 20, 39),
('Spinal Fusion Surgery', 6000.00, 210, 40),
('Bariatric Consultation', 400.00, 30, 41),
('Angioplasty Follow-up', 800.00, 40, 42),
('Pediatric Fever Screening', 120.00, 15, 43),
('Chemical Peel Treatment', 600.00, 35, 44),
('Parkinson Disease Screening', 900.00, 50, 45),
('Ankle Fracture Evaluation', 850.00, 45, 46),
('Laparoscopic Cholecystectomy', 3000.00, 90, 47),
('Cardiac Ultrasound', 550.00, 30, 48),
('Childhood Vaccination Follow-up', 100.00, 10, 49),
('Hair Loss Treatment', 400.00, 25, 50);

-- 4. إدخال 50 زيارة علاجية (Patient_Treatment)
INSERT INTO Patient_Treatment (patient_id, treatment_id, treatment_date) VALUES
(1, 1, '2026-08-01'),
(2, 1, '2026-08-01'),
(3, 2, '02-08-2026'),
(4, 3, '2026-08-03'),
(5, 4, '2026-08-04'),
(6, 5, '2026-08-05'),
(7, 2, '02-08-2026'),
(8, 6, '2026-08-06'),
(9, 7, '2026-08-07'),
(10, 8, '2026-08-08'),
(11, 9, '2026-08-09'),
(1, 10, '2026-08-10'),
(3, 11, '2026-08-11'),
(5, 12, '2026-08-12'),
(13, 13, '2026/08/13'),
(14, 14, '14-08-2026'),
(15, 15, '2026-08-15'),
(16, 16, '2026-08-16'),
(17, 17, '17/08/2026'),
(18, 18, '2026-08-18'),
(19, 19, '2026-08-19'),
(20, 20, '20-08-2026'),
(21, 21, '2026-08-21'),
(22, 22, '2026/08/22'),
(23, 23, '2026-08-23'),
(24, 24, '24-08-2026'),
(25, 25, '2026-08-25'),
(26, 26, '2026-08-26'),
(27, 27, '27/08/2026'),
(28, 28, '2026-08-28'),
(29, 29, '2026-08-29'),
(30, 30, '30-08-2026'),
(31, 31, '2026-08-31'),
(32, 32, '2026/09/01'),
(33, 33, '02-09-2026'),
(34, 34, '2026-09-03'),
(35, 35, '2026-09-04'),
(36, 36, '05/09/2026'),
(37, 37, '2026-09-06'),
(38, 38, '2026-09-07'),
(39, 39, '08-09-2026'),
(40, 40, '2026-09-09'),
(41, 41, '2026/09/10'),
(42, 42, '11-09-2026'),
(43, 43, '2026-09-12'),
(44, 44, '2026-09-13'),
(45, 45, '14/09/2026'),
(46, 46, '2026-09-15'),
(47, 47, '2026-09-16'),
(48, 48, '17-09-2026');

-- =========================================================
-- Stage 1: Partial SQL Clean (خطوة التنظيف المبدئية بـ SQL)
-- =========================================================

-- 1. تصحيح الأجور السالبة للأطباء
UPDATE Doctors
SET hourly_rate = ABS(hourly_rate)
WHERE hourly_rate < 0;

-- 2. إزالة المسافات الزائدة وتوحيد حالة أحرف الجنس والألقاب
UPDATE Doctors
SET full_name = TRIM(full_name),
    gender = CASE 
        WHEN LOWER(TRIM(gender)) IN ('m', 'male') THEN 'Male'
        WHEN LOWER(TRIM(gender)) IN ('f', 'female') THEN 'Female'
        ELSE gender
    END;

-- 3. إزالة المسافات الزائدة من أسماء المرضى
UPDATE Patients
SET full_name = TRIM(full_name);
select*from doctors;
select*from patients;
select * from patient_treatment;
select*from treatments;