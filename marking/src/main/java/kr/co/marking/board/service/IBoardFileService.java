package kr.co.marking.board.service;

import java.util.List;

import kr.co.marking.board.domain.BoardFileDTO;

public interface IBoardFileService {
		
	public boolean insertBoardFile(BoardFileDTO bFDto);  				 // 파일 업로드
	
	public List<BoardFileDTO> selectBoardFileList(String board_no);      // 해당 게시물의 첨부파일 출력
	
	public boolean deleteBoardFile(String board_no);                     // 해당 게시물의 첨부파일 모두 삭제
	
}
