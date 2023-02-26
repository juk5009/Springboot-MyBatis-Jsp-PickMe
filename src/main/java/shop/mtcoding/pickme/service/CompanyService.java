package shop.mtcoding.pickme.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.pickme.dto.company.CompanyReq.CompanyLoginReqDto;
import shop.mtcoding.pickme.dto.company.CompanyReqDto;
import shop.mtcoding.pickme.handler.ex.CustomException;
import shop.mtcoding.pickme.model.Company;
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

    @Transactional
    public Company 기업로그인(CompanyLoginReqDto companyLoginReqDto) {
        Company comPrincipal = companyRepository.findByUsernameAndPassword(companyLoginReqDto);
        if (comPrincipal == null) {
            throw new CustomException("아이디 혹은 패스워드가 잘못 입력되었습니다.");
        }
        return comPrincipal;
    }

}
