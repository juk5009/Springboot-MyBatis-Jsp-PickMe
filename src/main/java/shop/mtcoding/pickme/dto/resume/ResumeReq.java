package shop.mtcoding.pickme.dto.resume;

import lombok.Getter;
import lombok.Setter;

public class ResumeReq {

    @Getter
    @Setter
    public static class ResumeSaveReqDto {
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
        private String userskillList;
    }

    @Getter
    @Setter
    public static class ResumeUpdateReqDto {
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
        private String userskillList;
    }
}
