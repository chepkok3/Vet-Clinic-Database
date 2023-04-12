-- Create the patient table
CREATE TABLE patients ( 
    id integer primary key NOT NULL,
    name varchar(100), 
    date_of_birth date 
);

-- Create the medical_histories table
CREATE TABLE medical_histories ( 
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    admitted_at timestamp NOT NULL, 
    patient_id INT REFERENCES patients(id), 
    status varchar(50)
);
CREATE INDEX index_patient_id ON medical_histoeries (patient_id);

-- Create the invoices table
CREATE TABLE invoices ( 
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    total_amount decimal NOT NULL,
    generated_at timestamp NOT NULL, 
    payed_at TIMESTAMP,
    medical_history_id INTEGER REFERENCES medical_histories (id)
);
CREATE INDEX index_medical_history_id ON invoices (medical_history__id);

-- Create the treatments table
CREATE TABLE treatments (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    type varchar(20) NOT NULL,
    name varchar(50) NOT NULL
);

-- create invoice items table
CREATE TABLE invoice_items (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    unit_price DECIMAL NOT NULL,
    quantity INT NOT NULL,
    invoice_id INT REFERENCES invoices(id),
    treatment_id INT REFERENCES treatments(id)
);
CREATE INDEX index_treatment_id ON invoice_items (treatment_id);
CREATE INDEX index_invoice_id ON invoice_items (invoice_id);

-- Create the joined table
CREATE TABLE joined ( 
    id INT GENERATED ALWAYS AS IDENTITY,
    medical_history_id INTEGER REFERENCES medical_histories(id),
    treatment_id INTEGER REFERENCES treatments(id),    
    PRIMARY KEY (id)
);
CREATE INDEX index_medical_histories_id ON joined (medical_history_id);
CREATE INDEX index_treatments_id ON joined (treatments_id);