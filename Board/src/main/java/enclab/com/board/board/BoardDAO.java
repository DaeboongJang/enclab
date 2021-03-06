package enclab.com.board.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSession session;

	public BoardDAO() {
		System.out.println("BoardDAO 인스턴스 생성");
	}

	// 전체 게시판 조회
	public List<BoardDTO> selectAll(int startRange, int endRange) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		map.put("startRange", startRange);
		map.put("endRange", endRange);
		return session.selectList("boardMapper.selectAll", map);
	}

	// 전체 게시판 게시글 갯수
	public int selectAllBoardCount() throws Exception {
		return session.selectOne("boardMapper.selectAllBoardCount");
	}

	// 게시글 조회수 +1
	public int updateView_count(int board_seq) throws Exception {
		return session.update("boardMapper.updateView_count", board_seq);
	}
	
	// 게시글 등록
	public int insertBoard(BoardDTO dto) throws Exception {
		return session.insert("boardMapper.insertBoard", dto);
	}
	
	// 게시글 상세조회 이동
	public BoardDTO selectByBoardSeq(int board_seq) throws Exception {
		return session.selectOne("boardMapper.selectByBoardSeq", board_seq);
	}

}
