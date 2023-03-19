package shop.mtcoding.pickme.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import shop.mtcoding.pickme.dto.notice.NoticeReq.NoticeSaveReqDto;
import shop.mtcoding.pickme.dto.notice.NoticeResp.NoticeMainRespDto;
import shop.mtcoding.pickme.dto.notice.NoticeResp.NoticeSelectRespDto;
import shop.mtcoding.pickme.dto.resume.ResumeResp.ResumeSelectRespDto;

@Mapper
public interface NoticeRepository {

    public NoticeSaveReqDto findByCompanyIdWithNotice(int id);

    public List<Notice> findAll();

    public Notice findById(int id);

    public List<NoticeMainRespDto> findMainList();

    public int insert(Notice notice);

    public int updateById(@Param("id") int id, @Param("noticeCompanyname") String noticeCompanyname,
            @Param("noticeTitle") String noticeTitle, @Param("noticeEmploytype") String noticeEmploytype,
            @Param("noticeLocation") String noticeLocation, @Param("noticeCareer") String noticeCareer,
            @Param("noticeGrade") String noticeGrade, @Param("noticePay") String noticePay,
            @Param("noticeContent") String noticeContent);

    public int deleteById(int id);

    public List<ResumeSelectRespDto> findAllWithResume();

    public List<NoticeSelectRespDto> findAllWithNotice();

}
