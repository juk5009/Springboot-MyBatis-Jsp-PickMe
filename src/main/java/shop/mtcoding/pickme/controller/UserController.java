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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import shop.mtcoding.pickme.dto.ResponseDto;
import shop.mtcoding.pickme.dto.notice.NoticeResp.NoticeMainRespDto;
import shop.mtcoding.pickme.dto.resume.ResumeResp.ResumeSelectRespDto;
import shop.mtcoding.pickme.dto.user.UserReq.UserJoinReqDto;
import shop.mtcoding.pickme.dto.user.UserReq.UserLoginReqDto;
import shop.mtcoding.pickme.dto.user.UserReq.UserMyPageReqDto;
import shop.mtcoding.pickme.dto.user.UserResp.UserListRespDto;
import shop.mtcoding.pickme.handler.ex.CustomApiException;
import shop.mtcoding.pickme.handler.ex.CustomException;
import shop.mtcoding.pickme.model.CompanyRepository;
import shop.mtcoding.pickme.model.Companyskill;
import shop.mtcoding.pickme.model.CompanyskillRepository;
import shop.mtcoding.pickme.model.Notice;
import shop.mtcoding.pickme.model.NoticeRepository;
import shop.mtcoding.pickme.model.User;
import shop.mtcoding.pickme.model.UserRepository;
import shop.mtcoding.pickme.model.Userskill;
import shop.mtcoding.pickme.model.UserskillRepository;
import shop.mtcoding.pickme.service.UserService;

@Controller
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private NoticeRepository noticeRepository;

    @Autowired
    private UserskillRepository userskillRepository;

    @Autowired
    private CompanyskillRepository companyskillRepository;

    @Autowired
    private UserService userService;

    @Autowired
    private HttpSession session;

    @Autowired
    private CompanyRepository companyRepository;

    @PutMapping("/user/{id}")
    public @ResponseBody ResponseEntity<?> MyPage(@PathVariable int id,
            @RequestBody UserMyPageReqDto userMyPageReqDto) {
        User principal = (User) session.getAttribute("userPrincipal");
        if (principal == null) {
            throw new CustomApiException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }
        if (userMyPageReqDto.getUserName() == null || userMyPageReqDto.getUserName().isEmpty()) {
            throw new CustomApiException("UserName을 작성해주세요");
        }
        if (userMyPageReqDto.getUserPassword() == null || userMyPageReqDto.getUserPassword().isEmpty()) {
            throw new CustomApiException("UserPassword를 작성해주세요");
        }
        if (userMyPageReqDto.getUserEmail() == null || userMyPageReqDto.getUserEmail().isEmpty()) {
            throw new CustomApiException("UserEmail 작성해주세요");
        }
        userService.회원정보수정(id, userMyPageReqDto, principal.getId());

        return new ResponseEntity<>(new ResponseDto<>(1, "정보수정완료", null), HttpStatus.OK);
    }

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

    /*
     * 23. 3. 5. 안정훈
     * 추천공고 페이지 호출
     */
    @GetMapping("/user/userSkillMatchForm")
    public String userSkillMatchForm(Model model,
            @RequestParam(name = "resumeId", defaultValue = "1") int resumeId) {
        User principal = (User) session.getAttribute("userPrincipal");
        if (principal == null) {
            throw new CustomException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }

        List<Notice> userSkillMatch = userskillRepository.findByCompanyskillName(principal.getId(), resumeId);
        List<Userskill> Uskill = userskillRepository.findByUserId(principal.getId());

        for (int i = 0; i < userSkillMatch.size(); i++) {// 공고문 수만큼 도는 for문

            userSkillMatch.get(i)
                    .setSkill(companyskillRepository.findByNoticeId(userSkillMatch.get(i).getId()));
            userSkillMatch.get(i)
                    .setCompanyProfile(
                            companyRepository.findById(userSkillMatch.get(i).getCompanyId()).getCompanyProfile());

            List<Companyskill> Cskill = userSkillMatch.get(i).getSkill();
            for (int x = 0; x < Uskill.size(); x++) {// user가 가진 skill 수만큼 도는 for문
                for (int j = 0; j < Cskill.size(); j++) {// notice가 가진 skill 수만큼 도는 for문
                    if (Cskill.get(j).getCompanyskillName().equals(Uskill.get(x).getUserskillName())) {
                        Companyskill skill = Cskill.get(j);
                        skill.setColor("Y");
                        Cskill.set(j, skill);
                    }
                } // for j end
            } // for x end
        } // for i end

        model.addAttribute("userSkillMatch", userSkillMatch);

        return "user/userSkillMatchForm";
    }

    @GetMapping("/")
    public String main(Model model) {
        List<NoticeMainRespDto> noticeMainList = noticeRepository.findMainList();
        model.addAttribute("noticeMainList", noticeMainList);
        return "user/main";
    }

    @GetMapping("/user/userList")
    public String userList(Model model) {
        List<UserListRespDto> userList = userRepository.findUserList();
        model.addAttribute("userList", userList);
        return "user/userList";
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

    @GetMapping("/user/{id}/userMyPage")
    public String MyPage(@PathVariable int id, Model model, MultipartFile userProfile) {
        User principal = (User) session.getAttribute("userPrincipal");
        if (principal == null) {
            throw new CustomException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }
        User userPS = userRepository.findById(id);
        if (userPS == null) {
            throw new CustomException("해당 정보를 수정할 수 없습니다");
        }
        if (userPS.getUserName() != principal.getUserName()) {
            throw new CustomException("해당정보를 수정할 권한이 없습니다", HttpStatus.FORBIDDEN);
        }
        model.addAttribute("user", userPS);
        User userProfilePS = userRepository.findById(principal.getId());
        model.addAttribute("userProfile", userProfilePS);
        List<ResumeSelectRespDto> resumeSelectList = noticeRepository.findAllWithResume();
        model.addAttribute("resumeSelectList", resumeSelectList);
        return "user/userMyPage";
    }

    @GetMapping("/logout")
    public String logout() {
        session.invalidate();
        return "redirect:/";
    }

    @PostMapping("/user/userProfileUpdate")
    public String userProfileUpdate(MultipartFile userProfile) {
        User userPrincipal = (User) session.getAttribute("userPrincipal");
        if (userPrincipal == null) {
            return "redirect:/loginForm";
        }
        if (userProfile.isEmpty()) {
            throw new CustomException("사진이 전송되지 않았습니다");
        }
        User userPS = userService.유저프로필사진수정(userProfile, userPrincipal.getId());
        session.setAttribute("userPrincipal", userPS);
        return "redirect:/";
    }

}