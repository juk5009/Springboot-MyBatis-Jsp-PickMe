package shop.mtcoding.pickme.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import shop.mtcoding.pickme.dto.company.CompanyReqDto;
import shop.mtcoding.pickme.handler.ex.CustomException;
import shop.mtcoding.pickme.service.CompanyService;

@Controller
public class CompanyController {

    @Autowired
    private CompanyService companyService;

    @PostMapping("/companyJoin")
    public String companyJoin(CompanyReqDto companyReqDto) {
        if (companyReqDto.getCompanyId() == null ||
                companyReqDto.getCompanyId().isEmpty()) {
            throw new CustomException("CompanyId 입력해주세요", HttpStatus.BAD_REQUEST);
        }
        if (companyReqDto.getCompanyPassword() == null ||
                companyReqDto.getCompanyPassword().isEmpty()) {
            throw new CustomException("CompanyPassword 입력해주세요", HttpStatus.BAD_REQUEST);
        }
        if (companyReqDto.getCompanyEmail() == null ||
                companyReqDto.getCompanyEmail().isEmpty()) {
            throw new CustomException("CompanyEmail입력해주세요", HttpStatus.BAD_REQUEST);
        }

        companyService.기업회원가입(companyReqDto);

        return "redirect:/loginForm";
    }

    @GetMapping("/companyJoinForm")
    public String companyJoinForm() {
        return "company/companyJoinForm";
    }

    @GetMapping("/company/companyMyPage")
    public String companyMyPage() {
        return "company/companyMyPage";
    }

}
