package shop.mtcoding.pickme.dto.company;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CompanyReqDto {
    private String companyId;
    private String companyPassword;
    private String companyEmail;
}
