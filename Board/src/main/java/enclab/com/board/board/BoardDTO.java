package enclab.com.board.board;

import java.sql.Date;

public class BoardDTO {

	private int board_seq;
	private String board_title;
	private String board_content;
	private String board_writer;
	private int board_view_count;
	private Date board_written_date;

	public BoardDTO() {
		System.out.println("BoardDTO 인스턴스 생성");
	}

	public int getBoard_seq() {
		return board_seq;
	}

	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public String getBoard_writer() {
		return board_writer;
	}

	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}

	public int getBoard_view_count() {
		return board_view_count;
	}

	public void setBoard_view_count(int board_view_count) {
		this.board_view_count = board_view_count;
	}

	public Date getBoard_written_date() {
		return board_written_date;
	}

	public void setBoard_written_date(Date board_written_date) {
		this.board_written_date = board_written_date;
	}

	@Override
	public String toString() {
		return "BoardDTO [board_seq=" + board_seq + ", board_title=" + board_title + ", board_content=" + board_content
				+ ", board_writer=" + board_writer + ", board_view_count=" + board_view_count + ", board_written_date="
				+ board_written_date + "]";
	}

	
}
