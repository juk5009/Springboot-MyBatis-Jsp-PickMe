package shop.mtcoding.pickme.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.mtcoding.pickme.dto.ResponseDto;
import shop.mtcoding.pickme.dto.notice.NoticeReq.NoticeSaveReqDto;
import shop.mtcoding.pickme.handler.ex.CustomApiException;
import shop.mtcoding.pickme.model.Company;
import shop.mtcoding.pickme.model.NoticeRepository;
import shop.mtcoding.pickme.service.NoticeService;

@Controller
public class NoticeController {

    @Autowired
    private HttpSession session;

    @Autowired
    private NoticeService noticeService;

    @Autowired
    private NoticeRepository noticeRepository;

    @PostMapping("/saveNotice")
    public @ResponseBody ResponseEntity<?> resumeSave(@RequestBody NoticeSaveReqDto noticeSaveReqDto) {
        Company comPrincipal = (Company) session.getAttribute("comPrincipal");
        if (comPrincipal == null) {
            throw new CustomApiException("인증이 되지 않았습니다", HttpStatus.UNAUTHORIZED);
        }
        if (noticeSaveReqDto.getNoticeTitle() == null || noticeSaveReqDto.getNoticeTitle().isEmpty()) {
            throw new CustomApiException("제목을 작성해주세요");
        }
        if (noticeSaveReqDto.getNoticeCareer() == null || noticeSaveReqDto.getNoticeCareer().isEmpty()) {
            throw new CustomApiException("경력을 작성해주세요");
        }
        if (noticeSaveReqDto.getNoticePay() == null || noticeSaveReqDto.getNoticePay().isEmpty()) {
            throw new CustomApiException("급여를 작성해주세요");
        }
        if (noticeSaveReqDto.getNoticeEmploytype() == null || noticeSaveReqDto.getNoticeEmploytype().isEmpty()) {
            throw new CustomApiException("근무형태를 작성해주세요");
        }
        if (noticeSaveReqDto.getNoticeGrade() == null || noticeSaveReqDto.getNoticeGrade().isEmpty()) {
            throw new CustomApiException("학력을 작성해주세요");
        }
        if (noticeSaveReqDto.getNoticeLocation() == null || noticeSaveReqDto.getNoticeLocation().isEmpty()) {
            throw new CustomApiException("근무지역을 작성해주세요");
        }
        if (noticeSaveReqDto.getNoticeContent() == null || noticeSaveReqDto.getNoticeContent().isEmpty()) {
            throw new CustomApiException("내용을 작성해주세요");
        }

        noticeService.공고작성(noticeSaveReqDto, comPrincipal.getId());
        return new ResponseEntity<>(new ResponseDto<>(1, "공고 작성 완료", null), HttpStatus.CREATED);
    }

    @GetMapping("/notice/saveNoticeForm")
    public String saveNoticeForm() {
        return "notice/saveNoticeForm";
    }

    @GetMapping("/notice/{id}")
    public String noticeDetailForm(@PathVariable int id, Model model) {
        model.addAttribute("noticeDto", noticeRepository.findByCompanyIdWithNotice(id));
        return "notice/noticeDetailForm";
    }

}
