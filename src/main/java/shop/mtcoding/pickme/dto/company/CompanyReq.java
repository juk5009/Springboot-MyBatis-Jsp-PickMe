package shop.mtcoding.pickme.dto.company;

import lombok.Getter;
import lombok.Setter;

public class CompanyReq {
    @Getter
    @Setter
    public static class CompanyLoginReqDto {
        private String companyid;
        private String companypassword;
    }
}
