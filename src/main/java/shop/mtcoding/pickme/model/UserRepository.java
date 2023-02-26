package shop.mtcoding.pickme.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import shop.mtcoding.pickme.dto.user.UserReq.UserJoinReqDto;

@Mapper
public interface UserRepository {
    public int insert(UserJoinReqDto userJoinReqDto);

    public int updateById(User user);

    public int deleteById(int id);

    public List<User> findAll();

    public User findById(int id);
}
