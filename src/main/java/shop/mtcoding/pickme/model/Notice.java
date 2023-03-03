package shop.mtcoding.pickme.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import shop.mtcoding.pickme.dto.notice.NoticeReq.NoticeSaveReqDto;

@Setter
@Getter
public class Notice {
    private Integer id;
    private Integer companyId;
    private String noticeTitle;
    private String noticeCareer;
    private String noticePay;
    private String noticeEmploytype;
    private String noticeGrade;
    private String noticeLocation;
    private String noticeContent;
    private Timestamp createdAt;


    public Notice(NoticeSaveReqDto NoticeSaveReqDto) {
        this.companyId = NoticeSaveReqDto.getCompanyId();
        this.noticeTitle = NoticeSaveReqDto.getNoticeTitle();
        this.noticeCareer = NoticeSaveReqDto.getNoticeCareer();
        this.noticePay = NoticeSaveReqDto.getNoticePay();
        this.noticeEmploytype = NoticeSaveReqDto.getNoticeEmploytype();
        this.noticeGrade = NoticeSaveReqDto.getNoticeGrade();
        this.noticeLocation = NoticeSaveReqDto.getNoticeLocation();
        this.noticeContent = NoticeSaveReqDto.getNoticeContent();
    }
}
