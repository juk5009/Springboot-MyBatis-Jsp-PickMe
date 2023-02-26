package shop.mtcoding.pickme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {


    @GetMapping("/saveNoticeForm")
    public String saveNoticeForm() {
        return "notice/saveNoticeForm";
    }

}
