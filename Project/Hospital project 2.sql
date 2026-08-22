
 USE hospital_clean_db;

SELECT 'doctors' as TableName, COUNT(*)  FROM doctors
UNION ALL
SELECT 'patients', COUNT(*) FROM patients
UNION ALL
SELECT 'treatment_records', COUNT(*) FROM treatment_records
UNION ALL
SELECT 'treatments', COUNT(*) FROM treatments;
USE hospital_clean_db;
SHOW TABLES;

USE hospital_clean_db;

SELECT 
    d.doctor_id,
    d.full_name,
    COUNT(DISTINCT tr.patient_id) as patient_count
FROM doctors d
JOIN treatment_records tr ON d.doctor_id = d.doctor_id
GROUP BY d.doctor_id, d.full_name
ORDER BY patient_count DESC;

USE hospital_clean_db;

SELECT 
    p.patient_id,
    p.full_name,
    SUM(t.cost) as total_cost
FROM patients p
JOIN treatment_records tr ON p.patient_id = tr.patient_id
JOIN treatments t ON tr.treatment_id = t.treatment_id
GROUP BY p.patient_id, p.full_name
ORDER BY total_cost DESC
LIMIT 10;

USE hospital_clean_db;

SELECT 
    t.treatment_name,
    COUNT(tr.treatment_id) as times_used
FROM treatments t
JOIN treatment_records tr ON t.treatment_id = tr.treatment_id
GROUP BY t.treatment_id, t.treatment_name
ORDER BY times_used DESC
LIMIT 5;

select*from doctors;