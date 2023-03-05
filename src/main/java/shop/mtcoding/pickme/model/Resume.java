package shop.mtcoding.pickme.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import shop.mtcoding.pickme.dto.resume.ResumeReq.ResumeSaveReqDto;

@Setter
@Getter
public class Resume {
    private Integer id;
    private Integer userId;
    private String resumeUsername;
    private String resumeBirth;
    private String resumeEmail;
    private String resumeAddress;
    private String resumeLocation;
    private String resumeCareer;
    private String resumeGrade;
    private String resumePhoneNumber;
    private String resumeSex;
    private String resumeContent;
    private Timestamp createdAt;

    public Resume(ResumeSaveReqDto resumeSaveReqDto) {
        this.userId = resumeSaveReqDto.getUserId();
        this.resumeUsername = resumeSaveReqDto.getResumeUsername();
        this.resumeBirth = resumeSaveReqDto.getResumeBirth();
        this.resumeEmail = resumeSaveReqDto.getResumeEmail();
        this.resumeAddress = resumeSaveReqDto.getResumeAddress();
        this.resumeCareer = resumeSaveReqDto.getResumeCareer();
        this.resumeLocation = resumeSaveReqDto.getResumeLocation();
        this.resumeGrade = resumeSaveReqDto.getResumeGrade();
        this.resumePhoneNumber = resumeSaveReqDto.getResumePhoneNumber();
        this.resumeSex = resumeSaveReqDto.getResumeSex();
        this.resumeContent = resumeSaveReqDto.getResumeContent();
    }

};