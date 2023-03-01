package shop.mtcoding.pickme.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.mtcoding.pickme.dto.ResponseDto;
import shop.mtcoding.pickme.service.UserskillService;

@Controller
public class UserskillController {

    @Autowired
    private UserskillService userskillService;

    @PostMapping("/saveUserskill")
    public @ResponseBody ResponseEntity<?> saveUserskill(
            @RequestParam(value = "userskillName", required = false) List<String> checkboxList) {

        userskillService.보유기술작성(checkboxList);
        return new ResponseEntity<>(new ResponseDto<>(1, "유저보유기술 작성 성공", null), HttpStatus.CREATED);
    }

    @GetMapping("/saveTempUserskillForm")
    public String saveTempUserskillForm() {

        return "resume/saveTempUserskillForm";
    }

}
