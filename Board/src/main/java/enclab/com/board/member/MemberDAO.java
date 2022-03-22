package enclab.com.board.member;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession session;
	
	public MemberDAO() {
		System.out.println("MemberDAO 도착");
	}
	
	// 아이디 중복 확인
	public int checkId(String id) throws Exception {
		return session.selectOne("memberMapper.checkId", id);
	}
	
	// 로그인
	public int login(MemberDTO dto) throws Exception {
//		HashMap<String, Object> map = new HashMap<>();
//		map.put("id", id);
//		map.put("pw", pw);
		return session.selectOne("memberMapper.login", dto);
	}
	
	// 회원 가입
	public int insertMember(MemberDTO dto) throws Exception {
		return session.insert("boardMapper.insertMember", dto);
	}
	
}
