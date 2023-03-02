package shop.mtcoding.pickme.model;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.databind.ObjectMapper;

import shop.mtcoding.pickme.dto.userskill.UserskillReqDto.UserskillSaveReqDto;

@MybatisTest
public class UserskillRepositoryTest {

    @Autowired
    private UserskillRespository userskillRespository;

    @Test
    public void insert_test() throws Exception {

        // given
        UserskillSaveReqDto userskillSaveReqDto = new UserskillSaveReqDto();
        userskillSaveReqDto.setResumeId(1);
        userskillSaveReqDto.setUserskillName("java");

        System.out.println("테스트 : " + userskillSaveReqDto.getUserskillName());

        ObjectMapper om = new ObjectMapper();
        // when
        int result = userskillRespository.insert(userskillSaveReqDto.getResumeId(), userskillSaveReqDto.getUserskillName());
        String responseBody = om.writeValueAsString(result);
        System.out.println("테스트 : " + responseBody);

        // then
        assertThat(result).isEqualTo(1);

    }

}