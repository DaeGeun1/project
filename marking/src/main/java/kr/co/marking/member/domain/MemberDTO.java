package kr.co.marking.member.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import oracle.sql.TIMESTAMP;

@NoArgsConstructor      
@AllArgsConstructor
@Datapublic class MemberDTO {

	private String member_id;               // 유저 아이디
	private String member_password;         // 유저 비밀번호
	private String member_name;             // 유저 이름
	private String member_tel;              // 유저 전화번호
	private String member_email;            // 유저 이메일
	private String member_post;             // 유저 우편번호
	private String member_basicaddress;     // 유저 기본주소
	private String member_detailaddress;    // 유저 상세주소
	private String member_select;           // 유저 선택약관
	private Timestamp member_registdate;    	// 유저 등록일
	private Timestamp member_accessdate;    	// 유저 최근 접속일
	private String member_withdraw;         // 유저 탈퇴여부
	private String member_dormant;          // 유저 휴면계정 여부
	
	List<AuthorityDTO> authList;            // AuthorityDTO 의 권한들을 불러옴
}
