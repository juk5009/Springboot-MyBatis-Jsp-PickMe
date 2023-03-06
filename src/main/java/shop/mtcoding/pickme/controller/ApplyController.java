package shop.mtcoding.pickme.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import shop.mtcoding.pickme.dto.ResponseDto;
import shop.mtcoding.pickme.dto.apply.ApplyReq.ApplyResumeSelectReqDto;
import shop.mtcoding.pickme.handler.ex.CustomException;
import shop.mtcoding.pickme.model.ApplyRepository;
import shop.mtcoding.pickme.model.Company;

@Controller
public class ApplyController {

    @Autowired
    private ApplyRepository applyRepository;

    @Autowired
    private HttpSession session;

    @GetMapping("/apply/applyUserList")
    public String applyUserList() {
        Company CompanyPrincipal = (Company) session.getAttribute("CompanyPrincipal");
        if (CompanyPrincipal == null) {
            throw new CustomException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }
        return "apply/applyUserList";
    }

    @GetMapping("/apply/{id}")
    public String applyDetailForm(@PathVariable int id) {
        Company CompanyPrincipal = (Company) session.getAttribute("CompanyPrincipal");
        if (CompanyPrincipal == null) {
            throw new CustomException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }
        return "apply/applyDetailForm";
    }

    @PostMapping("/apply/applyResumeSelect")
    public ResponseEntity<?> applyResumeSelect(@RequestBody ApplyResumeSelectReqDto applyResumeSelectReqDto) {
        int result = applyRepository.insert(applyResumeSelectReqDto);
        return new ResponseEntity<>(new ResponseDto<>(1, "지원성공", result), HttpStatus.CREATED);
    }

}
