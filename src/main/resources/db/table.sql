CREATE TABLE user_tb( 
    id int auto_increment primary key,
	user_id varchar not null,
	user_password varchar not null,
	user_name varchar,
	user_birth varchar,
	user_email varchar not null,
	user_address varchar(100), 
	user_location varchar,
	user_grade varchar,
	user_phone_number varchar,
	user_sex varchar,
	user_profile varchar,
    created_at timestamp not null
);

CREATE TABLE company_tb( 
    id int auto_increment primary key,
	company_id varchar not null,
	company_password varchar not null,
	company_name varchar,
	company_email varchar not null,	
	company_address varchar,
	company_location varchar,
	company_tel varchar,
	company_profile varchar,
	created_at timestamp not null
);

CREATE TABLE companyinfo_tb(
    id int auto_increment primary key,
    builddate varchar not null,
    salemoney varchar not null,
    owner_name varchar not null,
    companyinfo_adress varchar not null,
    employees varchar not null,
    created_at timestamp not null
);

CREATE TABLE notice_tb( 
    id int auto_increment primary key,
    notice_title varchar not null,
	notice_employtype varchar not null,
	notice_content varchar not null,
	notice_location varchar not null,
	notice_career varchar,
	notice_grade varchar,
	notice_pay varchar,
	company_mark varchar,	
    created_at timestamp not null
);

CREATE TABLE apply_tb(
    id int auto_increment primary key,
    user_id varchar not null,
    notice_id varchar not null,
    created_at timestamp not null
);

CREATE TABLE skill_tb(
    id int auto_increment primary key,
    skill_java varchar,
    skill_java_script varchar,
    skill_spring varchar,
    skill_jsp varchar,
    skill_react varchar,
    skill_flutter varchar,
    created_at timestamp not null
);