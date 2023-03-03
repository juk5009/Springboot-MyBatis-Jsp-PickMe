package shop.mtcoding.pickme.dto.notice;

import lombok.Getter;
import lombok.Setter;

public class NoticeResp {

    @Setter
    @Getter
    public static class NoticeMainRespDto {
        private int id;
        private String noticeNoticename;
        private String noticeTitle;
        private String companyName;
    }
}
