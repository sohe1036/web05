package com.eshop.bean;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class JoinMemberBean {
	@Size(min=2, max=20, message="길이는 2~20 사이로만 가능합니다.")
	@Pattern(regexp="^([A-Za-z])+([0-9])+$", message="아이디는 영문대소문자와 숫자의 조합으로만 가능합니다.")
	private String uid;
	
	@Size(min=4, max=30, message="길이는 4~30 사이로만 가능합니다.")
	@Pattern(regexp="^([A-Za-z])+([0-9])+$", message="비밀번호는 영문대소문자와 숫자의 조합으로만 가능합니다.")
	private String upw;
	
	@Size(min=4, max=30, message="길이는 4~30 사이로만 가능합니다.")
	@Pattern(regexp="^([A-Za-z])+([0-9])+$", message="비밀번호는 영문대소문자와 숫자의 조합으로만 가능합니다.")
	private String upw2;
	
	private String uname;
	private String birth;
	private String tel;
	private String email;
	private String regdate;
}
