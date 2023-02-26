package shop.mtcoding.pickme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CompanyController {

    @GetMapping("/companyJoinForm")
    public String companyJoinForm() {
        return "company/companyJoinForm";
    }

    @GetMapping("/company/companyMyPage")
    public String companyMyPage() {
        return "company/companyMyPage";
    }
}
