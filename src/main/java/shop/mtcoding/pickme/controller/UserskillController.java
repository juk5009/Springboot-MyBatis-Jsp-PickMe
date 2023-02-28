package shop.mtcoding.pickme.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.mtcoding.pickme.dto.ResponseDto;
import shop.mtcoding.pickme.dto.userskill.UserskillReqDto.UserskillSaveReqDto;
import shop.mtcoding.pickme.handler.ex.CustomApiException;
import shop.mtcoding.pickme.model.User;
import shop.mtcoding.pickme.model.UserskillRespository;
import shop.mtcoding.pickme.service.userskillService;

@Controller
public class UserskillController {

    @Autowired
    private UserskillRespository userskillRespository;

    @Autowired
    private HttpSession session;

    @PostMapping("/saveUserskill")
    public @ResponseBody ResponseEntity<?> saveUserskill(@RequestBody UserskillSaveReqDto userskillSaveReqDto) {
        User userPrincipal = (User) session.getAttribute("userPrincipal");
        if (userPrincipal == null) {
            throw new CustomApiException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }


        userskillService.보유기술작성(userskillSaveReqDto, userPrincipal.getId());

        return new ResponseEntity<>(new ResponseDto<>(1, "이력서 작성 성공", null), HttpStatus.CREATED);

    }

    @GetMapping("/saveTempUserskillForm")
    public String saveTempUserskillForm() {
        return "resume/saveTempUserskillForm";
    }



}
