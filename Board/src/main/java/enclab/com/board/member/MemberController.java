package enclab.com.board.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private HttpSession session;
	
	public MemberController() {
		System.out.println("MemberController 도착");
	}
	
	// 회원 가입 페이지로 이동
	@RequestMapping("toSignup")
	public String toSignup() {
		return "member/signup";
	}
	
	@RequestMapping("idCheckPopup")
	public String idCheckPopup() {
		return "member/checkPopup";
	}
	
	// 아이디 중복 검사
	// 회원가입 : ajax로 처리된 매핑값을 받아 ID 중복검사
	@RequestMapping("/checkId")
	@ResponseBody()
	public String checkId(String id) throws Exception {
		System.out.println("ID : " + id); // 값이 잘 넘어왔는지 확인

		if (service.checkId(id)) { // service의 메서드를 사용
			// 결과값으로 "Available" return
			return "unavailable";
		} else {
			return "available";
		}
	}
	
	// 로그인
	@RequestMapping(value = "/login", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String login(MemberDTO dto) throws Exception{
		
		if(service.login(dto)) {
			session.setAttribute("loginSession", dto);
			
			System.out.println("Session : " + dto);
			return "성공";
		} else {
			return "실패";
		}
	}
	
	// 로그인 성공
	@RequestMapping("toMainPage")
	public String toMainPage() throws Exception {
		return "member/mainPage";
	}
	
	// 로그아윳
	@RequestMapping("/logout")
	public String logout() throws Exception {
		session.invalidate();
		return "home";
	}
	
	// 회원 가입
	@RequestMapping("/signup")
	public int signup(MemberDTO dto) throws Exception {
		return service.insertMember(dto);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
