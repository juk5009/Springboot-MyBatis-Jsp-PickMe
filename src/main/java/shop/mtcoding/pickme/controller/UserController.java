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
        if (userJoinReqDto.getUserId() == null ||
                userJoinReqDto.getUserId().isEmpty()) {
            throw new CustomException("userid 입력해주세요", HttpStatus.BAD_REQUEST);
        }
        if (userJoinReqDto.getUserPassword() == null ||
                userJoinReqDto.getUserPassword().isEmpty()) {
            throw new CustomException("userpassword 입력해주세요", HttpStatus.BAD_REQUEST);
        }
        if (userJoinReqDto.getUserEmail() == null ||
                userJoinReqDto.getUserEmail().isEmpty()) {
            throw new CustomException("useremail 입력해주세요", HttpStatus.BAD_REQUEST);
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
        if (userLoginReqDto.getUserid() == null || userLoginReqDto.getUserid().isEmpty()) {
            throw new CustomException("userid를 작성해주세요");
        }
        if (userLoginReqDto.getUserpassword() == null || userLoginReqDto.getUserpassword().isEmpty()) {
            throw new CustomException("password를 작성해주세요");
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
