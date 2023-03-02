package shop.mtcoding.pickme.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.pickme.dto.resume.ResumeReq.ResumeSaveReqDto;
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
        resumeSaveReqDto.setUserId(principalId);
        
        Resume resume = new Resume(resumeSaveReqDto);
        System.out.println("테스트31 userId: " + resumeSaveReqDto.getUserId());
        System.out.println("테스트31 email: " + resumeSaveReqDto.getResumeEmail());

        
        int result = resumeRepository.insert(resume);
        if (result != 1) {
            throw new CustomApiException("이력서 작성 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }


        System.out.println("테스트33 userId: " + resume.getUserId());
        System.out.println("테스트33 email: " + resume.getResumeEmail());
        System.out.println("테스트33 id : " + resume.getId());


        // insert 성공 후 resume의 증가한 id(pk)값을 set 해줌 
        resumeSaveReqDto.setId(resume.getId()); 

        /* checkbox의 체크된 값을 string으로 받아 왔기 때문에 split 하여 list에 담아줌 */
        List<String> userskillList = Arrays.asList(usSkill.split(","));
        Userskill us = new Userskill(resumeSaveReqDto);
        System.out.println("테스트44 : " + userskillList.size());
        System.out.println("테스트444 : " + us.getResumeId());
     

        /* list 내용을 for문 돌려서 userskill_tb에 insert 해줌 */
        if (userskillList != null) {
            for (String userskill : userskillList) {

                int result2 = userskillRespository.insert(us.getResumeId(), userskill);
                if (result2 != 1) {
                    throw new CustomApiException("보유기술작성 실패", HttpStatus.INTERNAL_SERVER_ERROR);
                }
                System.out.println("테스트55 : " + userskill);
            }

        }
    }

}
