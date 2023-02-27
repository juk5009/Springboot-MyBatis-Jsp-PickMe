package shop.mtcoding.pickme.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.pickme.dto.user.UserReq.UserJoinReqDto;
import shop.mtcoding.pickme.dto.user.UserReq.UserLoginReqDto;

@Mapper
public interface UserRepository {
    public int insert(UserJoinReqDto userJoinReqDto);

    public int updateById(@Param("id") int id, @Param("userName") String userName,
            @Param("userPassword") String userPassword, @Param("userEmail") String userEmail);

    public int deleteById(int id);

    public List<User> findAll();

    public User findById(int id);

    public User findByUsernameAndPassword(UserLoginReqDto userLoginReqDto);

}
