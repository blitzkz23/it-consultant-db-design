-- Pac Project DB

CREATE TABLE employee(
    employee_id SERIAL PRIMARY KEY,
    first_name varchar(100) NOT NULL,
    last_name varchar(100) NOT NULL,
    phone varchar(20) NOT NULL,
    email varchar(100) UNIQUE NOT NULL,
    job_title varchar(100) NOT NULL CHECK (employee_type IN ('full-time', 'contract')),
    employee_type varchar(20) NOT NULL,
    UNIQUE(first_name, last_name)
);

CREATE TABLE department(
    department_id SERIAL PRIMARY KEY,
    employee_id integer NOT NULL,
    department_name varchar(100) UNIQUE NOT NULL,
    CONSTRAINT fk_department_leader
        FOREIGN KEY(employee_id)
        REFERENCES employee(employee_id)
        ON DELETE NO ACTION
);

CREATE TABLE affiliation(
    affiliation_id SERIAL PRIMARY KEY,
    company_name varchar(100) UNIQUE NOT NULL
);

CREATE TABLE client(
    client_id SERIAL PRIMARY KEY,
    affiliation_id integer NOT NULL
    first_name varchar(100) NOT NULL,
    last_name varchar(100) NOT NULL,
    phone varchar(20) NOT NULL,
    CONSTRAINT fk_client_affiliation
        FOREIGN KEY(affiliation_id)
        REFERENCES affiliation(affiliation_id)
        ON DELETE NO ACTION
);

CREATE TABLE project_category(
    project_category_id SERIAL PRIMARY KEY,
    category_name varchar(50) UNIQUE NOT NULL
);

CREATE TABLE project(
    project_id SERIAL PRIMARY KEY,
    project_category_id integer NOT NULL,
    client_id integer NOT NULL,
    project_leader_id integer NOT NULL,
    project_name UNIQUE NOT NULL,
    project_desc text,
    start_desc timestamp,
    end_date timestamp,
    CONSTRAINT fk_project_client
        FOREIGN KEY(client_id)
        REFERENCES client(client_id)
        ON DELETE RESTRICT,
    CONSTRAINT fk_project_category
        FOREIGN key(project_category_id)
        REFERENCES project_category(project_category_id)
        ON DELETE NO ACTION,
    CONSTRAINT fk_project_leader
        FOREIGN KEY(employee_id)
        REFERENCES employee(employee_id)
        ON DELETE NO ACTION
);

CREATE TABLE project_employee(
    project_employee_id SERIAL PRIMARY KEY,
    project_id integer NOT NULL,
    employee_id integer NOT NULL,
    CONSTRAINT fk_project_employee_project
        FOREIGN KEY(project_id)
        REFERENCES project(project_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_project_employee_employee
        FOREIGN KEY(employee_id)
        REFERENCES employee(employee_id)
        ON DELETE CASCADE
);