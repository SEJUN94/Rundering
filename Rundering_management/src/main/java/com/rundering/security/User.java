package com.rundering.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.rundering.dto.TestVO;


public class User implements UserDetails {

	private TestVO test;	
	public User(TestVO test) {	
		this.test = test;
	}
	
	 
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();	
		roles.add(new SimpleGrantedAuthority(test.getAuthority()));
		return roles;
	}
 
	@Override
	public String getPassword() {
		return test.getPwd();
	}

	@Override
	public String getUsername() {
		return test.getId();
	}


	@Override
	public boolean isAccountNonExpired() { //기간제 계정의 경우 기간만료 여부  : enabled =4
		return test.getEnabled()!=4;
 	}

	@Override
	public boolean isAccountNonLocked() { //사용 정지 혹은 휴먼계정  : enabled =3
		return test.getEnabled()!=3;
	}

	@Override
	public boolean isCredentialsNonExpired() {//인증정보 만료 여부 : enabled =2
		return test.getEnabled()!=2;
	}

	@Override
	public boolean isEnabled() {// 탈퇴 혹은 삭제 : enabled = 0
		return test.getEnabled()!=0;
	}
	
	public TestVO getTestVO() {
		return this.test;
	}

}




