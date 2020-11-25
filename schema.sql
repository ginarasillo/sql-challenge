CREATE TABLE public.department
(
    dept_no character varying(5) COLLATE pg_catalog."default" NOT NULL,
    dept_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT department_pkey PRIMARY KEY (dept_no)
)

CREATE TABLE public.employees
(
    emp_no integer NOT NULL,
    birth_date date NOT NULL,
    first_name character varying(20) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(20) COLLATE pg_catalog."default" NOT NULL,
    gender character(1) COLLATE pg_catalog."default" NOT NULL,
    hire_date date NOT NULL,
    CONSTRAINT employees_pkey PRIMARY KEY (emp_no)
)

CREATE TABLE public.titles
(
    emp_no integer NOT NULL,
    title character varying(50) COLLATE pg_catalog."default" NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    CONSTRAINT fk_employee FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)


CREATE TABLE public.salaries
(
    emp_no integer NOT NULL,
    salary integer NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    CONSTRAINT salaries_pkey PRIMARY KEY (emp_no),
    CONSTRAINT fk_employee FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)

CREATE TABLE public.dept_manager
(
    dept_no character varying(7) COLLATE pg_catalog."default" NOT NULL,
    emp_no integer NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    CONSTRAINT dept_manager_pkey PRIMARY KEY (dept_no, emp_no),
    CONSTRAINT fk_department FOREIGN KEY (dept_no)
        REFERENCES public.department (dept_no) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_employee FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)

CREATE TABLE public.dept_emp
(
    emp_no integer NOT NULL,
    dept_no character varying(7) COLLATE pg_catalog."default" NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    CONSTRAINT dept_emp_pkey PRIMARY KEY (dept_no, emp_no),
    CONSTRAINT fk_department FOREIGN KEY (dept_no)
        REFERENCES public.department (dept_no) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_employee FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)