package shop.mtcoding.pickme.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.mtcoding.pickme.dto.ResponseDto;
import shop.mtcoding.pickme.dto.notice.NoticeReq.NoticeSaveReqDto;
import shop.mtcoding.pickme.dto.notice.NoticeReq.NoticeUpdateReqDto;
import shop.mtcoding.pickme.dto.resume.ResumeResp.ResumeSelectRespDto;
import shop.mtcoding.pickme.handler.ex.CustomApiException;
import shop.mtcoding.pickme.handler.ex.CustomException;
import shop.mtcoding.pickme.model.Company;
import shop.mtcoding.pickme.model.Companyskill;
import shop.mtcoding.pickme.model.CompanyskillRepository;
import shop.mtcoding.pickme.model.Notice;
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

    @Autowired
    private CompanyskillRepository companyskillRepository;

    @PostMapping("/saveNotice")
    public @ResponseBody ResponseEntity<?> saveNotice(@RequestBody NoticeSaveReqDto noticeSaveReqDto) {
        String comSkill = noticeSaveReqDto.getCompanyskillList();

        Company comPrincipal = (Company) session.getAttribute("comPrincipal");
        if (comPrincipal == null) {
            throw new CustomApiException("????????? ?????? ???????????????", HttpStatus.UNAUTHORIZED);
        }
        if (noticeSaveReqDto.getNoticeTitle() == null || noticeSaveReqDto.getNoticeTitle().isEmpty()) {
            throw new CustomApiException("????????? ??????????????????");
        }
        if (noticeSaveReqDto.getNoticeCompanyname() == null || noticeSaveReqDto.getNoticeCompanyname().isEmpty()) {
            throw new CustomApiException("?????? ????????? ??????????????????");
        }
        if (noticeSaveReqDto.getNoticeCareer() == null || noticeSaveReqDto.getNoticeCareer().isEmpty()) {
            throw new CustomApiException("????????? ??????????????????");
        }
        if (noticeSaveReqDto.getNoticePay() == null || noticeSaveReqDto.getNoticePay().isEmpty()) {
            throw new CustomApiException("????????? ??????????????????");
        }
        if (noticeSaveReqDto.getNoticeEmploytype() == null || noticeSaveReqDto.getNoticeEmploytype().isEmpty()) {
            throw new CustomApiException("??????????????? ??????????????????");
        }
        if (noticeSaveReqDto.getNoticeGrade() == null || noticeSaveReqDto.getNoticeGrade().isEmpty()) {
            throw new CustomApiException("????????? ??????????????????");
        }
        if (noticeSaveReqDto.getNoticeLocation() == null || noticeSaveReqDto.getNoticeLocation().isEmpty()) {
            throw new CustomApiException("??????????????? ??????????????????");
        }
        if (noticeSaveReqDto.getNoticeContent() == null || noticeSaveReqDto.getNoticeContent().isEmpty()) {
            throw new CustomApiException("????????? ??????????????????");
        }

        noticeService.????????????(noticeSaveReqDto, comPrincipal.getId(), comSkill);
        return new ResponseEntity<>(new ResponseDto<>(1, "?????? ?????? ??????", null), HttpStatus.CREATED);
    }

    @PutMapping("/notice/{id}")
    public @ResponseBody ResponseEntity<?> updateNotice(@PathVariable int id,
            @RequestBody NoticeUpdateReqDto noticeUpdateReqDto) {
        String comSkill = noticeUpdateReqDto.getCompanyskillList();

        Company comPrincipal = (Company) session.getAttribute("comPrincipal");
        if (comPrincipal == null) {
            throw new CustomApiException("????????? ?????? ???????????????", HttpStatus.UNAUTHORIZED);
        }
        if (noticeUpdateReqDto.getNoticeTitle() == null || noticeUpdateReqDto.getNoticeTitle().isEmpty()) {
            throw new CustomApiException("????????? ??????????????????");
        }
        if (noticeUpdateReqDto.getNoticeCompanyname() == null || noticeUpdateReqDto.getNoticeCompanyname().isEmpty()) {
            throw new CustomApiException("?????? ????????? ??????????????????");
        }
        if (noticeUpdateReqDto.getNoticeCareer() == null || noticeUpdateReqDto.getNoticeCareer().isEmpty()) {
            throw new CustomApiException("????????? ??????????????????");
        }
        if (noticeUpdateReqDto.getNoticePay() == null || noticeUpdateReqDto.getNoticePay().isEmpty()) {
            throw new CustomApiException("????????? ??????????????????");
        }
        if (noticeUpdateReqDto.getNoticeEmploytype() == null || noticeUpdateReqDto.getNoticeEmploytype().isEmpty()) {
            throw new CustomApiException("??????????????? ??????????????????");
        }
        if (noticeUpdateReqDto.getNoticeGrade() == null || noticeUpdateReqDto.getNoticeGrade().isEmpty()) {
            throw new CustomApiException("????????? ??????????????????");
        }
        if (noticeUpdateReqDto.getNoticeLocation() == null || noticeUpdateReqDto.getNoticeLocation().isEmpty()) {
            throw new CustomApiException("??????????????? ??????????????????");
        }
        if (noticeUpdateReqDto.getNoticeContent() == null || noticeUpdateReqDto.getNoticeContent().isEmpty()) {
            throw new CustomApiException("????????? ??????????????????");
        }

        noticeService.????????????(id, noticeUpdateReqDto, comPrincipal.getId(), comSkill);

        return new ResponseEntity<>(new ResponseDto<>(1, "?????? ?????? ??????", null), HttpStatus.CREATED);
    }

    @DeleteMapping("/notice/{id}")
    public @ResponseBody ResponseEntity<?> deleteNotice(@PathVariable int id) {

        Company comPrincipal = (Company) session.getAttribute("comPrincipal");
        if (comPrincipal == null) {
            throw new CustomApiException("????????? ?????? ???????????????", HttpStatus.UNAUTHORIZED);
        }
        noticeService.????????????(id, comPrincipal.getId());
        return new ResponseEntity<>(new ResponseDto<>(1, "?????? ?????? ??????", null), HttpStatus.OK);

    }

    @GetMapping("/notice/saveNoticeForm")
    public String saveNoticeForm() {
        Company comPrincipal = (Company) session.getAttribute("comPrincipal");
        if (comPrincipal == null) {
            throw new CustomException("????????? ?????? ???????????????", HttpStatus.UNAUTHORIZED);
        }
        return "notice/saveNoticeForm";
    }

    @GetMapping("/notice/{id}")
    public String noticeDetailForm(@PathVariable int id, Model model) {

        NoticeSaveReqDto noticeDto = noticeRepository.findByCompanyIdWithNotice(id);

        model.addAttribute("noticeDto", noticeDto);

        List<Companyskill> comskill = companyskillRepository.findByNoticeId(id);

        model.addAttribute("comskillDto", comskill);

        List<ResumeSelectRespDto> resumeSelectList = noticeRepository.findAllWithResume();
        model.addAttribute("resumeSelectList", resumeSelectList);
        return "notice/noticeDetailForm";
    }

    @GetMapping("/notice/{id}/updateNoticeForm")
    public String noticeUpdateForm(@PathVariable int id, Model model) {
        Company comPrincipal = (Company) session.getAttribute("comPrincipal");
        if (comPrincipal == null) {
            throw new CustomException("????????? ?????? ???????????????", HttpStatus.UNAUTHORIZED);
        }
        Notice NoticePS = noticeRepository.findById(id);

        model.addAttribute("notice", NoticePS);

        return "notice/updateNoticeForm";
    }

}
