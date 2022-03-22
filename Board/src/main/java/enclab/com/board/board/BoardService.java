package enclab.com.board.board;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {

	public BoardService() {
		System.out.println("BoardService 인스턴스 생성");
	}

	@Autowired
	private BoardDAO dao;

	private int recordCntPerPage = 10;
	private int naviCntPerPage = 10;

	// 전체 게시판 조회
	public List<BoardDTO> selectAll(int currentPage) throws Exception {
		int startRange = currentPage * recordCntPerPage - (recordCntPerPage - 1);
		int endRange = currentPage * recordCntPerPage;

		// 전체 게시판 조회
		List<BoardDTO> list = dao.selectAll(startRange, endRange);

		return list;
	}

	// 전체 게시판 게시글 갯수
	public int selectAllBoardCount() throws Exception {
		return dao.selectAllBoardCount();
	}

	// 게시판 페이징
	public HashMap<String, Object> getPageNavi(int recordTotalCnt, int currentPage) throws Exception {

		int pageTotalCnt = 0;
		if (recordTotalCnt % recordCntPerPage > 0) {
			pageTotalCnt = (recordTotalCnt / recordCntPerPage) + 1;
		} else {
			pageTotalCnt = recordTotalCnt / recordCntPerPage;
		}

		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCnt) {
			currentPage = pageTotalCnt;
		}

		int startNavi = ((currentPage - 1) / naviCntPerPage) * naviCntPerPage + 1;
		int endNavi = startNavi + naviCntPerPage - 1;
		if (endNavi > pageTotalCnt) {
			endNavi = pageTotalCnt;
		}

		boolean needPrev = true;
		boolean needNext = true;
		if (startNavi == 1)
			needPrev = false;
		if (endNavi == pageTotalCnt)
			needNext = false;

		HashMap<String, Object> map = new HashMap<>();
		map.put("startNavi", startNavi);
		map.put("endNavi", endNavi);
		map.put("needPrev", needPrev);
		map.put("needNext", needNext);
		map.put("currentPage", currentPage);

		return map;
	}

	// 게시글 조회수+1
	public int updateView_count(int board_seq) throws Exception {
		return dao.updateView_count(board_seq);
	}
	
	// 게시글 등록
	public int insertBoard(BoardDTO dto) throws Exception {
		return dao.insertBoard(dto);
	}
	
	// 게시글 상세조회 이동
	public BoardDTO selectByBoardSeq(int board_seq) throws Exception {
		return dao.selectByBoardSeq(board_seq);
	}
}
