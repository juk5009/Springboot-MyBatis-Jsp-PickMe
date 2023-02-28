package shop.mtcoding.pickme.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.pickme.dto.notice.NoticeReq.NoticeSaveReqDto;
import shop.mtcoding.pickme.handler.ex.CustomApiException;
import shop.mtcoding.pickme.model.NoticeRepository;

@Service
public class NoticeService {

    @Autowired
    private NoticeRepository noticeRepository;

    @Transactional

    public void 공고작성(NoticeSaveReqDto noticeSaveReqDto, int comPrincipalId) {
        noticeSaveReqDto.setCompanyId(comPrincipalId);

        int result = noticeRepository.insert(noticeSaveReqDto);

        if (result != 1) {
            throw new CustomApiException("공고작성실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
