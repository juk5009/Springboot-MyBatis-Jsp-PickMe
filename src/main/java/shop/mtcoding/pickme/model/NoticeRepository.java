package shop.mtcoding.pickme.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import shop.mtcoding.pickme.dto.notice.NoticeReq.NoticeSaveReqDto;
import shop.mtcoding.pickme.dto.notice.NoticeResp.NoticeMainRespDto;

@Mapper
public interface NoticeRepository {

    public NoticeSaveReqDto findByCompanyIdWithNotice(int id);

    public int insert(Notice notice);

    public int updateById(Notice notice);

    public int deleteById(int id);

    public List<Notice> findAll();

    public Notice findById(int id);

    public List<NoticeMainRespDto> findAllWithCompany();

}
