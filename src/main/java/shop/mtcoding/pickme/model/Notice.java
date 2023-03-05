package shop.mtcoding.pickme.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import shop.mtcoding.pickme.dto.notice.NoticeReq.NoticeSaveReqDto;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class Notice {
    private Integer id;
    private Integer companyId;
    private String noticeCompanyname;
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
        this.noticeCompanyname = NoticeSaveReqDto.getNoticeCompanyname();
        this.noticeTitle = NoticeSaveReqDto.getNoticeTitle();
        this.noticeCareer = NoticeSaveReqDto.getNoticeCareer();
        this.noticePay = NoticeSaveReqDto.getNoticePay();
        this.noticeEmploytype = NoticeSaveReqDto.getNoticeEmploytype();
        this.noticeGrade = NoticeSaveReqDto.getNoticeGrade();
        this.noticeLocation = NoticeSaveReqDto.getNoticeLocation();
        this.noticeContent = NoticeSaveReqDto.getNoticeContent();
    }
}
