package com.mvc.cb;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.mvc.cb.biz.AnswerBiz;
import com.mvc.cb.biz.CertificationService;
import com.mvc.cb.biz.MentorBiz;
import com.mvc.cb.biz.MentorReviewBiz;
import com.mvc.cb.biz.NoticeBiz;
import com.mvc.cb.biz.QuestionBiz;
import com.mvc.cb.biz.QuizBiz;
import com.mvc.cb.biz.UserBiz;
import com.mvc.cb.model.dto.UserDto;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserBiz u_biz;

	@Autowired
	private MentorBiz m_biz;

	@Autowired
	private QuestionBiz q_biz;

	@Autowired
	private QuizBiz qu_biz;

	@Autowired
	private AnswerBiz an_biz;

	@Autowired
	private NoticeBiz no_biz;

	@Autowired
	private CertificationService certificationService;

	// 메인으로 이동시 해당 정보
	@RequestMapping(value = "/main.do")
	public String main(Model model) {
		model.addAttribute("mentor", m_biz.selectList());
		logger.info("멘토 정보 가져오기");
		model.addAttribute("question", q_biz.count());
		model.addAttribute("quiz", qu_biz.count());
		model.addAttribute("answer", an_biz.count());
		logger.info("카운팅 정보 가져오기");
		model.addAttribute("questionlist", q_biz.questionList());
		model.addAttribute("answerlist", an_biz.answerList());
		model.addAttribute("quizlist", qu_biz.quizList());
		model.addAttribute("noticelist", no_biz.noticeList());
		logger.info("새글 정보 가져오기");
		return "main";
	}

	// 회원가입 폼 이동
	@RequestMapping(value = "/sign.do")
	public String signup() {
		return "signup";
	}

	// 회원가입 (파일 업로드)
	@RequestMapping("/signup.do")
	public String insertRes(UserDto dto, MultipartFile pic, HttpServletRequest request, HttpServletResponse response) {
		logger.info("signup");
		String originalFile = pic.getOriginalFilename();
		// uuid 생성(Universal Unique IDentifier, 범용 고유 식별자)
		UUID uuid = UUID.randomUUID();
		// 랜덤생성+파일이름 저장
		String savedName = uuid.toString() + "_" + originalFile;
//		String uploadPath = request.getSession().getServletContext().getRealPath("./upload"); // 업로드 경로

		InputStream inputStream = null;
		OutputStream outputStream = null;

		try {
			inputStream = pic.getInputStream();
			String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/upload");
			System.out.println("업로드 실제 경로 : " + path);

			File storage = new File(path);
			if (!storage.exists()) { // 경로 존재 여부
				storage.mkdirs(); // 디렉토리 생성
			}
			File newfile = new File(path + "/" + savedName);
			if (!newfile.exists()) {
				newfile.createNewFile();
			}

			outputStream = new FileOutputStream(newfile);

			int read = 0;
			byte[] b = new byte[(int) pic.getSize()];

			//
			while ((read = inputStream.read(b)) != -1) {
				outputStream.write(b, 0, read);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				inputStream.close();
				outputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		String user_Pic = "/" + savedName;
		dto.setUser_Pic(user_Pic);
		int res = u_biz.signup(dto);

		if (res > 0) {
			return "redirect:login.do";
		} else {
			return "redirect:signup.do";
		}
	}

	// 로그인 폼 이동
	@RequestMapping(value = "login.do")
	public String login() {
		logger.info("login form");
		return "login";
	}

	// 로그인 확인
	@RequestMapping("loginchk.do")
	public String loginchk(HttpSession session, UserDto dto) {
		logger.info("LOGIN chk");
		UserDto res = u_biz.login(dto);
		if (res != null) {
			if (res.getUser_Grade().equals("관리자")) {
				session.setAttribute("admin", res);
			}
			session.setAttribute("User", res);
		} else {
			return "redirect:login.do";
		}
		return "redirect:main.do";

	}

	// 로그아웃
	@RequestMapping("logout.do")
	public String loginOut(HttpSession session) {
		logger.info("LOGOUT");
		session.removeAttribute("admin");
		session.removeAttribute("User");
		return "redirect:main.do";
	}

	// 아이디 중복 체크 ajax
	@RequestMapping(value = "idcheck.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> idchk(@RequestBody UserDto dto) {

		logger.info("ID CHECK ajax 넘어옴");
		String user_Id = dto.getUser_Id();
		System.out.println(user_Id);
		UserDto res = null;
		res = u_biz.idcheck(user_Id);
		System.out.println(res);
		Boolean check = true;
		if (res == null) {
			check = false;
		}
		System.out.println("ajax 결과값은 : " + res);
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("check", check);
		return map;
	}

	// 문자 본인 인증
	@RequestMapping(value = "/sendSms.do")
	@ResponseBody
	public String sendSMS(String phoneNumber) {

		logger.info("sendSMS");

		Random rand = new Random();
		String numStr = "";
		for (int i = 0; i < 4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}

		System.out.println("수신자 번호 : " + phoneNumber);
		System.out.println("인증번호 : " + numStr);

		// 아래의 서비스단 주석여부에 따라 문자로 본인인증 메세지가 날라옴 (자기 번호 입력해야 확인 가능)
		// 주석처리를 할 경우 콘솔창에 출력된 인증번호로 인증 가능
		certificationService.certifiedPhoneNumber(phoneNumber, numStr);

		return numStr;
	}

	// 아이디 찾기 폼으로 이동
	@RequestMapping(value = "/findId.do")
	public String findId() {
		logger.info("아이디 찾기 폼 이동");
		return "find_Id";
	}

	// 비밀번호 찾기 폼으로 이동
	@RequestMapping("/findPw.do")
	public String findidpw() {
		logger.info("비밀번호 찾기 폼 이동");
		return "find_Pw";
	}

	// 아이디 찾기
	@RequestMapping(value = "/searchId.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, UserDto> searchId(@RequestBody UserDto dto) {
		logger.info("아이디 찾기 AJAX");
		UserDto res = u_biz.findId(dto);
		Map<String, UserDto> search = new HashMap<String, UserDto>();
		search.put("search", res);
		return search;
	}

	// 비밀번호 찾기
	@RequestMapping("/searchPw.do")
	@ResponseBody
	public Map<String, UserDto> search(@RequestBody UserDto dto) {
		logger.info("비밀번호 찾기 AJAX");
		UserDto res = u_biz.selectOne(dto);
		Map<String, UserDto> searchres = new HashMap<String, UserDto>();
		searchres.put("search", res);
		return searchres;
	}

	// 구글 로그인 처리
	@ResponseBody
	@RequestMapping(value = "googleLogin.do", method = RequestMethod.POST)
	public void memberRegi(String userName, UserDto dto, HttpServletRequest request, HttpSession session) {

		logger.info("구글 로그인 처리");
		String user_Id = (request.getParameter("user_Id"));
		String user_Name = (request.getParameter("user_Name"));
		String user_Pic = (request.getParameter("user_Pic"));
		dto.setUser_Name(user_Name);
		dto.setUser_Pic(user_Pic);
		dto.setUser_Id(user_Id);
		dto.setUser_Grade("일반회원");
		session.setAttribute("User", dto);
	}

	// 아이디, 비밀번호 존재여부 (회원인지 아닌지 확인)
	@RequestMapping(value = "/chkIdPw.do")
	@ResponseBody
	public UserDto chkIdPw(UserDto dto) {
		logger.info("회원 비회원 확인");
		UserDto res = u_biz.chkIdPw(dto);
		return res;
	}

}
