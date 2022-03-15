package kr.co.marking.board.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.marking.board.domain.BoardDTO;
import kr.co.marking.board.mapper.BoardFileMapper;
import kr.co.marking.board.mapper.BoardMapper;
import kr.co.marking.board.service.IBoardService;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BoardServiceImpl implements IBoardService {
	
	@Autowired
	BoardMapper boardMapper;
	
	@Autowired
	BoardFileMapper boardFileMapper;
	
	
	
	// 게시글 모두 뽑아오기
	@Override
	public List<BoardDTO> selectBoardList(Map<String, Object> map) {
		
		log.info("==================== service selectBoardList ====================");
		
		return boardMapper.selectBoardList(map);
	}
	
	// 해당 게시판 총 갯수 출력
	@Override
	public int selectBordTotalCount(Map<String, Object> map) {
		
		log.info("==================== service selectBordTotalCount ====================");
		
		return boardMapper.selectBordTotalCount(map);
	}
	

	// 게시글 추가
	@Transactional
	@Override
	public boolean insertBoard(BoardDTO bDto) {

		log.info("==================== service insertBoard ====================");
		
		int result = boardMapper.insertBoard(bDto);
		System.out.println(bDto);
		if (bDto.getBoardFileList() == null || bDto.getBoardFileList().size() <= 0) {
			return false;
		}
		
		bDto.getBoardFileList().forEach(attach -> {
			attach.setBoard_no(boardMapper.selectBoardMaxNo());
			System.out.println(attach);
			boardFileMapper.insertBoardFile(attach);
		});
		
		
		
		return result == 1 ? true : false;  // 성공하면 true
	}
	
	// 게시글 최신 bno 출력
	@Override
	public String selectBoardMaxNo() {
		
		log.info("==================== service selectBoardMaxBno ====================");
		
		return boardMapper.selectBoardMaxNo();
	}
	
	

	// 해당 게시글 불러오기  
	@Override
	public BoardDTO selectBoardOne(String board_no) {
		
		log.info("==================== service selectBoardOne ====================");
		return boardMapper.selectBoardOne(board_no);  // 성공하면 true
	}

	// 해당 게시글 클릭시 조회수 +1 
	@Override
	public void updateBoardViewCount(String board_no) {

		log.info("==================== service updateBoardViewCount ====================");
		
		boardMapper.updateBoardViewCount(board_no);
		
	}

	// 해당 게시글 수정
	@Override
	public boolean updateBoard(BoardDTO bDto) {
		
		log.info("==================== service updateBoardViewCount ====================");
		System.out.println(bDto);
		int result = boardMapper.updateBoard(bDto);
		
		if (bDto.getBoardFileList() == null || bDto.getBoardFileList().size() <= 0) {
			boardFileMapper.deleteBoardFile(bDto.getBoard_no());
			return false;
		}
		
		boardFileMapper.deleteBoardFile(bDto.getBoard_no());
		
		bDto.getBoardFileList().forEach(boardFileDTO -> {
			boardFileDTO.setBoard_no(bDto.getBoard_no());

			boardFileMapper.insertBoardFile(boardFileDTO);
		});
		
		
		return result == 1 ? true : false;  // 성공하면 true
	}

	// 해당 게시글 삭제
	@Override
	public boolean deleteBoard(String board_no) {

		log.info("==================== service updateBoardViewCount ====================");
		
		return boardMapper.deleteBoard(board_no) == 1 ? true : false;  // 성공하면 true
	}

	

	

}
