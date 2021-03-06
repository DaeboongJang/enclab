package enclab.com.board.board;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import enclab.com.board.member.MemberDTO;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService service;

	@Autowired
	private HttpSession session;


	public BoardController() {
		System.out.println("BoardController 인스턴스 생성");
	}
	
	// 게시판 전체 조회
	@RequestMapping("/toBoard")
	public String toBoard(int currentPage, Model model) throws Exception {
		//String id = ((MemberDTO) session.getAttribute("loginSesseion")).getId();
		//System.out.println("로그인한 ID " + id);

		// 자유게시판 게시글 총 갯수
		int recordTotalCnt = service.selectAllBoardCount();

		// 자유게시판 페이지네이션
		HashMap<String, Object> naviMap = service.getPageNavi(recordTotalCnt, currentPage);
		List<BoardDTO> list = service.selectAll(currentPage);

		model.addAttribute("naviMap", naviMap);
		model.addAttribute("list", list);
		model.addAttribute("recordTotalCnt", recordTotalCnt);
		return "board/boardList";
	}
	
	// 게시글 등록 페이지 이동
	@RequestMapping("/toInsertBoard")
	public String toInsertBoard() throws Exception {
		return "board/insertBoard";
	}
	
	// 게시글 등록
	@RequestMapping("/insertBoard")
	public String insertBoard(BoardDTO dto) throws Exception {
		service.insertBoard(dto);
		return "member/mainPage";
	}
	
	// 게시글 상세조회 이동
	@RequestMapping("/toBoardDetail")
	public String toBoardDetail(int board_seq, Model model) throws Exception {
		BoardDTO dto = service.selectByBoardSeq(board_seq);
		model.addAttribute("dto", dto);
		return "board/boardDetail";
	}
	
	// 게시글 수정
	@RequestMapping("/modify")
	public String modify(BoardDTO dto) throws Exception {
		
		return "redirect:modify";
	}
}
