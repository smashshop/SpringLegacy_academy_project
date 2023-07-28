package com.spring.tmz.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/mybatis-context.xml")

@Log4j
public class Friend_mapper_tests {
	
	@Setter(onMethod_ = @Autowired)
	private Friend_mapper friend_mapper;
	
	@Test
	public void select_frnd_test() {
		log.info(friend_mapper.select_frnd(1));
	}
	
}
