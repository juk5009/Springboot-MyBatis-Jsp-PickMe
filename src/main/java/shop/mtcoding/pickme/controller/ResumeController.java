package shop.mtcoding.pickme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ResumeController {

    @GetMapping("/resume/saveResumeForm")
    public String resumeForm() {
        return "resume/saveResumeForm";
    }

}
