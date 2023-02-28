package shop.mtcoding.pickme.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.databind.ObjectMapper;

import shop.mtcoding.pickme.dto.resume.ResumeReq.ResumeSaveReqDto;
import shop.mtcoding.pickme.model.User;

@Transactional
@AutoConfigureMockMvc
@SpringBootTest(webEnvironment = WebEnvironment.MOCK)
public class ResumeControllerTest {

    @Autowired
    private MockMvc mvc;

    @Autowired
    private ObjectMapper om;

    private MockHttpSession mockSession;

    @BeforeAll
    public static void 테이블차리기() { // 컨트롤러 테스트가 실행되기 직전에 한번 실행됨
        // 테이블 만들고

    }

    @AfterEach
    public void teardown() { // 메서드가 실행된 직후 매번 실행됨
        // 데이터 지우고(trumcate로 데이터만 날림), 다시 insert

    }

    @BeforeEach // Test 메서드 실행 직전 마다 호출됨
    public void setUp() {
        // 테이블 insert

        // 세션 주입
        User user = new User();
        user.setId(1);
        user.setUserName("ssar");
        user.setUserPassword("1234");
        user.setUserEmail("ssar@nate.com");
        user.setCreatedAt(Timestamp.valueOf(LocalDateTime.now()));

        mockSession = new MockHttpSession();
        mockSession.setAttribute("principal", user);
    }

    @Test
    public void resume_test() throws Exception {
        // given
        ResumeSaveReqDto resumeSaveReqDto = new ResumeSaveReqDto();
        resumeSaveReqDto.setUserId(1);
        resumeSaveReqDto.setResumeName("홍길동");
        resumeSaveReqDto.setResumeBirth("1997-02-10");
        resumeSaveReqDto.setResumeEmail("hong@nate.com");
        resumeSaveReqDto.setResumeAddress("부산 사상");
        resumeSaveReqDto.setResumeLocation("부산");
        resumeSaveReqDto.setResumeGrade("전문학사");
        resumeSaveReqDto.setResumePhoneNumber("01055558888");
        resumeSaveReqDto.setResumeSex("남");
        resumeSaveReqDto.setResumeContent("너너넝");

        String requestBody = om.writeValueAsString(resumeSaveReqDto);
        // when
        ResultActions resultActions = mvc.perform(
                post("/resume/1")
                        .content(requestBody)
                        .contentType(MediaType.APPLICATION_JSON_VALUE)
                        .session(mockSession));

        System.out.println("테스트 : " + requestBody);

        // then
        resultActions.andExpect(status().isCreated());
    }
}