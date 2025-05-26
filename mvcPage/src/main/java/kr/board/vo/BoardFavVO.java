package kr.board.vo;

public class BoardFavVO {
	private Long board_num;
	private Long mem_num;
	
	public BoardFavVO() {}
	
	// 데이터가 많지 않으면 생성자를 이용해서 추가할 수 있음
	public BoardFavVO(Long board_num, Long mem_num) {
		this.board_num = board_num;
		this.mem_num = mem_num;
	}
	
	public Long getBoard_num() {
		return board_num;
	}
	public void setBoard_num(Long board_num) {
		this.board_num = board_num;
	}
	public Long getMem_num() {
		return mem_num;
	}
	public void setMem_num(Long mem_num) {
		this.mem_num = mem_num;
	}
}
