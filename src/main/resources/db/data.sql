INSERT INTO user_tb(user_name, user_password, user_email, created_at) values('ssar', '1234', 'ssar@nate.com', now());
INSERT INTO user_tb(user_name, user_password, user_email, created_at) values('bori', '1234', 'bori@nate.com', now());
INSERT INTO user_tb(user_name, user_password, user_email, created_at) values('juho', '1234', 'joho@gmail.com', now());

INSERT INTO company_tb(company_name, company_password, company_email, created_at) values('samsung', '1234', 'samsung@gmail.com', now());
INSERT INTO company_tb(company_name, company_password, company_email, created_at) values('lg', '1234', 'lg@gmail.com', now());
INSERT INTO company_tb(company_name, company_password, company_email, created_at) values('green', '1234', 'green@gmail.com', now());

INSERT INTO companyinfo_tb(company_id, builddate, salemoney, owner_name, companyinfo_adress, employees, created_at) values('1', '2003년 2월 23일', '178억', '김민수', '부산광역시 북구 덕천동', '530명', now());
INSERT INTO companyinfo_tb(company_id, builddate, salemoney, owner_name, companyinfo_adress, employees, created_at) values('1', '1997년 7월 25일', '802억', '임민수', '부산광역시 연제구 연산동', '730명', now());
INSERT INTO companyinfo_tb(company_id, builddate, salemoney, owner_name, companyinfo_adress, employees, created_at) values('2', '2001년 5월 15일', '1574억', '임원빈', '부산광역시 해운대구 반송동', '1213명', now());

INSERT INTO notice_tb(company_id, notice_title, notice_employtype, notice_location, notice_career, notice_grade, notice_pay, notice_content, created_at) values('1', '자바 기술자 모집합니다.', '정규직', '부산', '경력 2년이상', '초대졸이상', '5000', '자바 기술자를 뽑지만 스프링도 할줄 알아야 하고, 리액트도 할줄 아셔야 합니다.', now());
INSERT INTO notice_tb(company_id, notice_title, notice_employtype, notice_location, notice_career, notice_grade, notice_pay, notice_content, created_at) values('1', '스프링 기술자 모집합니다.', '정규직',  '서울', '경력 5년이상', '대졸이상', '1000', '스프링 기술자를 뽑지만 리액트도 할줄 알아야 하고, 플러터도 할줄 아셔야 합니다.', now());
INSERT INTO notice_tb(company_id, notice_title, notice_employtype, notice_location, notice_career, notice_grade, notice_pay, notice_content, created_at) values('2', '플러터 기술자 모집합니다.', '계약직', '부산', '신입' , '고졸이상', '3000', '플러터 기술자를 뽑지만 스프링도 할줄 알아야 하고, 자바도 할줄 아셔야 합니다.',  now());

INSERT INTO apply_tb(resume_id, notice_id, created_at) values('1', '1', now());
INSERT INTO apply_tb(resume_id, notice_id, created_at) values('1', '2', now());
INSERT INTO apply_tb(resume_id, notice_id, created_at) values('1', '1', now());

INSERT INTO resume_tb(user_id, resume_name, resume_birth, resume_email, resume_address, resume_location, resume_grade, resume_phone_number, resume_sex, resume_content, created_at) values('1', '안정훈', '1997-03-15', 'an@nate.com', '부산광역시 북구 덕천동', '부산', '학사', '01011112222', '남', '나', now());
INSERT INTO resume_tb(user_id, resume_name, resume_birth, resume_email, resume_address, resume_location, resume_grade, resume_phone_number, resume_sex, resume_content, created_at) values('2', '김정욱', '1994-09-15', 'kj@nate.com', '부산광역시 해운대구', '부산', '석사', '0101841532', '남', '너', now());

INSERT INTO userskill_tb(resume_id, user_id, userskill_name, created_at) values('1', '1', 'java', now());
INSERT INTO userskill_tb(resume_id, user_id, userskill_name, created_at) values('2', '2', 'javaScript', now());

INSERT INTO companyskill_tb(notice_id, company_id, companyskill_name, created_at) values('1', '1', 'React', now());
INSERT INTO companyskill_tb(notice_id, company_id, companyskill_name, created_at) values('2', '2', 'spirng', now());

commit;

