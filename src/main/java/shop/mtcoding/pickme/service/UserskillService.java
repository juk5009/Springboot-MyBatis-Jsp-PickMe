package shop.mtcoding.pickme.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.pickme.dto.userskill.UserskillReqDto.UserskillSaveReqDto;
import shop.mtcoding.pickme.handler.ex.CustomApiException;
import shop.mtcoding.pickme.model.UserskillRespository;

@Transactional(readOnly = true)
@Service
public class UserskillService {

    @Autowired
    private UserskillRespository userskillRespository;

    @Transactional
    public void 보유기술작성(List<String> checkboxList) {
        UserskillSaveReqDto userskillSaveReqDto = new UserskillSaveReqDto();
        // int aa = 1;
        if (checkboxList != null) {
            for (String checkbox : checkboxList) {
                userskillSaveReqDto.setUserskillName(checkbox);
                // userskillSaveReqDto.setResumeId(aa);

                int result = userskillRespository.insert(userskillSaveReqDto);
                if (result != 1) {
                    throw new CustomApiException("보유기술작성 실패", HttpStatus.INTERNAL_SERVER_ERROR);
                }
                System.out.println(userskillSaveReqDto.getUserskillName());
            }
        }

        System.out.println("테스트 dto list : " + userskillSaveReqDto.getUserskillName());

        System.out.println("테스트1 : " + userskillSaveReqDto.getResumeId());
        System.out.println("테스트 체크박스 : " + checkboxList);

    }
}
