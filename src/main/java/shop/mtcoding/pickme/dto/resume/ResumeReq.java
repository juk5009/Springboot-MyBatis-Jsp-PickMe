package shop.mtcoding.pickme.dto.resume;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

public class ResumeReq {

    @Getter
    @Setter
    public static class ResumeSaveReqDto {
        private Integer userId;
        private Integer resumeId;
        private String resumeName;
        private String resumeBirth;
        private String resumeEmail;
        private String resumeAddress;
        private String resumeLocation;
        private String resumeGrade;
        private String resumePhoneNumber;
        private String resumeSex;
        private String resumeContent;
        private List<String> userskillName;
    }

    @Getter
    @Setter
    public static class UserskillSaveReqDto {
        private Integer resumeId;
        private String userskillName;
    }

}
