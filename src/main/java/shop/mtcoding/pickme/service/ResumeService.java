package shop.mtcoding.pickme.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.pickme.dto.resume.ResumeReqDto.ResumeSaveReqDto;
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

}
