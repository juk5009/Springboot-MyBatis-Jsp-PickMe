package shop.mtcoding.pickme.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.mtcoding.pickme.dto.ResponseDto;
import shop.mtcoding.pickme.dto.resume.ResumeReq.ResumeSaveReqDto;
import shop.mtcoding.pickme.handler.ex.CustomApiException;
import shop.mtcoding.pickme.model.ResumeRepository;
import shop.mtcoding.pickme.model.User;
import shop.mtcoding.pickme.service.ResumeService;

@Controller
public class ResumeController {

    @Autowired
    private ResumeService resumeService;

    @Autowired
    private ResumeRepository resumeRepository;

    @Autowired
    private HttpSession session;

    @PostMapping("/saveResume")
    public @ResponseBody ResponseEntity<?> saveResume(@RequestBody ResumeSaveReqDto resumeSaveReqDto) {
        String test = resumeSaveReqDto.getUserskillList();

        System.out.println("테스트11 : " + test);
        User userPrincipal = (User) session.getAttribute("userPrincipal");
        if (userPrincipal == null) {
            throw new CustomApiException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }

        if (resumeSaveReqDto.getResumeName() == null ||
                resumeSaveReqDto.getResumeName().isEmpty()) {
            throw new CustomApiException("이름을 작성해주세요");
        }
        if (resumeSaveReqDto.getResumeBirth() == null ||
                resumeSaveReqDto.getResumeBirth().isEmpty()) {
            throw new CustomApiException("생년월일을 작성해주세요");
        }
        if (resumeSaveReqDto.getResumeEmail() == null ||
                resumeSaveReqDto.getResumeEmail().isEmpty()) {
            throw new CustomApiException("email 작성해주세요");
        }
        if (resumeSaveReqDto.getResumeAddress() == null ||
                resumeSaveReqDto.getResumeAddress().isEmpty()) {
            throw new CustomApiException("주소를 작성해주세요");
        }
        if (resumeSaveReqDto.getResumeLocation() == null ||
                resumeSaveReqDto.getResumeLocation().isEmpty()) {
            throw new CustomApiException("지역을 선택해주세요");
        }
        if (resumeSaveReqDto.getResumeGrade() == null ||
                resumeSaveReqDto.getResumeGrade().isEmpty()) {
            throw new CustomApiException("학력을 작성해주세요");
        }
        if (resumeSaveReqDto.getResumePhoneNumber() == null ||
                resumeSaveReqDto.getResumePhoneNumber().isEmpty()) {
            throw new CustomApiException("전화번호를 작성해주세요");
        }
        if (resumeSaveReqDto.getResumeSex() == null ||
                resumeSaveReqDto.getResumeSex().isEmpty()) {
            throw new CustomApiException("성별을 작성해주세요");
        }
        if (resumeSaveReqDto.getResumeContent() == null ||
                resumeSaveReqDto.getResumeContent().isEmpty()) {
            throw new CustomApiException("자기소개서를 작성해주세요");
        }
        System.out.println("테스트22 : ");

        // resumeService.이력서작성(resumeSaveReqDto, userPrincipal.getId(), uList);
        return new ResponseEntity<>(new ResponseDto<>(1, "이력서 작성 성공", null), HttpStatus.CREATED);
    }

    @GetMapping("/resume/saveResumeForm")
    public String saveResumeForm() {
        return "resume/saveResumeForm";
    }

    @GetMapping("/resume/{id}")
    public String resumeDetailForm(@PathVariable int id, Model model) {
        model.addAttribute("resumeDto", resumeRepository.findByUserIdWithResume(id));
        return "resume/resumeDetailForm";
    }

}
