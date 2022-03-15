package kr.co.marking.board.mapper;

import java.util.List;

import kr.co.marking.board.domain.BoardFileDTO;

public interface BoardFileMapper {
	
	public int insertBoardFile(BoardFileDTO bFDto);   					// 파일 업로드
	
	public List<BoardFileDTO> selectBoardFileList(String board_no);     // 해당 게시물의 첨부파일 출력
	
	public int deleteBoardFile(String board_no);                        // 해당 게시물의 첨부파일 모두 삭제
	
}
