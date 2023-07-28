package com.spring.tmz.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.spring.tmz.domain.UserinfoVO;

import lombok.Setter;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/mybatis-context.xml")
public class Userinfo_test {
	
	@Setter(onMethod_ = @Autowired)
	private Userinfo_mapper userinfo_mapper;
	
	@Test
	public void select_userinfo_list_test() {
		List<UserinfoVO> userinfo_list = userinfo_mapper.select_userinfo_list("zzag", "1");
		userinfo_list.forEach(user -> System.out.println(user));
	}
	
}
