CREATE TABLE user_tb( 
    id int auto_increment primary key,
	user_name varchar not null,
	user_password varchar not null,	
	user_email varchar not null,	
    created_at timestamp not null
);

CREATE TABLE company_tb( 
    id int auto_increment primary key,
	company_name varchar not null,
	company_password varchar not null,	
	company_email varchar not null,
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

CREATE TABLE skill_tb(
    id int auto_increment primary key,
	resume_id int not null,
    skill_name1 varchar,
    skill_name2 varchar,
    skill_name3 varchar,
    skill_name4 varchar,
    skill_name5 varchar,
    skill_name6 varchar,
    created_at timestamp not null
);