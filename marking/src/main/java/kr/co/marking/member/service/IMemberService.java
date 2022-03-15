package kr.co.marking.member.service;

import java.util.List;

import kr.co.marking.member.domain.MemberDTO;

public interface IMemberService {
	
	public MemberDTO selectMemberInfo(String member_id);      //회원정보 출력
	
	public List<String> selectMemberAuthorities(String member_id); // 해당회원의 권한 출력
	
	public boolean insertMember(MemberDTO mDto); 			  //회원등록
	
	public boolean memberCheck(MemberDTO mDto);      		  // 회원 정보 체크 회원정보수정창 가기전에 , 비동기 아이디 중복  이메일 중복
	
	public boolean updateMemberInfo(MemberDTO mDto);          // 회원 정보 수정
	
	public boolean updateMemberPassword(MemberDTO mDto);      // 회원 비밀번호 수정
	
	public boolean deleteMember(String member_id);              // 회원 탈퇴  
	
	public boolean accessMember(String member_id);              //회원 로그인시 접속날짜 갱신
	
	public MemberDTO findMember(MemberDTO mDto);         // 회원 정보 체크 아이디찾기 , 비번찾기 회원정보수정창 가기전에
}
