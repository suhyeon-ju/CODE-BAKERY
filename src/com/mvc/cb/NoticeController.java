package com.mvc.cb;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mvc.cb.biz.NoticeBiz;
import com.mvc.cb.biz.NoticeCommentBiz;
import com.mvc.cb.model.dto.NoticeCommentDto;
import com.mvc.cb.model.dto.NoticeDto;
import com.mvc.cb.model.dto.Paging;
import com.mvc.cb.model.dto.PageNavigator;

@Controller
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private NoticeBiz biz;

	@Autowired
	private NoticeCommentBiz c_biz;

	@RequestMapping(value = "/notice.do", method = RequestMethod.GET) // page = currentPage
	public String noticeList(Model model, @RequestParam(value = "page", required = false) Integer page) {
		logger.info("공지사항 리스트 출력");
		// 페이지가 넘어오지 않았을 경우 1페이지로 설정
		if (page == null) {
			page = 1;
		}
		int total = biz.pageCnt();
		PageNavigator paging = new PageNavigator();
		paging.setPage(page);
		paging.setTotalArticle(total);
		paging.setTotalPage(total);
		paging.setStartRow();
		paging.setEndRow();
		List<NoticeDto> list = biz.selectAll(paging);
		Paging maker = new Paging();
		maker.setPaging(paging);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", maker);
		return "notice";
	}

	// 공지사항 디테일
	@RequestMapping(value = "/notice_view.do")
	public String noticeOne(Model model, int notice_No) {
		logger.info("공지사항 SELECTONE");
		model.addAttribute("detail", biz.selectOne(notice_No));
		model.addAttribute("c_list", c_biz.selectAll(notice_No));
		int res = biz.viewUpdate(notice_No);
		if (res > 0) {
			logger.info(notice_No + "번 게시글 조회수 업데이트 성공");
		} else {
			logger.info(notice_No + "번 게시글 조회수 업데이트 실패");
		}
		return "notice_view";
	}

	// 공지사항 쓰기 페이지이동
	@RequestMapping(value = "/notice_write.do")
	public String noticeWrite() {
		logger.info("공지사항 글 작성 페이지 이동");
		return "notice_write";
	}

	// 공지사항 쓰기
	@RequestMapping(value = "/write_res.do")
	public String writeRes(NoticeDto dto) {
		logger.info("공지사항 글 작성 완료");
		int res = biz.insert(dto);
		if (res > 0) {
			return "redirect:notice.do";
		} else {
			return "redirect:notice_write.do";
		}
	}

	// 공지사항 삭제
	@RequestMapping(value = "/notice_delete.do")
	public String noticeDelete(int notice_No) {
		logger.info("공지사항 삭제");
		int res = biz.delete(notice_No);

		if (res > 0) {
			return "redirect:notice.do";
		} else {
			return "redirect:notice_view.do";
		}
	}

	// 공지사항 수정페이지 이동
	@RequestMapping(value = "/notice_edit.do")
	public String noticeUpdate(Model model, int notice_No) {
		logger.info("공지사항 수정 페이지 이동");
		model.addAttribute("update", biz.selectOne(notice_No));
		return "notice_edit";

	}

	// 공지사항 수정
	@RequestMapping(value = "/update_res.do")
	public String updateRes(NoticeDto dto) {
		logger.info("공지사항 수정함");
		int res = biz.update(dto);
		if (res > 0) {
			return "redirect:notice_view.do?notice_No=" + dto.getNotice_No();
		} else {
			return "redirect:notice_edit.do?notice_No=" + dto.getNotice_No();
		}
	}

	// 공지사항 댓글작성
	@RequestMapping(value = "/comment_write.do")
	public String commentWrite(NoticeCommentDto dto) {
		logger.info("공지사항 댓글 인서트함");
		int res = c_biz.insert(dto);
		return "redirect:notice_view.do?notice_No=" + dto.getNotice_No();
	}

	// 공지사항 댓글삭제
	@RequestMapping(value = "/comment_delete.do")
	public String commentDelete(int comment_No, int notice_No) {
		logger.info("공지사항 댓글 삭제");
		int res = c_biz.delete(comment_No);
		return "redirect:notice_view.do?notice_No=" + notice_No;
	}

}