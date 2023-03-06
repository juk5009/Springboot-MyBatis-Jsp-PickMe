package shop.mtcoding.pickme.dto.apply;

import lombok.Getter;
import lombok.Setter;

public class ApplyResp {

    @Setter
    @Getter
    public static class ApplyListRespDto {
        private Integer id;
        private String resumeUsername;
        private String resumeCareer;
        private String resumeGrade;
    }
}
