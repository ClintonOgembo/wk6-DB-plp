-- question 1.1: Simple Join
SELECT 
    first_name,
    last_name,
    provider_specialty
FROM 
    providers;


-- question 1.2: Inner Join
SELECT 
    p.patient_id,
    p.first_name,
    p.last_name,
    prov.provider_specialty
FROM 
    patients p
INNER JOIN 
    visits v ON p.patient_id = v.patient_id
INNER JOIN 
    providers prov ON v.provider_id = prov.provider_id;


-- question 1.3: Left Join
SELECT 
    p.patient_id,
    p.first_name,
    p.last_name,
    v.date_of_visit
FROM 
    patients p
LEFT JOIN 
    visits v ON p.patient_id = v.patient_id;


-- question 1.4: Join with Aggregation
SELECT 
    prov.first_name, last_name,
    COUNT(v.visit_id) AS number_of_visits
FROM 
    providers prov
LEFT JOIN 
    visits v ON prov.provider_id = v.provider_id
GROUP BY 
    prov.first_name, prov.last_name;


-- question 1.5: Complex Join With Conditions
SELECT 
    p.patient_id,
    p.first_name,
    p.last_name,
    a.admission_date,
    a.discharge_date
FROM 
    patients p
INNER JOIN 
    visits v ON p.patient_id = v.patient_id
INNER JOIN 
    admissions a ON v.visit_id = a.visit_id
WHERE 
    a.admission_required = 1;


-- Bonus Question:
SELECT 
    p.first_name,
    p.last_name,
    p.date_of_birth,
    prov.provider_name,
    v.visit_date,
    v.blood_pressure_systolic,
    v.blood_pressure_diastolic,
    v.visit_status,
    a.admission_date,
    d.discharge_date
FROM 
    patients p
INNER JOIN 
    visits v ON p.patient_id = v.patient_id
INNER JOIN 
    providers prov ON v.provider_id = prov.provider_id
INNER JOIN 
    admissions a ON v.visit_id = a.visit_id
INNER JOIN
    discharges d ON a.admission_id = d.admission_id
WHERE 
    d.discharge_disposition = 'Home'
ORDER BY 
    v.visit_date DESC;
