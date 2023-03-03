package shop.mtcoding.pickme.model;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import shop.mtcoding.pickme.dto.notice.NoticeReq.NoticeSaveReqDto;



@Getter
@Setter
public class Companyskill {
    private Integer id;
    private Integer noticeId;
    private Integer companyId;
    private String companyskillName;
    private Timestamp createdAt;


    public Companyskill(NoticeSaveReqDto NoticeSaveReqDto) {
        this.noticeId = NoticeSaveReqDto.getId();
        this.companyId = NoticeSaveReqDto.getCompanyId();
        this.companyskillName = NoticeSaveReqDto.getCompanyskillList();
    }

}
