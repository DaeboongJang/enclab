package enclab.com.board.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO dao;
	
	public MemberService() {
		System.out.println("MemberService 도착");
	}
	
	// 아이디 중복 확인
	public boolean checkId(String id) throws Exception { 
		if (dao.checkId(id) == 1) { // 중복 아이디면
			return false; // false
		} else { // 중복 아이디가 아니라면
			return true; // true
		}
	}
	
	// 로그인
	public boolean login(MemberDTO dto) throws Exception {
		if (dao.login(dto) == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	// 회원 가입
	public int insertMember(MemberDTO dto) throws Exception {
		return dao.insertMember(dto);
	}
	
}
