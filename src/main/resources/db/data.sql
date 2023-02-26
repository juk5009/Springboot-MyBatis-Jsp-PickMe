INSERT INTO user_tb(user_id, user_password, user_name, user_birth, user_email, user_address, user_location, user_grade, user_phone_number, user_sex, user_profile, created_at) values('ssar', '1234', '쌀', '19910329', 'ssar@nate.com', '부산광역시 북구 덕천동', '부산', '고졸', '01011112222', '남', '/images/dora.png', now());
INSERT INTO user_tb(user_id, user_password, user_name, user_birth, user_email, user_address, user_location, user_grade, user_phone_number, user_sex, user_profile, created_at) values('bori', '1234', '보리', '19950728', 'bori@nate.com', '부산광역시 연제구 연산동', '서울', '대졸', '01022223333', '여', '/images/dora.png', now());
INSERT INTO user_tb(user_id, user_password, user_name, user_birth, user_email, user_address, user_location, user_grade, user_phone_number, user_sex, user_profile, created_at) values('juho', '1234', '주호', '19860528', 'joho@gmail.com', '부산광역시 해운대구 반송동', '대구', '초대졸', '01033334444', '남', '/images/dog.jpg', now());

INSERT INTO company_tb(company_id, company_password, company_name, company_email, company_address, company_location, company_tel, company_profile, created_at) values('samsung', '1234', '삼성', 'samsung@gmail.com', '부산광역시 북구 덕천동', '부산', '05111112222', '/images/samsung.png', now());
INSERT INTO company_tb(company_id, company_password, company_name, company_email, company_address, company_location, company_tel, company_profile, created_at) values('lg', '1234', '엘지', 'lg@gmail.com', '서울특별시 동작구 대림동', '서울', '0222223333', '/images/lg.png', now());
INSERT INTO company_tb(company_id, company_password, company_name, company_email, company_address, company_location, company_tel, company_profile, created_at) values('green', '1234', '그린', 'green@gmail.com', '부산광역시 해운대구 반송동', '부산', '05133334444', '/images/samsung.png', now());

INSERT INTO companyinfo_tb(builddate, salemoney, owner_name, companyinfo_adress, employees, created_at) values('2003년 2월 23일', '178억', '김민수', '부산광역시 북구 덕천동', '530명', now());
INSERT INTO companyinfo_tb(builddate, salemoney, owner_name, companyinfo_adress, employees, created_at) values('1997년 7월 25일', '802억', '임민수', '부산광역시 연제구 연산동', '730명', now());
INSERT INTO companyinfo_tb(builddate, salemoney, owner_name, companyinfo_adress, employees, created_at) values('2001년 5월 15일', '1574억', '임원빈', '부산광역시 해운대구 반송동', '1213명', now());

INSERT INTO notice_tb(notice_title, notice_employtype, notice_content, notice_location, notice_career, notice_grade, notice_pay, company_mark, created_at) values('자바 기술자 모집합니다.', '정규직', '자바 기술자를 뽑지만 스프링도 할줄 알아야 하고, 리액트도 할줄 아셔야 합니다.', '부산', '경력 2년이상', '초대졸이상', '5000', '/images/samsung.png', now());
INSERT INTO notice_tb(notice_title, notice_employtype, notice_content, notice_location, notice_career, notice_grade, notice_pay, company_mark, created_at) values('스프링 기술자 모집합니다.', '정규직', '스프링 기술자를 뽑지만 리액트도 할줄 알아야 하고, 플러터도 할줄 아셔야 합니다.', '서울', '경력 5년이상', '대졸이상', '1000', '/images/lg.png', now());
INSERT INTO notice_tb(notice_title, notice_employtype, notice_content, notice_location, notice_career, notice_grade, notice_pay, company_mark, created_at) values('플러터 기술자 모집합니다.', '계약직', '플러터 기술자를 뽑지만 스프링도 할줄 알아야 하고, 자바도 할줄 아셔야 합니다.', '부산', '신입' , '고졸이상', '3000', '/images/samsung.png', now());

INSERT INTO apply_tb(user_id, notice_id, created_at) values('ssar', '1', now());
INSERT INTO apply_tb(user_id, notice_id, created_at) values('bori', '2', now());
INSERT INTO apply_tb(user_id, notice_id, created_at) values('juho', '1', now());

INSERT INTO skill_tb(skill_java, skill_java_script, skill_spring, skill_jsp, skill_react, skill_flutter, created_at) values('java', null, null, null, null, null, now());
INSERT INTO skill_tb(skill_java, skill_java_script, skill_spring, skill_jsp, skill_react, skill_flutter, created_at) values(null, 'java script', null, null, null, null, now());
INSERT INTO skill_tb(skill_java, skill_java_script, skill_spring, skill_jsp, skill_react, skill_flutter, created_at) values(null, null, 'Spring', null, null, null, now());
INSERT INTO skill_tb(skill_java, skill_java_script, skill_spring, skill_jsp, skill_react, skill_flutter, created_at) values(null, null, null, 'Jsp', null, null, now());
INSERT INTO skill_tb(skill_java, skill_java_script, skill_spring, skill_jsp, skill_react, skill_flutter, created_at) values('java', 'Java script', null, null, null, null, now());
INSERT INTO skill_tb(skill_java, skill_java_script, skill_spring, skill_jsp, skill_react, skill_flutter, created_at) values(null, null, null, 'Jsp', 'React', null, now());
INSERT INTO skill_tb(skill_java, skill_java_script, skill_spring, skill_jsp, skill_react, skill_flutter, created_at) values('java', 'Java script', 'Spring', null, null, null, now());
INSERT INTO skill_tb(skill_java, skill_java_script, skill_spring, skill_jsp, skill_react, skill_flutter, created_at) values('java', 'Java script', 'Spring', null, null, null, now());
INSERT INTO skill_tb(skill_java, skill_java_script, skill_spring, skill_jsp, skill_react, skill_flutter, created_at) values('java', 'Java script', 'Spring', 'Jsp', null, null, now());
INSERT INTO skill_tb(skill_java, skill_java_script, skill_spring, skill_jsp, skill_react, skill_flutter, created_at) values('java', 'Java script', 'Spring', 'Jsp', null, null, now());
INSERT INTO skill_tb(skill_java, skill_java_script, skill_spring, skill_jsp, skill_react, skill_flutter, created_at) values('java', 'Java script', 'Spring', 'Jsp', 'React', null, now());
INSERT INTO skill_tb(skill_java, skill_java_script, skill_spring, skill_jsp, skill_react, skill_flutter, created_at) values('java', 'Java script', 'Spring', 'Jsp', 'React', null, now());
INSERT INTO skill_tb(skill_java, skill_java_script, skill_spring, skill_jsp, skill_react, skill_flutter, created_at) values('java', 'Java script', 'Spring', 'Jsp', 'React', 'Flutter', now());
INSERT INTO skill_tb(skill_java, skill_java_script, skill_spring, skill_jsp, skill_react, skill_flutter, created_at) values('java', 'Java script', 'Spring', 'Jsp', 'React', 'Flutter', now());


commit;

