create database tm_project_db;

use tm_new_db;

show tables;

select * from financial_loan_dataset;

select count(id) as total_loan_applications from financial_loan_dataset;  #total loan application (1st KPI)

select sum(loan_amount) as total_funded_amount from financial_loan_dataset; #total funded amount

select sum(total_payment) as total_payments_received from financial_loan_dataset; #total payments received

select round(avg(int_rate),2)*100 as average_interest_rate from financial_loan_dataset;#average_interest_rate, using roundoff for 2 place

select round(avg(dti),4)*100 as average_dti from financial_loan_dataset;#avg_dti, using roundoff for 4 place using round keyword

select loan_status from financial_loan_dataset;

select count(id) as Good_loan_Applications from financial_loan_dataset
where loan_status='Fully Paid' or loan_status='Current'; #Number of good loan applications

select count(id) as Bad_loan_Applications from financial_loan_dataset
where loan_status='Charged off'; #Number of bad loan applications

select (count(case when loan_status='Fully Paid' or loan_status='Current' then id end)*100)/
count(id) as Good_Loan_Percentage from financial_loan_dataset; #Good loan Percentage

select (count(case when loan_status='Charged off' then id end)*100)/
count(id) as Bad_Loan_Percentage from financial_loan_dataset; #bad loan Percentage

select sum(loan_amount) as bad_loan_amount from financial_loan_dataset where loan_status='Charged off'; #bad loan funded amount

select sum(loan_amount) as Good_loan_amount from financial_loan_dataset where loan_status='Fully Paid' or loan_status='Current'; # Good loan funded amount

select sum(total_payment) as Bad_Loan_Amount_Received from financial_loan_dataset where loan_status='Charged off'; #how much bad loan we have been able to retrieve remaining is npa