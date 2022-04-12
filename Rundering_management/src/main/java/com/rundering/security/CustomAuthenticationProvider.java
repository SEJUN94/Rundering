package com.rundering.security;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;

import com.rundering.dto.TestVO;
import com.rundering.service.TestService;


public class CustomAuthenticationProvider implements AuthenticationProvider {
	
	private TestService testService;
	public void setTestService(TestService testService) {
		this.testService = testService;
	}
	 
 
	@Override 
	public Authentication authenticate(Authentication auth) throws AuthenticationException {
		 
		String login_id = (String) auth.getPrincipal(); // 로그인 시도한 ID를 가져온다
 		String login_pwd = (String) auth.getCredentials(); //로그인 시도한 Password 를 가져온다.
		
 		TestVO test = null;
 		
 		try {
			test=testService.getTest(login_id);
		} catch (Exception e) {
			e.printStackTrace();
			throw new BadCredentialsException("서버 장애로 서비스가 불가합니다.");
		}
 		
 		if(test != null) {
 			if(login_pwd.equals(test.getPwd())) {//아이디 패스워드 일치
 				UserDetails authUser = new User(test);
 				boolean invalidCheck = authUser.isAccountNonExpired()
					  	   && authUser.isAccountNonLocked()
					  	   && authUser.isCredentialsNonExpired()
					  	   && authUser.isEnabled();
 				if(invalidCheck) {
 					// 	스프링 시큐리티 내부 클래스로 인증 토큰 생성한다.
 					UsernamePasswordAuthenticationToken result =
							new UsernamePasswordAuthenticationToken(authUser.getUsername(),
																 	authUser.getPassword(),
																	authUser.getAuthorities());
			 		// 전달할 내용을 설정한 후 
			         result.setDetails(authUser);
			         // 리턴한다. successHandler로 전송된다.   
			         return result;
 				}
 				
 				throw new BadCredentialsException("상태변경으로 로그인이 불가합니다.");
 			}else { // 패스워드 불일치
 				throw new BadCredentialsException("패스워드가 일치하지 않습니다.");
 			}
 		}else { // 존재하지 않는 아이디
 			throw new BadCredentialsException("존재하지 않는 아이디입니다.");
 		}		
	
	}

	@Override
	public boolean supports(Class<?> auth) {
		return auth.equals(UsernamePasswordAuthenticationToken.class);
	}

}




