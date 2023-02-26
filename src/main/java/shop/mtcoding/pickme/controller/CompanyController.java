package shop.mtcoding.pickme.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import shop.mtcoding.pickme.dto.company.CompanyReq.CompanyLoginReqDto;
import shop.mtcoding.pickme.dto.company.CompanyReqDto;
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

    @PostMapping("/companylogin")
    public String companylogin(CompanyLoginReqDto companyLoginReqDto) {
        if (companyLoginReqDto.getCompanyid() == null || companyLoginReqDto.getCompanyid().isEmpty()) {
            throw new CustomException("userid를 작성해주세요");
        }
        if (companyLoginReqDto.getCompanypassword() == null || companyLoginReqDto.getCompanypassword().isEmpty()) {
            throw new CustomException("password를 작성해주세요");
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
