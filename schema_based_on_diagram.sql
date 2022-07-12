CREATE DATABASE clinic;

CREATE TABLE patients(
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  date_of_birth DATE
);

CREATE TABLE medical_histories(
  id SERIAL PRIMARY KEY,
  admitted_at TIMESTAMP,
  patient_id INT REFERENCES patients(id),
  status VARCHAR(50)
);

CREATE TABLE invoices(
  id SERIAL PRIMARY KEY,
  total_amount DECIMAL(3, 2),
  generated_at TIMESTAMP,
  paid_at TIMESTAMP,
  medical_history_id INT REFERENCES medical_histories(id)
);

CREATE TABLE treatments(
  id SERIAL PRIMARY KEY,
  type VARCHAR(50),
  name VARCHAR(100)
);

CREATE TABLE treatment_histories(
  treatment_id INT REFERENCES treatments(id),
  medical_history_id INT REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items(
  id SERIAL PRIMARY KEY,
  unit_price DECIMAL(3, 2),
  quantity INT,
  total_price DECIMAL(3, 2),
  invoice_id INT REFERENCES invoices(id),
  treatment_id INT REFERENCES treatments(id)
);
