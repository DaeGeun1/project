package kr.co.marking.board.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.marking.board.domain.BoardDTO;
import kr.co.marking.board.domain.BoardFileDTO;
import kr.co.marking.board.mapper.BoardFileMapper;
import kr.co.marking.board.service.IBoardFileService;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BoardFileServiceImpl implements IBoardFileService {
	
	@Autowired
	private BoardFileMapper boardFileMapper;
	
	
	//게시판 파일첨부 
	@Override
	public boolean insertBoardFile(BoardFileDTO bFDto) {
		
		log.info("==================== service insertBoardFile ====================");
		
		
		return boardFileMapper.insertBoardFile(bFDto) == 1 ? true : false;   // true면 값 넣기 성공
	}

	// 해당 게시물의 첨부파일 출력
	@Override
	public List<BoardFileDTO> selectBoardFileList(String board_no) {
		
		log.info("==================== service selectBoardFileList ====================");
		
		return boardFileMapper.selectBoardFileList(board_no);
	}

	@Override
	public boolean deleteBoardFile(String board_no) {

		log.info("==================== service deleteBoardFile ====================");
		
		return boardFileMapper.deleteBoardFile(board_no) == 1 ? true : false;   // true면 값 넣기 성공
	}
	

}
