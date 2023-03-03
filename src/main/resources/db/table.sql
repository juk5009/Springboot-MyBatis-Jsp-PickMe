CREATE TABLE user_tb( 
    id int auto_increment primary key,
	user_name varchar not null,
	user_password varchar not null,	
	user_email varchar not null,
    user_profile varchar,	
    created_at timestamp not null
);

CREATE TABLE company_tb( 
    id int auto_increment primary key,
	company_name varchar not null,
	company_password varchar not null,	
	company_email varchar not null,
    -- company_profile varchar,
	created_at timestamp not null
);

CREATE TABLE companyinfo_tb(
    id int auto_increment primary key,
	company_id int, 
    builddate varchar,
    salemoney varchar,
    owner_name varchar,
    companyinfo_adress varchar,
    employees varchar,
    created_at timestamp not null
);

CREATE TABLE notice_tb( 
    id int auto_increment primary key,
	company_id int,
    notice_title varchar not null,
	notice_employtype varchar not null,
	notice_content varchar not null,
	notice_location varchar not null,
	notice_career varchar,
	notice_grade varchar,
	notice_pay varchar,
    created_at timestamp not null
);

CREATE TABLE apply_tb(
    id int auto_increment primary key,
    resume_id varchar not null,
    notice_id varchar not null,
    created_at timestamp not null
);

CREATE TABLE resume_tb(
    id int auto_increment primary key,
	user_id int not null,
	resume_name varchar not null,
	resume_birth varchar,
	resume_email varchar not null,
	resume_address varchar(100) not null, 
	resume_location varchar not null,
	resume_grade varchar,
	resume_phone_number varchar not null,
	resume_sex varchar not null,	
	resume_content varchar,
    created_at timestamp not null
);

CREATE TABLE companyskill_tb(
    id int auto_increment primary key,
	notice_id int,
    companyskill_name varchar,
    created_at timestamp not null
);

CREATE TABLE userskill_tb(
    id int auto_increment primary key,
	resume_id int,
    user_id int,
    userskill_name varchar,
    created_at timestamp not null
);
