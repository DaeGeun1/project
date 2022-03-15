package kr.co.marking.board.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;



@NoArgsConstructor
@AllArgsConstructor
@Data
public class BoardDTO {

	private String board_no;                //게시글 번호  pk
	private String board_title;				//게시글 제목
	private String board_contents;			//게시글 내용
	private Timestamp board_registdate;		//게시글 등록일
	private Timestamp board_updatedate;		//게시글 수정일
	private Timestamp board_deletedate;		//게시글 삭제일
	private String board_viewcount;			//게시글 조회수
	private String board_kind;				//게시글 종류  1: 공지사항 2: fnq 3: 이벤트게시판
	private String board_delete;			//게시글 삭제여부
	private String member_id;				//회원 아이디 fk
	
	private List<BoardFileDTO> boardFileList;
	
	private String member_name;              //회원 테이블의 이름값
	private String board_rownum;                       // 그 정렬하고 그값
}
