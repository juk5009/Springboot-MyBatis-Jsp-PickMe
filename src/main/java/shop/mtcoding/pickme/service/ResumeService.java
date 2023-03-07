package shop.mtcoding.pickme.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.pickme.dto.resume.ResumeReq.ResumeSaveReqDto;
import shop.mtcoding.pickme.dto.resume.ResumeReq.ResumeUpdateReqDto;
import shop.mtcoding.pickme.handler.ex.CustomApiException;
import shop.mtcoding.pickme.model.Resume;
import shop.mtcoding.pickme.model.ResumeRepository;
import shop.mtcoding.pickme.model.Userskill;
import shop.mtcoding.pickme.model.UserskillRespository;

@Transactional(readOnly = true)
@Service
public class ResumeService {

    @Autowired
    private ResumeRepository resumeRepository;

    @Autowired
    private UserskillRespository userskillRespository;

    @Transactional
    public void 이력서작성(ResumeSaveReqDto resumeSaveReqDto, int principalId, String usSkill) {
        /* 세션에 있는 id값을 set 해줌 */
        resumeSaveReqDto.setUserId(principalId);

        Resume resume = new Resume(resumeSaveReqDto);

        int result = resumeRepository.insert(resume);
        if (result != 1) {
            throw new CustomApiException("이력서 작성 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }

        // insert 성공 후 resume의 증가한 id(pk)값을 set 해줌
        resumeSaveReqDto.setId(resume.getId());
        // insert 성공 후 resume의 usrId값을 set 해줌
        resumeSaveReqDto.setUserId(resume.getUserId());

        /* checkbox의 체크된 값을 string으로 받아 왔기 때문에 split 하여 list에 담아줌 */
        List<String> userskillList = Arrays.asList(usSkill.split(","));
        Userskill us = new Userskill(resumeSaveReqDto);

        /* list 내용을 for문 돌려서 userskill_tb에 insert 해줌 */
        if (userskillList != null) {
            for (String userskill : userskillList) {

                int result2 = userskillRespository.insert(us.getResumeId(), us.getUserId(), userskill);
                if (result2 != 1) {
                    throw new CustomApiException("보유기술작성 실패", HttpStatus.INTERNAL_SERVER_ERROR);
                }
            }

        }
    }

    @Transactional
    public void 이력서삭제(int id, int userPrincipalId) {
        Resume resumePS = resumeRepository.findById(id);
        if (resumePS == null) {
            throw new CustomApiException("없는 공고입니다.");
        }
        if (resumePS.getId() != userPrincipalId) {
            throw new CustomApiException("해당 공고를 삭제할 권한이 없습니다.", HttpStatus.FORBIDDEN);
        }

        try {
            resumeRepository.deleteById(id);
        } catch (Exception e) {
            throw new CustomApiException("서버에 일시적인 문제가 생겼습니다", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Transactional
    public void 이력서수정(int id, ResumeUpdateReqDto resumeUpdateReqDto, int userPrincipalId, String usSkill) {

        Resume resumePS = resumeRepository.findById(id);

        if (resumePS == null) {
            throw new CustomApiException("없는 이력서입니다.");
        }
        if (resumePS.getId() != userPrincipalId) {
            throw new CustomApiException("이력서를 삭제할 권한이 없습니다.", HttpStatus.FORBIDDEN);
        }
        resumeUpdateReqDto.setId(resumePS.getId());
        resumeUpdateReqDto.setUserId(resumePS.getId());

        int result = resumeRepository.updateById(id,
                resumeUpdateReqDto.getResumeUsername(),
                resumeUpdateReqDto.getResumeBirth(),
                resumeUpdateReqDto.getResumeEmail(),
                resumeUpdateReqDto.getResumeAddress(),
                resumeUpdateReqDto.getResumeLocation(),
                resumeUpdateReqDto.getResumeCareer(),
                resumeUpdateReqDto.getResumeGrade(), resumeUpdateReqDto.getResumePhoneNumber(),
                resumeUpdateReqDto.getResumeSex(),
                resumeUpdateReqDto.getResumeContent());
        if (result != 1) {
            throw new CustomApiException("공고수정실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }

        System.out.println("수정테스트31 notice grade : ");

        userskillRespository.deleteByResumeId(id);

        List<String> userskillList = Arrays.asList(usSkill.split(","));
        Userskill us = new Userskill(resumeUpdateReqDto);

        /* list 내용을 for문 돌려서 userskill_tb에 insert 해줌 */
        if (userskillList != null) {
            for (String userskill : userskillList) {

                int result2 = userskillRespository.insert(us.getResumeId(), us.getUserId(), userskill);
                if (result2 != 1) {
                    throw new CustomApiException("보유기술작성 실패", HttpStatus.INTERNAL_SERVER_ERROR);
                }
            }

        }
    }

}
