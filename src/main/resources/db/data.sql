INSERT INTO user_tb(user_name, user_password, user_email, created_at) values('ssar', '1234', 'ssar@nate.com', now());
INSERT INTO user_tb(user_name, user_password, user_email, created_at) values('bori', '1234', 'bori@nate.com', now());
INSERT INTO user_tb(user_name, user_password, user_email, created_at) values('juho', '1234', 'joho@gmail.com', now());

INSERT INTO company_tb(company_name, company_password, company_email, created_at) values('samsung', '1234', 'samsung@gmail.com', now());
INSERT INTO company_tb(company_name, company_password, company_email, created_at) values('lg', '1234', 'lg@gmail.com', now());
INSERT INTO company_tb(company_name, company_password, company_email, created_at) values('green', '1234', 'green@gmail.com', now());

INSERT INTO companyinfo_tb(company_id, builddate, salemoney, owner_name, companyinfo_adress, employees, created_at) values('1', '2003년 2월 23일', '178억', '김민수', '부산광역시 북구 덕천동', '530명', now());
INSERT INTO companyinfo_tb(company_id, builddate, salemoney, owner_name, companyinfo_adress, employees, created_at) values('1', '1997년 7월 25일', '802억', '임민수', '부산광역시 연제구 연산동', '730명', now());
INSERT INTO companyinfo_tb(company_id, builddate, salemoney, owner_name, companyinfo_adress, employees, created_at) values('2', '2001년 5월 15일', '1574억', '임원빈', '부산광역시 해운대구 반송동', '1213명', now());

INSERT INTO notice_tb(company_id, notice_title, notice_employtype, notice_content, notice_location, notice_career, notice_grade, notice_pay, created_at) values('1', '자바 기술자 모집합니다.', '정규직', '자바 기술자를 뽑지만 스프링도 할줄 알아야 하고, 리액트도 할줄 아셔야 합니다.', '부산', '경력 2년이상', '초대졸이상', '5000', now());
INSERT INTO notice_tb(company_id, notice_title, notice_employtype, notice_content, notice_location, notice_career, notice_grade, notice_pay, created_at) values('1', '스프링 기술자 모집합니다.', '정규직', '스프링 기술자를 뽑지만 리액트도 할줄 알아야 하고, 플러터도 할줄 아셔야 합니다.', '서울', '경력 5년이상', '대졸이상', '1000', now());
INSERT INTO notice_tb(company_id, notice_title, notice_employtype, notice_content, notice_location, notice_career, notice_grade, notice_pay, created_at) values('2', '플러터 기술자 모집합니다.', '계약직', '플러터 기술자를 뽑지만 스프링도 할줄 알아야 하고, 자바도 할줄 아셔야 합니다.', '부산', '신입' , '고졸이상', '3000', now());

INSERT INTO apply_tb(resume_id, notice_id, created_at) values('1', '1', now());
INSERT INTO apply_tb(resume_id, notice_id, created_at) values('1', '2', now());
INSERT INTO apply_tb(resume_id, notice_id, created_at) values('1', '1', now());

INSERT INTO userskill_tb(resume_id, userskill_name1, userskill_name2, userskill_name3, userskill_name4, userskill_name5, userskill_name6, created_at) values('1', 'java', 'javaScript', 'spirng', null, null, null, now());
INSERT INTO userskill_tb(resume_id, userskill_name1, userskill_name2, userskill_name3, userskill_name4, userskill_name5, userskill_name6, created_at) values('2', 'java', null, 'spirng', null, null, null, now());
INSERT INTO userskill_tb(resume_id, userskill_name1, userskill_name2, userskill_name3, userskill_name4, userskill_name5, userskill_name6, created_at) values('3', 'java', null, null, null, null, null, now());

INSERT INTO companyskill_tb(notice_id, companyskill_name1, companyskill_name2, companyskill_name3, companyskill_name4, companyskill_name5, companyskill_name6, created_at) values('1', 'java', 'Java script', 'Spring', 'Jsp', 'React', null, now());
INSERT INTO companyskill_tb(notice_id, companyskill_name1, companyskill_name2, companyskill_name3, companyskill_name4, companyskill_name5, companyskill_name6, created_at) values('1', 'java', 'Java script', 'Spring', 'Jsp', 'React', 'Flutter', now());
INSERT INTO companyskill_tb(notice_id, companyskill_name1, companyskill_name2, companyskill_name3, companyskill_name4, companyskill_name5, companyskill_name6, created_at) values('1', 'java', 'Java script', 'Spring', 'Jsp', 'React', 'Flutter', now());

commit;

