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
        userskillSaveReqDto.setUserskillName1("java");
        userskillSaveReqDto.setUserskillName2("javaScript");
        userskillSaveReqDto.setUserskillName3("Spring");
        userskillSaveReqDto.setUserskillName4("jsp");
        userskillSaveReqDto.setUserskillName5("React");
        userskillSaveReqDto.setUserskillName6("flutter");
     


        System.out.println("테스트 : " + userskillSaveReqDto.getUserskillName3());

        ObjectMapper om = new ObjectMapper();
        // when
        int result = userskillRespository.insert(userskillSaveReqDto);
        String responseBody = om.writeValueAsString(result); 
        System.out.println("테스트 : " + responseBody);
       

        // then
        assertThat(result).isEqualTo(1);

    }

}