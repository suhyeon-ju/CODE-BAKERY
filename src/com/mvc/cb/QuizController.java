package com.mvc.cb;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.WebUtils;

import com.mvc.cb.biz.QuizBiz;
import com.mvc.cb.biz.QuizResultBiz;
import com.mvc.cb.model.dto.QuizDto;
import com.mvc.cb.model.dto.QuizResultDto;
import com.mvc.cb.model.dto.UserDto;

@Controller
public class QuizController {

	@Autowired
	private QuizBiz quizBiz;

	@Autowired
	private QuizResultBiz quizResultBiz;

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@RequestMapping(value = "/quiz.do")
	public String quizList(Model model, HttpSession session) {
		logger.info("QUIZ SELECT LIST");
		UserDto userDto = (UserDto) session.getAttribute("User");
		String user_Id = userDto.getUser_Id();
		System.out.println("user_Id : "+user_Id);
		model.addAttribute("list", quizBiz.selectList());
		model.addAttribute("resultList", quizResultBiz.selectList(user_Id));
		return "quiz";
	}

	@RequestMapping(value = "/quiz_detail.do")
	public String quizDetail(Model model, int quiz_No) {
		logger.info("quizDetail");

		model.addAttribute("list", quizBiz.selectOne(quiz_No));
		return "quiz_detail";
	}

	@RequestMapping(value = "/quiz_write.do")
	public String QuizWrite() {
		return "quiz_write";
	}

	@RequestMapping(value = "/insertQuiz.do")
	public String insertQuiz(QuizDto dto) {
		logger.info("INSERT QUIZ");
		int res = quizBiz.insert(dto);

		if (res > 0) {
			return "redirect:quiz.do";
		} else {
			return "redirect:quiz_write.do";
		}
	}

	@RequestMapping(value = "/quiz_submit.do")
	public String quiz_submit(Model model, int quiz_No) {
		logger.info("quiz_submit");
		
		model.addAttribute("list", quizBiz.selectOne(quiz_No));
		return "quiz_submit";
	}

