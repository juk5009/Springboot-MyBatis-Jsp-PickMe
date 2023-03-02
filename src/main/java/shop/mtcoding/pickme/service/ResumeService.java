package shop.mtcoding.pickme.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.pickme.dto.resume.ResumeReq.ResumeSaveReqDto;
import shop.mtcoding.pickme.dto.resume.ResumeReq.UserskillSaveReqDto;
import shop.mtcoding.pickme.handler.ex.CustomApiException;
import shop.mtcoding.pickme.model.ResumeRepository;

@Transactional(readOnly = true)
@Service
public class ResumeService {

    @Autowired
    private ResumeRepository resumeRepository;

    @Transactional
    public void 이력서작성(ResumeSaveReqDto resumeSaveReqDto, int principalId) {
        resumeSaveReqDto.setUserId(principalId);

        int result = resumeRepository.insert(resumeSaveReqDto);
        if (result != 1) {
            throw new CustomApiException("이력서 작성 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Transactional
    public void 보유기술작성(ResumeSaveReqDto resumeSaveReqDto) {
        UserskillSaveReqDto userskillSaveReqDto = new UserskillSaveReqDto();

        if (resumeSaveReqDto.getUserskillName() != null) {
            for (String checkbox : resumeSaveReqDto.getUserskillName()) {
                userskillSaveReqDto.setUserskillName(checkbox);

                System.out.println(userskillSaveReqDto.getUserskillName());

                int result = resumeRepository.insertUserskill(userskillSaveReqDto);
                if (result != 1) {
                    throw new CustomApiException("보유기술작성 실패", HttpStatus.INTERNAL_SERVER_ERROR);
                }
            }
        }

        System.out.println("테스트 dto list : " + userskillSaveReqDto.getUserskillName());

        System.out.println("테스트1 : " + userskillSaveReqDto.getResumeId());
        System.out.println("테스트 체크박스 : " + resumeSaveReqDto.getUserskillName());

    }

}
