package kr.co.marking.board.domain;

import lombok.Data;

@Data
public class BoardFileDTO {
	
	private String board_no;                     // 해당 게시판의 번호
	private String board_file_name;				 // 첨부파일 이름
	private String board_file_uploadpath;        // 첨부파일 경로
	private String board_file_image;             // 첨부파일 이미지유무   이미지 : Y  다른파일 : N
	private String board_file_uuid;              // UUID를 이용한 이름 중복 방지
}
