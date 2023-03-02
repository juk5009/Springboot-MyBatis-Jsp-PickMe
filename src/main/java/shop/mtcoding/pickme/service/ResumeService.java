package shop.mtcoding.pickme.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import shop.mtcoding.pickme.dto.resume.ResumeReq.ResumeSaveReqDto;
import shop.mtcoding.pickme.dto.userskill.UserskillReqDto.UserskillSaveReqDto;
import shop.mtcoding.pickme.handler.ex.CustomApiException;
import shop.mtcoding.pickme.model.ResumeRepository;
import shop.mtcoding.pickme.model.UserskillRespository;

@Transactional(readOnly = true)
@Service
public class ResumeService {

    @Autowired
    private ResumeRepository resumeRepository;

    @Autowired
    private UserskillRespository userskillRespository;

    @Transactional
    public void 이력서작성(ResumeSaveReqDto resumeSaveReqDto, int principalId) {
        System.out.println("테스트33 : ");
        resumeSaveReqDto.setUserId(principalId);
        // resumeSaveReqDto.setUserskillList(userskillList2);

        int result = resumeRepository.insert(resumeSaveReqDto);
        if (result != 1) {
            throw new CustomApiException("이력서 작성 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }

        UserskillSaveReqDto  userskillSaveReqDto = new UserskillSaveReqDto();
        
        System.out.println("테스트44 : ");
        // if (userskillList2 != null) {
        //     for (String userskill : resumeSaveReqDto.getUserskillList() ) {
        //         userskillSaveReqDto.setUserskillName(userskill);

        //         int result2 = userskillRespository.insert(resumeSaveReqDto.getId(), userskillSaveReqDto.getUserskillName());
        //         if (result2 != 1) {
        //             throw new CustomApiException("보유기술작성 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        //         }
        //         System.out.println(userskillSaveReqDto.getUserskillName());

        //     }
        // }

        System.out.println("테스트1 : " + userskillSaveReqDto.getResumeId());

    }

}
