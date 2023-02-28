package shop.mtcoding.pickme.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import shop.mtcoding.pickme.dto.userskill.UserskillReqDto.UserskillSaveReqDto;

@Mapper
public interface UserskillRespository {
        public List<Userskill> findAll();

        public User findById(int id);

        public int insert(UserskillSaveReqDto userskillSaveReqDto);

        public int updateById(UserskillSaveReqDto userskillSaveReqDto);

        public int deleteById(int id);
}
