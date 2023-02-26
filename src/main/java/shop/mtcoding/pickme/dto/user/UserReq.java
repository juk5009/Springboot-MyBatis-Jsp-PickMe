package shop.mtcoding.pickme.dto.user;

import lombok.Getter;
import lombok.Setter;

public class UserReq {

    @Getter
    @Setter
    public static class UserJoinReqDto {
        private String userId;
        private String userPassword;
        private String userEmail;
    }

    @Getter
    @Setter
    public static class UserLoginReqDto {
        private String userid;
        private String userpassword;
    }
}
