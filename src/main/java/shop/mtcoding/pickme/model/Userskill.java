package shop.mtcoding.pickme.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import shop.mtcoding.pickme.dto.resume.ResumeReq.ResumeSaveReqDto;


@Getter
@Setter
public class Userskill {
    private Integer id;
    private Integer resumeId;
    private String userskillName;
    private Timestamp createdAt;

    public Userskill(ResumeSaveReqDto resumeSaveReqDto) {
        this.userskillName = resumeSaveReqDto.getUserskillList();
        this.resumeId = resumeSaveReqDto.getId();
    }

}
