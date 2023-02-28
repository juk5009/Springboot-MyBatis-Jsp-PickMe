package shop.mtcoding.pickme.dto.userskill;

import lombok.Getter;
import lombok.Setter;

public class UserskillReqDto {

    @Getter
    @Setter
    public static class UserskillSaveReqDto {
        private Integer resumeId;
        private String userskillName1;
        private String userskillName2;
        private String userskillName3;
        private String userskillName4;
        private String userskillName5;
        private String userskillName6;
    }

}
