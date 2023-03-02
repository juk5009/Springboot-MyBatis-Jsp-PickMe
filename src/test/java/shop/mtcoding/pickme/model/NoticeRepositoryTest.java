package shop.mtcoding.pickme.model;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.databind.ObjectMapper;

import shop.mtcoding.pickme.dto.notice.NoticeReq.NoticeSaveReqDto;

@MybatisTest
public class NoticeRepositoryTest {

    @Autowired
    private NoticeRepository noticeRepository;

    @Test
    public void insert_test() throws Exception {

        // given
        NoticeSaveReqDto noticeSaveReqDto = new NoticeSaveReqDto();
        noticeSaveReqDto.setCompanyId(1);
        noticeSaveReqDto.setNoticeTitle("다다닥");
        noticeSaveReqDto.setNoticeCareer("1년");
        noticeSaveReqDto.setNoticeContent("다다다닥");
        noticeSaveReqDto.setNoticeEmploytype("정규직");
        noticeSaveReqDto.setNoticeGrade("학사");
        noticeSaveReqDto.setNoticeLocation("서울");
        noticeSaveReqDto.setNoticePay("5000");

        System.out.println("테스트 1 : " + noticeSaveReqDto.getNoticeContent());

        ObjectMapper om = new ObjectMapper();
        // when
        int result = noticeRepository.insert(noticeSaveReqDto);
        String responseBody = om.writeValueAsString(result);
        System.out.println("테스트 : " + responseBody);

        // then
        assertThat(result).isEqualTo(1);

    }

}