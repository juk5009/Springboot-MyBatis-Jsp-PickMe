package shop.mtcoding.pickme.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.pickme.dto.user.UserReq.UserJoinReqDto;
import shop.mtcoding.pickme.dto.user.UserReq.UserLoginReqDto;
import shop.mtcoding.pickme.handler.ex.CustomException;
import shop.mtcoding.pickme.model.User;
import shop.mtcoding.pickme.model.UserRepository;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Transactional
    public void 회원가입(UserJoinReqDto userJoinReqDto) {
        int result = userRepository.insert(userJoinReqDto);
        if (result != 1) {
            throw new CustomException("회원가입실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Transactional
    public User 유저로그인(UserLoginReqDto userLoginReqDto) {
        User userPrincipal = userRepository.findByUsernameAndPassword(userLoginReqDto);
        if (userPrincipal == null) {
            throw new CustomException("아이디 혹은 패스워드가 잘못 입력되었습니다.");
        }
        return userPrincipal;
    }

}
