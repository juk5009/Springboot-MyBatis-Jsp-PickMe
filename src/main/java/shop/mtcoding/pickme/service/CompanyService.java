package shop.mtcoding.pickme.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.pickme.dto.company.CompanyReqDto;
import shop.mtcoding.pickme.handler.ex.CustomException;
import shop.mtcoding.pickme.model.CompanyRepository;

@Service
public class CompanyService {

    @Autowired
    private CompanyRepository companyRepository;

    @Transactional
    public void 기업회원가입(CompanyReqDto companyReqDto) {
        int result = companyRepository.insert(companyReqDto);
        if (result != 1) {
            throw new CustomException("회원가입실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}
