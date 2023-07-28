package com.spring.tmz.common.security;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import lombok.extern.log4j.Log4j;

@Log4j
public class Login_success_handler extends SavedRequestAwareAuthenticationSuccessHandler {
	
	@Override	
	public void onAuthenticationSuccess(HttpServletRequest request, 
										HttpServletResponse response,
										Authentication authentication) 
												throws ServletException, IOException {
		
		//이전 인증 오류 삭제
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
		}
		
		log.info("로그인 성공 후: MyLoginSuccessHandler.onAuthenticationSuccess() 시작......");
		log.info("전달된 Authentication 객체 정보: " + authentication);
		
		//userdetails 타입의 user 객체에 있는 확인된 권한 이름을 Set 객체에 저장
		Set<String> roleNames = 
				AuthorityUtils.authorityListToSet(authentication.getAuthorities());
		
		RequestCache requestCache = new HttpSessionRequestCache();
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		
		if (savedRequest == null) {
			if (roleNames.contains("ROLE_ADMIN")) {
				response.sendRedirect("/tmz/main");
			}
			else {
				response.sendRedirect("/tmz/main");
			}
		}
		else {
			String strSavedRequest = savedRequest.getRedirectUrl();
			
			RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
			
			redirectStrategy.sendRedirect(request, response, strSavedRequest);
		}
		
	}
	
}