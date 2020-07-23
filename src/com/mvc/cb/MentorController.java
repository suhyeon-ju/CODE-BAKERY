package com.mvc.cb;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.cb.biz.MentorBiz;
import com.mvc.cb.biz.MentorReviewBiz;
import com.mvc.cb.model.dto.MentorDto;
import com.mvc.cb.model.dto.UserDto;

@Controller
public class MentorController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private MentorBiz m_biz;

	@Autowired
	private MentorReviewBiz mr_biz;

	// SelectAll

	@RequestMapping(value = "/mentor_detailAll.do")

	public String mentorDetailall(Model model) {
		logger.info("멘토소개 페이지 모든 멘토 가져오기");
		model.addAttribute("mentor", m_biz.selectList());
		return "mentor_detail";
	}

	// selectOne
	@RequestMapping(value = "/mentor_detail.do")
	public String mentorDetailOne(Model model, int mentor_No) {

		logger.info("멘토 한명만 가져오기(With 멘토 리뷰)");
		model.addAttribute("mentor", m_biz.selectOne(mentor_No));
		model.addAttribute("review", mr_biz.selectList(mentor_No));
		return "mentor_detailOne";
	}

	@RequestMapping("/mentorapply.do")
	@ResponseBody
	public Map<String, Integer> adjustres(@RequestBody MentorDto dto) {
		logger.info("멘토 인서트 AJAX");
		System.out.println(dto);
		int res = m_biz.insert(dto);
		Map<String, Integer> adjustres = new HashMap<String, Integer>();
		adjustres.put("adjust", res);
		return adjustres;
	}

}
