CREATE TABLE employees (
	emp_id bigserial,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      VARCHAR(1)      NOT NULL,
	birth_date  DATE            NOT NULL,
    rel_status  VARCHAR(20)     NOT NULL,
    hire_date   DATE            NOT NULL,
    contacts	INT,
    CONSTRAINT emp_key PRIMARY KEY (emp_id),
	CONSTRAINT emp_unique UNIQUE ( first_name, last_name, gender, birth_date, rel_status, hire_date, contacts)
);

CREATE TABLE departments (
	dept_id bigserial, 
    dept_name   VARCHAR(100)     NOT NULL,
	city varchar(100),
    CONSTRAINT dept_key PRIMARY KEY (dept_id),
	CONSTRAINT dept_name_city_unique UNIQUE (dept_name, city)
);

CREATE TABLE titles (
	title_id bigserial,
    title       VARCHAR(50)  NOT NULL,
    CONSTRAINT title_key PRIMARY KEY (title_id),
	CONSTRAINT title_unique UNIQUE (title)
);

CREATE TABLE salaries (
	salary_id bigserial,
    salary      INT    NOT NULL,
	CONSTRAINT salary_key PRIMARY KEY (salary_id),
	CONSTRAINT salary_unique UNIQUE (salary)
);

CREATE TABLE Promotions (
	prom_id bigserial,
    promoted_gross INT		NOT NULL,
	CONSTRAINT prom_key PRIMARY KEY (prom_id),
	CONSTRAINT prom_unique UNIQUE (promoted_gross)
);

CREATE TABLE overhours (
	overhour_id bigserial,
    days		DATE         NOT NULL,
    hours		TIME,
	CONSTRAINT overhour_key PRIMARY KEY (overhour_id),
	CONSTRAINT overhour_unique UNIQUE (days, hours)
);


alter table employees 
add column department integer REFERENCES departments(dept_id);

alter table employees 
add column title integer REFERENCES titles(title_id);

alter table employees 
add column salary integer REFERENCES salaries(salary_id);

alter table employees 
add column promotion integer REFERENCES promotions(prom_id);

alter table employees 
add column overhour integer REFERENCES overhours(overhour_id);


INSERT INTO employees (first_name, last_name, gender, birth_date, rel_status, hire_date, contacts, department, title, salary, promotion, overhour)
VALUES
 ('Robert', 'Minder', 'M', '1972-07-08', 'Married','2006-01-30', 0605559838, '1', '1', '1', '1', '1'),
 ('Maricruz', 'Rocheleau', 'M', '1973-12-11', 'Single','2007-08-08', 0821453543, '2', '2', '2', '2', '2'),
 ('Elba', 'Dutil', 'F', '1983-06-23', 'Single','2012-06-17', 0754726753, '3', '3', '3', '3', '3'),
 ('Gudrun', 'Robinett', 'M', '1987-11-07', 'Engaged','2012-08-03', 0834145670, '4', '4', '4', '4', '4'),
 ('Joaquin', 'Dyches', 'F', '1995-03-02', 'Taken','2017-07-16', 0657690535, '5', '5', '5', '5', '5'),
 ('Joy', 'Reiss', 'F', '1996-04-03', 'Single','2017-10-18', 0691836634, '6', '6', '6', '6', '6');
 
 INSERT INTO departments (dept_name, city)
VALUES
 ('Tax', 'Atlanta'),
 ('Marketing', 'Chicago'),
 ('Human Resource Management', 'Phoenix'),
 ('Research and Development', 'San Diego'),
 ('Accounting and Finance', 'Los Angeles'),
 ('IT', 'Boston');
 
 INSERT INTO titles (title)
VALUES
 ('CEO'),
 ('CMO'),
 ('COO'),
 ('CIO'),
 ('CFO'),
 ('CTO');
 
 INSERT INTO salaries (salary)
VALUES
 (420000),
 (814000),
 (281157),
 (209298),
 (359263 ),
 (24807);
 
INSERT INTO promotions (promoted_gross)
VALUES
 (25),
 (20),
 (16),
 (15),
 (18),
 (10);
 
 INSERT INTO overhours (days, hours)
VALUES
 ('2012-06-05','8:35 - 5:30'),
 ('2012-06-06','8:36 - 5:15'),
 ('2012-06-07','8:33 - 5:21'),
 ('2012-06-08','8:32 - 5:12'),
 ('2012-06-09','8:35 - 5:25'),
 ('2012-06-10','8:39 - 5:38');