	@RequestMapping(value = "/quiz_Answer.do")
	public String quizAnswer(String quiz_answer, String quiz_type, int quiz_No, String user_Id, HttpServletRequest request, HttpServletResponse response) {
		//quiz_No로 해당 문제 정보가져오기
		QuizDto quizDto = quizBiz.selectOne(quiz_No);
		//문제의 정답
		String answer = quizDto.getOutput_Sample();
		
		int correctUser = 0;
		int tryUser = 0;
		double correctRate = 0;
		
		if (quiz_type.equals("java")) {
			try {
				String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/Main");
				System.out.println("디렉토리 경로 : " +path);
				File storage = new File(path);
				if (!storage.exists()) { // 경로 존재 여부
					storage.mkdirs(); // 디렉토리 생성
				}
				
				File newfile = new File(path + "/Main.java");
				if (!newfile.exists()) {
					newfile.createNewFile();
				}

				OutputStream output = new FileOutputStream(newfile);

				String str = quiz_answer;
				byte[] by = str.getBytes();
				output.write(by);
				output.close();

				File dir = new File(path);
				System.out.println("dir : " + dir);
				
				Runtime runtime = Runtime.getRuntime();
				
				Process process = runtime.exec("javac Main.java", null, dir);
				process.waitFor();
				//성공
				process = runtime.exec("java Main", null, dir);
				
				//컴파일 출력값을 toString으로 변환하여 answer와 비교한다.
				String answerResult = IOUtils.toString(process.getInputStream(), "UTF-8");
				answerResult = answerResult.trim(); //앞뒤 공백제거
				String errorOutput = IOUtils.toString(process.getErrorStream());
				errorOutput = errorOutput.trim();
				
				process.getInputStream().close();
				process.getOutputStream().close();
				process.getErrorStream().close();
				process.destroy();
				
				System.out.println("문제 답 : " + answer);
				System.out.println("리턴 값 : " + answerResult);
				System.out.println("컴파일 에러 로그 : " + errorOutput);
				
				if(!(answerResult.equals("")) && answerResult != null) {
					if(answer.equals(answerResult)) { //컴파일 성공시
						System.out.println("컴파일 성공 : " + answerResult);
						
						//quizResultDto에 값을 넣은 후 insert하여 테이블에 추가하기(성공일 때)
						QuizResultDto quizResultDto = new QuizResultDto(quiz_No, quiz_answer, answer, answerResult, "성공", user_Id);
						
						QuizResultDto quizResultDto2 = quizResultBiz.selectOne(quizResultDto); 
						
						int res = 0; 
						
						if(quizResultDto2 != null) {
							res = quizResultBiz.update(quizResultDto);
						}else {
							res = quizResultBiz.insert(quizResultDto);
						}
						
						if(res>0) {
							System.out.println("성공입니다.");
							System.out.println("");
							//제출, 정답자, 정답률 업데이트
							tryUser = quizDto.getTry_User()+1;
							System.out.println("제출 : " + tryUser);
							correctUser = quizDto.getCorrect_User()+1;
							System.out.println("정답자 : " + correctUser);
							//소수 3자리까지 보여줌
							correctRate = (double)correctUser/(double)tryUser;
							correctRate = Math.round(correctRate*1000)/10.0;
							System.out.println("정답률 : " + correctRate);
							//QuizDto에 넣어주고 DB에 업데이트
							quizDto.setTry_User(tryUser);
							quizDto.setCorrect_User(correctUser);
							quizDto.setCorrect_Rate(correctRate);
							
							res = quizBiz.update(quizDto);
							
							if(res >0) {
								System.out.println("Quiz correct_User, try_User, correct_Rate 수정 완료");
							}else {
								System.out.println("Quiz correct_User, try_User, correct_Rate 수정 실패");
							}
						}else {
							System.out.println("성공.quizResultInsert 에러");
						}
					}else {	//컴파일 실패시(리턴값이 다를때)
						System.out.println("컴파일 실패(리턴값이 다름) : " + answerResult);
						
						//quizResultDto에 값을 넣은 후 insert하여 테이블에 추가하기(실패일 때)
						QuizResultDto quizResultDto = new QuizResultDto(quiz_No, quiz_answer, answer, answerResult, "실패", user_Id);
						
						QuizResultDto quizResultDto2 = quizResultBiz.selectOne(quizResultDto); 
						
						int res = 0; 
						
						if(quizResultDto2 != null) {
							res = quizResultBiz.update(quizResultDto);
						}else {
							res = quizResultBiz.insert(quizResultDto);
						}
						
						if(res>0) {
							System.out.println("실패입니다.");
							
							//제출, 정답률 업데이트
							//제출, 정답자, 정답률 업데이트
							tryUser = quizDto.getTry_User()+1;
							System.out.println("제출 : " + tryUser);
							correctUser = quizDto.getCorrect_User();
							System.out.println("정답자 : " + correctUser);
							//소수 3자리까지 보여줌
							correctRate = (double)correctUser/(double)tryUser;
							correctRate = Math.round(correctRate*1000)/10.0;
							System.out.println("정답률 : " + correctRate);
							//QuizDto에 넣어주고 DB에 업데이트
							quizDto.setTry_User(tryUser);
							quizDto.setCorrect_User(correctUser);
							quizDto.setCorrect_Rate(correctRate);
							
							
							res = quizBiz.update(quizDto);
							
							if(res >0) {
								System.out.println("Quiz try_User, correct_Rate 수정 완료");
							}else {
								System.out.println("Quiz try_User, correct_Rate 수정 실패");
							}
						}else {
							System.out.println("실패.quizResultInsert 에러");
						}
					}
				}else {	//컴파일 실패(컴파일 에러)
					System.out.println("컴파일 실패(컴파일 에러) : " + errorOutput);
					
					//quizResultDto에 값을 넣은 후 insert하여 테이블에 추가하기(실패일 때)
					QuizResultDto quizResultDto = new QuizResultDto(quiz_No, quiz_answer, answer, errorOutput, "실패", user_Id);
					
					QuizResultDto quizResultDto2 = quizResultBiz.selectOne(quizResultDto); 
					
					int res = 0; 
					
					if(quizResultDto2 != null) {
						res = quizResultBiz.update(quizResultDto);
					}else {
						res = quizResultBiz.insert(quizResultDto);
					}
					
					if(res>0) {
						System.out.println("실패입니다.");
						
						//제출, 정답자, 정답률 업데이트
						tryUser = quizDto.getTry_User()+1;
						System.out.println("제출 : " + tryUser);
						correctUser = quizDto.getCorrect_User();
						System.out.println("정답자 : " + correctUser);
						//소수 3자리까지 보여줌
						correctRate = (double)correctUser/(double)tryUser;
						correctRate = Math.round(correctRate*1000)/10.0;
						System.out.println("정답률 : " + correctRate);
						//QuizDto에 넣어주고 DB에 업데이트
						quizDto.setTry_User(tryUser);
						quizDto.setCorrect_User(correctUser);
						quizDto.setCorrect_Rate(correctRate);
						
						res = quizBiz.update(quizDto);
						
						if(res >0) {
							System.out.println("Quiz try_User, correct_Rate 수정 완료");
						}else {
							System.out.println("Quiz try_User, correct_Rate 수정 실패");
						}
					}else {
						System.out.println("실패.quizResultInsert 에러");
					}
					process.destroy();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			System.out.println("실패");
			System.out.println("자바가 아님");
		}
		return "redirect:quiz.do";
	}
}