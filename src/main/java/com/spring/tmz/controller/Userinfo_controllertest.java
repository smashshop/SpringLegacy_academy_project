package com.spring.tmz.controller;

import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.tmz.domain.AuthorityVO;
import com.spring.tmz.domain.UserinfoVO;
import com.spring.tmz.service.Userinfo_service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/signup")
public class Userinfo_controllertest {
	
	private static final Logger logger = LoggerFactory.getLogger(Userinfo_controllertest.class);
	
	@Autowired
	BCryptPasswordEncoder passwordencoder;
	
	// 서비스
	@Setter(onMethod_ = @Autowired)
	private Userinfo_service userinfo_service;
	

	@RequestMapping("/test")
	public String test_con() {
		return "test";
	}

	// join페이지를 보여주는 메고드
	@GetMapping(value = "/join")
	public String join(UserinfoVO VO) {

		userinfo_service.join(VO);

		return "signup/join";
	}

	// 아이디 중복확인
	@RequestMapping(value = "/idCheckdo/{user_id}", method = RequestMethod.GET, produces = "text/plain; charset=utf8")
	@ResponseBody
	public ResponseEntity<String> idCheck(@PathVariable("user_id") String user_id) {

		boolean result = userinfo_service.idCheck(user_id);
		System.out.println(result);
		return result ? new ResponseEntity<String>("사용 불가", HttpStatus.OK)
				: new ResponseEntity<String>("사용 가능", HttpStatus.OK);
	}

	// 회원가입,인코딩 
		@PostMapping("/join")
		public String registerNewBoard(UserinfoVO userinfoVO, Model model) {
	        
			String rawPassword = userinfoVO.getUser_pw();

	        String encdoePassword1;  
	        
	        //회원가입 계정 권한 등록
	        String user_id = userinfoVO.getUser_id().toString();
	        
	        
	        encdoePassword1 = passwordencoder.encode(rawPassword);
	        userinfoVO.setUser_pw(encdoePassword1);
	        
			if (userinfo_service.register_userinfo(userinfoVO)) {
				model.addAttribute("result", "회원가입 성공");
				
				//회원가입 계정 권한 등록
				userinfo_service.insert_user_authority(user_id);

		        System.out.println("encdoePassword1 : " +encdoePassword1);

		        String truePassowrd = userinfoVO.getUser_pw();
		        
		        System.out.println("truePassword verify : " + passwordencoder.matches(truePassowrd, encdoePassword1));
				
				return "redirect:/login";
				
			} else {
				model.addAttribute("result", "회원가입 실패");
			}

			return "signup/join";
		}
	
	
	
	// 최예나/ 아이디 찾기 페이지를 보여주는
		@GetMapping("/find_id")
		public String show_id() {
			return "signup/find_id";
		}
		
		// 최예나/ 비번 찾기 페이지를 보여주는
		@GetMapping("/find_pw")
		public String show_pw() {
			return "signup/find_pw";
		}
		
		
		//최예나/ 아이디 찾기
		@PostMapping(value = "/find_id/{user_email}/{user_name}", produces ="text/plain;charset=utf-8")
		@ResponseBody
		public ResponseEntity<String> show_user_id(@PathVariable("user_name") String user_name,@PathVariable("user_email") String user_email) {
			System.out.println(user_name + "   " + user_email);
			System.out.println(userinfo_service.search_id(user_name, user_email));
			
			String result = userinfo_service.search_id(user_name, user_email);
			
			return new ResponseEntity<String>(result, HttpStatus.OK);
		}
		
		// 최예나/ 비번 찾기
//			@PostMapping("/find_pw")
//			public void show_user_pw() {
//				
//			}


}
