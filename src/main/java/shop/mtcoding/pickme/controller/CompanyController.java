package shop.mtcoding.pickme.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import shop.mtcoding.pickme.dto.company.CompanyReq.CompanyJoinReqDto;
import shop.mtcoding.pickme.dto.company.CompanyReq.CompanyLoginReqDto;
import shop.mtcoding.pickme.handler.ex.CustomException;
import shop.mtcoding.pickme.model.Company;
import shop.mtcoding.pickme.service.CompanyService;

@Controller
public class CompanyController {

    @Autowired
    private CompanyService companyService;

    @Autowired
    private HttpSession session;

    @PostMapping("/companyJoin")
    public String companyJoin(CompanyJoinReqDto companyJoinReqDto) {
        if (companyJoinReqDto.getCompanyName() == null ||
                companyJoinReqDto.getCompanyName().isEmpty()) {
            throw new CustomException("CompanyName을 입력해주세요", HttpStatus.BAD_REQUEST);
        }
        if (companyJoinReqDto.getCompanyPassword() == null ||
                companyJoinReqDto.getCompanyPassword().isEmpty()) {
            throw new CustomException("CompanyPassword을 입력해주세요", HttpStatus.BAD_REQUEST);
        }
        if (companyJoinReqDto.getCompanyEmail() == null ||
                companyJoinReqDto.getCompanyEmail().isEmpty()) {
            throw new CustomException("CompanyEmail입력해주세요", HttpStatus.BAD_REQUEST);
        }

        companyService.기업회원가입(companyJoinReqDto);

        return "redirect:/loginForm";
    }

    @PostMapping("/companylogin")
    public String companylogin(CompanyLoginReqDto companyLoginReqDto) {
        if (companyLoginReqDto.getCompanyName() == null || companyLoginReqDto.getCompanyName().isEmpty()) {
            throw new CustomException("CompanyName을 작성해주세요");
        }
        if (companyLoginReqDto.getCompanyPassword() == null || companyLoginReqDto.getCompanyPassword().isEmpty()) {
            throw new CustomException("CompanyPassword을 작성해주세요");
        }
        Company comPrincipal = companyService.기업로그인(companyLoginReqDto);
        session.setAttribute("comPrincipal", comPrincipal);
        return "redirect:/";
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
