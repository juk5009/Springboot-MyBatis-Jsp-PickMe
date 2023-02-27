package shop.mtcoding.pickme.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import shop.mtcoding.pickme.dto.user.UserReq.UserJoinReqDto;
import shop.mtcoding.pickme.dto.user.UserReq.UserLoginReqDto;
import shop.mtcoding.pickme.handler.ex.CustomException;
import shop.mtcoding.pickme.model.User;
import shop.mtcoding.pickme.model.UserRepository;
import shop.mtcoding.pickme.service.UserService;

@Controller
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserService userService;

    @Autowired
    private HttpSession session;

    @PostMapping("/userJoin")
    public String join(UserJoinReqDto userJoinReqDto) {
        if (userJoinReqDto.getUserName() == null ||
                userJoinReqDto.getUserName().isEmpty()) {
            throw new CustomException("userName를 입력해주세요", HttpStatus.BAD_REQUEST);
        }
        if (userJoinReqDto.getUserPassword() == null ||
                userJoinReqDto.getUserPassword().isEmpty()) {
            throw new CustomException("userPassword 입력해주세요", HttpStatus.BAD_REQUEST);
        }
        if (userJoinReqDto.getUserEmail() == null ||
                userJoinReqDto.getUserEmail().isEmpty()) {
            throw new CustomException("userEmail 입력해주세요", HttpStatus.BAD_REQUEST);
        }

        userService.회원가입(userJoinReqDto);

        return "redirect:/loginForm";
    }

    @GetMapping("/loginForm")
    public String loginForm() {
        return "user/loginForm";
    }

    @PostMapping("/userlogin")
    public String userlogin(UserLoginReqDto userLoginReqDto) {
        if (userLoginReqDto.getUserName() == null || userLoginReqDto.getUserName().isEmpty()) {
            throw new CustomException("userName를 작성해주세요");
        }
        if (userLoginReqDto.getUserPassword() == null || userLoginReqDto.getUserPassword().isEmpty()) {
            throw new CustomException("userPassword를 작성해주세요");
        }
        User userPrincipal = userService.유저로그인(userLoginReqDto);
        session.setAttribute("userPrincipal", userPrincipal);
        return "redirect:/";
    }

    @GetMapping("/")
    public String main() {
        return "user/main";
    }

    @GetMapping("/userJoinForm")
    public String userJoinForm() {
        return "user/userJoinForm";
    }

    @GetMapping("/user/resumeForm")
    public String resumeForm() {
        return "user/resumeForm";
    }

    @GetMapping("/user/joinType")
    public String joinType() {
        return "user/joinType";
    }

    @GetMapping("/user/userMyPage")
    public String mypage() {
        return "user/userMyPage";
    }
}
