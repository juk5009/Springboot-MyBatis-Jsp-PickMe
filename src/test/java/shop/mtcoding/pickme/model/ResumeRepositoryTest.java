package shop.mtcoding.pickme.model;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.databind.ObjectMapper;

import shop.mtcoding.pickme.dto.resume.ResumeReq.ResumeSaveReqDto;

@MybatisTest
public class ResumeRepositoryTest {

    @Autowired
    private ResumeRepository resumeRepository;

    @Test
    public void insert_test() throws Exception {

        // given
        ResumeSaveReqDto resumeSaveReqDto = new ResumeSaveReqDto();
        resumeSaveReqDto.setId(1);
        resumeSaveReqDto.setResumeUsername("ssar");
        resumeSaveReqDto.setResumeBirth("1997-02-10");
        resumeSaveReqDto.setResumeEmail("hong@nate.com");
        resumeSaveReqDto.setResumeAddress("부산 사상");
        resumeSaveReqDto.setResumeLocation("부산");
        resumeSaveReqDto.setResumeCareer("경력 2년이상");
        resumeSaveReqDto.setResumeGrade("전문학사");
        resumeSaveReqDto.setResumePhoneNumber("01055558888");
        resumeSaveReqDto.setResumeSex("남");
        resumeSaveReqDto.setResumeContent("너너넝");
        resumeSaveReqDto.setUserskillList("spring");

        Resume resume = new Resume(resumeSaveReqDto);
        System.out.println("테스트2 pw : " + resumeSaveReqDto.getResumePhoneNumber());

        ObjectMapper om = new ObjectMapper();
        // when
        int result = resumeRepository.insert(resume);
        String responseBody = om.writeValueAsString(result);
        System.out.println("테스트 : " + responseBody);

        // then
        assertThat(result).isEqualTo(1);

    }

}