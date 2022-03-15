package kr.co.marking.member.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.marking.member.domain.MemberDTO;
import kr.co.marking.member.mapper.MemberMapper;
import kr.co.marking.member.service.IMemberService;

@Service
public class MemberServiceImpl implements IMemberService{
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	//해당회원 정보 출력
	@Override
	public MemberDTO selectMemberInfo(String member_id) {
		
		return memberMapper.selectMemberInfo(member_id);
	}
	
	//해당회원 권한 출력
	@Override
	public List<String> selectMemberAuthorities(String member_id) {

		return memberMapper.selectMemberAuthorities(member_id);
	}
	

	//회원 등록 기능
	@Override
	public boolean insertMember(MemberDTO mDto) {
		
		MemberDTO existUser = memberMapper.selectMemberInfo(mDto.getMember_id());
		
		if(existUser != null) {  //현재 아이디 존재하는경우
			
			return false;
			
		} else {  //아이디가 존재하지 않을경우 회원등록
			
			mDto.setMember_password(passwordEncoder.encode(mDto.getMember_password()));  //패스워드 암호화 시큐리티
			
			if(mDto.getMember_id().startsWith("#")) { //관리자인경우 
				System.out.println("관리자" + mDto);
				memberMapper.insertMemberInfo(mDto);                     //유저 테이블에 회원등록
				memberMapper.insertMemberAuthority(mDto.getMember_id()); //유저 권한테이블에 맴버권한 등록
				memberMapper.insertAdminAuthority(mDto.getMember_id());  //유저 권한테이블에 관리자권한 등록
				
				return true;
				
			} else if(!mDto.getMember_id().startsWith("#")) {
				System.out.println("회원" + mDto);
				memberMapper.insertMemberInfo(mDto);                     //유저 테이블에 회원등록
				memberMapper.insertMemberAuthority(mDto.getMember_id()); //유저 권한테이블에 맴버권한 등록
				
				return true;
				
			}
		}
		
		return false;
	}
	
	//회원 정보 체크 회원정보수정창 가기전에 , 비동기 아이디 중복  이메일 중복
	@Override
	public boolean memberCheck(MemberDTO mDto) {
		
		return memberMapper.memberCheck(mDto) != null ? true : false;  //값이 존재하면 true 반환
	}
	
	// 회원정보 수정 기능
	@Override
	public boolean updateMemberInfo(MemberDTO mDto) {
		
		return memberMapper.updateMemberInfo(mDto) != 0 ? true : false; //update 되면 true 반환
	}
	
	//회원 비밀번호 수정
	@Override
	public boolean updateMemberPassword(MemberDTO mDto) {
		
		mDto.setMember_password(passwordEncoder.encode(mDto.getMember_password())); //받은 비밀번호를 암호화
		
		return memberMapper.updateMemberPassword(mDto) != 0 ? true : false; //update 되면 true 반환
	}
	
	// 회원 탈퇴
	@Override
	public boolean deleteMember(String member_id) {
		
		return memberMapper.deleteMember(member_id) != 0 ? true : false;
	}

	//회원 로그인시 접속날짜 갱신
	@Override
	public boolean accessMember(String member_id) {
		
		return memberMapper.accessMember(member_id) != 0 ? true : false;
	}
	
	//회원 아이디 비번 찾을때 회원여부 체크
	@Override
	public MemberDTO findMember(MemberDTO mDto) {
		
		return memberMapper.findMember(mDto);
	}

	


	
}
