package shop.mtcoding.pickme.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import shop.mtcoding.pickme.dto.notice.NoticeReq.NoticeSaveReqDto;

@Mapper
public interface NoticeRepository {

    public NoticeSaveReqDto findByCompanyIdWithNotice(int id);

    public int insert(NoticeSaveReqDto noticeSaveReqDto);

    public int updateById(Notice notice);

    public int deleteById(int id);

    public List<Notice> findAll();

    public Notice findById(int id);

}
