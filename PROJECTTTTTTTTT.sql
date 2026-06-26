CREATE DATABASE project0;

USE project0;



CREATE TABLE raw_customer_data (
    customerID VARCHAR(20) PRIMARY KEY,
    gender VARCHAR(10),
    SeniorCitizen INT,
    Partner VARCHAR(3),
    Dependents VARCHAR(3),
    tenure INT,
    PhoneService VARCHAR(3),
    MultipleLines VARCHAR(50),
    InternetService VARCHAR(50),
    OnlineSecurity VARCHAR(50),
    OnlineBackup VARCHAR(50),
    DeviceProtection VARCHAR(50),
    TechSupport VARCHAR(50),
    StreamingTV VARCHAR(50),
    StreamingMovies VARCHAR(50),
    Contract VARCHAR(50),
    PaperlessBilling VARCHAR(3),
    PaymentMethod VARCHAR(50),
    MonthlyCharges DECIMAL(10, 2),
    TotalCharges VARCHAR(20), 
    Churn VARCHAR(3)
);

SELECT * FROM raw_customer_data;

CREATE  OR REPLACE VIEW v_clean_telecom_churn AS
SELECT 

    SeniorCitizen,
    tenure,
    MonthlyCharges,
    TotalCharges,

    CASE WHEN gender = 'Male' THEN 1 ELSE 0 END AS gender_male,
    
  
    CASE 
        WHEN Contract = 'Month-to-month' THEN 0
        WHEN Contract = 'One year' THEN 1
        WHEN Contract = 'Two year' THEN 2
        ELSE 0 END AS contract,
        
    
    CASE 
        WHEN InternetService = 'No' THEN 0
        WHEN InternetService = 'DSL' THEN 1
        WHEN InternetService = 'Fiber optic' THEN 2
        ELSE 0 END AS internet,
        
    Churn
FROM raw_customer_data;


SELECT * FROM v_clean_telecom_churn;
