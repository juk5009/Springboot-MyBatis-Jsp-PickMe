package shop.mtcoding.pickme.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.pickme.dto.resume.ResumeReq.ResumeSaveReqDto;

@Mapper
public interface ResumeRepository {

        public ResumeSaveReqDto findByUserIdWithResume(int id);

        public List<Resume> findAll();

        public Resume findById(int id);

        public User findByUsernameAndPassword(@Param("username") String username, @Param("password") String password);

        public User findByUsername(@Param("username") String username);

        public int insert(Resume resume);

        public int updateById(ResumeSaveReqDto resumeSaveReqDto);

        public int deleteById(int id);
}
