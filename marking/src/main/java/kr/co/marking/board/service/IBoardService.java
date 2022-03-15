package kr.co.marking.board.service;

import java.util.List;
import java.util.Map;

import kr.co.marking.board.domain.BoardDTO;

public interface IBoardService {
		
	public List<BoardDTO> selectBoardList(Map<String, Object> map);  	 	 // 게시글 모두 뽑아오기
	
	public int selectBordTotalCount(Map<String, Object> map);                  	 // 해당 게시판의 총 갯수 출력
	
	public boolean insertBoard(BoardDTO bDto);             	 	 	 		 // 게시글 추가
	
	public String selectBoardMaxNo();                                      // 게시글 최신 bno 출력
	 
	public BoardDTO selectBoardOne(String board_no);		   			 	 // 해당 게시글 불러오기  

	public void updateBoardViewCount(String board_no);		    		 	 // 해당 게시글 불러오기  
		
	public boolean updateBoard(BoardDTO bDto);             		 			 // 해당 게시글 수정
	
	public boolean deleteBoard(String board_no);             	 			 // 해당 게시글 삭제
	
}
