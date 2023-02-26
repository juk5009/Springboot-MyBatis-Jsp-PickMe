package shop.mtcoding.pickme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ApplyController {
    @GetMapping("/apply/applyUserList")
    public String applyUserList() {
        return "apply/applyUserList";
    }

    @GetMapping("/apply/applyDetailForm")
    public String applyDetailForm() {
        return "apply/applyDetailForm";
    }

}
