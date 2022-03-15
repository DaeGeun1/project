package kr.co.marking.member.domain;

import lombok.Data;

@Data
public class AuthorityDTO {
	
	private String member_id;         // memberDTO 의 FK값
	private String member_authority;  // member의 권한 role_member / role_admin
}
