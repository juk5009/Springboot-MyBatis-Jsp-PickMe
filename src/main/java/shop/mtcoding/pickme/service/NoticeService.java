package shop.mtcoding.pickme.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.pickme.dto.notice.NoticeReq.NoticeSaveReqDto;
import shop.mtcoding.pickme.dto.notice.NoticeReq.NoticeUpdateReqDto;
import shop.mtcoding.pickme.handler.ex.CustomApiException;
import shop.mtcoding.pickme.model.Companyskill;
import shop.mtcoding.pickme.model.CompanyskillRepository;
import shop.mtcoding.pickme.model.Notice;
import shop.mtcoding.pickme.model.NoticeRepository;

@Transactional(readOnly = true)
@Service
public class NoticeService {

    @Autowired
    private NoticeRepository noticeRepository;

    @Autowired
    private CompanyskillRepository companyskillRepository;

    @Transactional
    public void 공고작성(NoticeSaveReqDto noticeSaveReqDto, int comPrincipalId, String comSkill) {
        /* 세션에 있는 id값을 set 해줌 */
        noticeSaveReqDto.setCompanyId(comPrincipalId);

        Notice notice = new Notice(noticeSaveReqDto);
        System.out.println("테스트31 getCompanyId : " + noticeSaveReqDto.getCompanyId());
        System.out.println("테스트31 getNoticeEmploytype : " + noticeSaveReqDto.getNoticeEmploytype());
        System.out.println("테스트31 noticeSaveReqDto Id: " + noticeSaveReqDto.getId()); // null
        System.out.println("테스트31 notice grade : " + notice.getNoticeGrade());
        System.out.println("테스트31 notice Id : " + notice.getId()); // null

        int result = noticeRepository.insert(notice);
        if (result != 1) {
            throw new CustomApiException("공고작성실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        // insert 성공 후 notice 증가한 id(pk)값을 set 해줌
        noticeSaveReqDto.setId(notice.getId());
        // insert 성공 후 notice companyId값을 set 해줌
        noticeSaveReqDto.setCompanyId(notice.getCompanyId());

        /* checkbox의 체크된 값을 string으로 받아 왔기 때문에 split 하여 list에 담아줌 */
        List<String> companyskillList = Arrays.asList(comSkill.split(","));
        Companyskill com = new Companyskill(noticeSaveReqDto);
        System.out.println("테스트 companyskillList" + companyskillList);
        System.out.println("테스트 Companyskill : " + com.getCompanyskillName());
        System.out.println("테스트44 : " + companyskillList.size());
        System.out.println("테스트444 : " + com.getNoticeId());
        System.out.println("테스트445 : " + com.getCompanyId());

        /* list 내용을 for문 돌려서 companyskill_tb에 insert 해줌 */
        if (companyskillList != null) {
            for (String companyskill : companyskillList) {

                int result2 = companyskillRepository.insert(com.getNoticeId(), com.getCompanyId(), companyskill);
                if (result2 != 1) {
                    throw new CustomApiException("요구 기술작성 실패", HttpStatus.INTERNAL_SERVER_ERROR);

                }
                System.out.println("테스트55 : " + companyskill);
            }

        }
    }

    @Transactional
    public void 공고수정(int id, NoticeUpdateReqDto noticeUpdateReqDto, int comPrincipalId, String comSkill) {

        Notice noticePS = noticeRepository.findById(id);
        if (noticePS == null) {
            throw new CustomApiException("없는 공고입니다.");
        }
        if (noticePS.getCompanyId() != comPrincipalId) {
            throw new CustomApiException("해당 공고를 수정할 권한이 없습니다.", HttpStatus.FORBIDDEN);
        }
        noticeUpdateReqDto.setId(noticePS.getId());
        noticeUpdateReqDto.setCompanyId(noticePS.getCompanyId());

        System.out.println("수정테스트31 getNoticeEmploytype : " +
                noticeUpdateReqDto.getNoticeEmploytype());
        System.out.println("수정테스트31 notice grade : " +
                noticeUpdateReqDto.getNoticeGrade());

        int result = noticeRepository.updateById(id,
                noticeUpdateReqDto.getNoticeTitle(),
                noticeUpdateReqDto.getNoticeCompanyname(),
                noticeUpdateReqDto.getNoticeCareer(),
                noticeUpdateReqDto.getNoticeEmploytype(),
                noticeUpdateReqDto.getNoticeLocation(),
                noticeUpdateReqDto.getNoticePay(), noticeUpdateReqDto.getNoticeContent(),
                noticeUpdateReqDto.getNoticeGrade());
        if (result != 1) {
            throw new CustomApiException("공고수정실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }

        System.out.println("수정테스트31 notice grade : ");

        companyskillRepository.deleteByNoticeId(id);

        List<String> companyskillList = Arrays.asList(comSkill.split(","));

        Companyskill com = new Companyskill(noticeUpdateReqDto);
        System.out.println("수정테스트 Companyskill : " + com.getCompanyskillName());
        System.out.println("수정테스트44 : " + companyskillList.size());
        System.out.println("수정테스트444 : " + com.getNoticeId());
        System.out.println("수정테스트445 : " + com.getCompanyId());

        /* list 내용을 for문 돌려서 companyskill_tb에 insert 해줌 */
        if (companyskillList != null) {
            for (String companyskill : companyskillList) {

                int result2 = companyskillRepository.insert(com.getNoticeId(), com.getCompanyId(), companyskill);
                if (result2 != 1) {
                    throw new CustomApiException("요구 기술작성 실패", HttpStatus.INTERNAL_SERVER_ERROR);

                }
                System.out.println("테스트55 : " + companyskill);
            }

        }
    }

    @Transactional
    public void 공고삭제(int id, int companyId) {
        Notice noticePS = noticeRepository.findById(id);
        if (noticePS == null) {
            throw new CustomApiException("없는 공고입니다.");
        }
        if (noticePS.getCompanyId() != companyId) {
            throw new CustomApiException("해당 공고를 삭제할 권한이 없습니다.", HttpStatus.FORBIDDEN);
        }
        try {
            noticeRepository.deleteById(id);
        } catch (Exception e) {
            throw new CustomApiException("서버에 일시적인 문제가 생겼습니다", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
