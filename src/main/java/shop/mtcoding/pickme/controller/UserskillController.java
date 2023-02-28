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
import org.springframework.web.bind.annotation.ResponseBody;

import shop.mtcoding.pickme.dto.ResponseDto;
import shop.mtcoding.pickme.dto.userskill.UserskillReqDto.UserskillSaveReqDto;
import shop.mtcoding.pickme.handler.ex.CustomApiException;
import shop.mtcoding.pickme.model.Resume;
import shop.mtcoding.pickme.model.User;
import shop.mtcoding.pickme.model.UserskillRespository;
import shop.mtcoding.pickme.service.UserskillService;

@Controller
public class UserskillController {

    @Autowired
    private UserskillRespository userskillRespository;

    @Autowired
    private HttpSession session;

    @Autowired
    private UserskillService userskillService;

    @PostMapping("/saveUserskill/{id}")
    public @ResponseBody ResponseEntity<?> saveUserskill(@PathVariable int id, @RequestBody UserskillSaveReqDto userskillSaveReqDto) {
        User userPrincipal = (User) session.getAttribute("userPrincipal");
        if (userPrincipal == null) {
            throw new CustomApiException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }

        Resume resume = new Resume();
        if (id == resume.getId()) {
            id = resume.getId();
        }

        userskillService.보유기술작성(id, userskillSaveReqDto);

        return new ResponseEntity<>(new ResponseDto<>(1, "유저보유기술 작성 성공", null), HttpStatus.CREATED);

    }

    @GetMapping("/saveTempUserskillForm")
    public String saveTempUserskillForm() {
        return "resume/saveTempUserskillForm";
    }



}
