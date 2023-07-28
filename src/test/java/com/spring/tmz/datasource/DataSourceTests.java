package com.spring.tmz.datasource;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/mybatis-context.xml")
@Log4j
public class DataSourceTests{
	
//	@Setter(onMethod_ = {@Autowired})
//	private DataSource dataSource;
//	
//	@Autowired
//	public void setDataSource(DataSource dataSource) {
//		this.dataSource = dataSource;
//	}
//
//	@Test
//	public void testConnection() {
//		
//		Connection con;
//		try {
//			con = dataSource.getConnection();
//			log.info(con);
//		} catch (SQLException e) {
//			fail(e.getMessage());
//		}
//		
//	}
	
//myBatis Test방법 1(마이바티스 스프링의 세션템플릿 사용)	
//	@Setter(onMethod_ = {@Autowired})
//	private SqlSessionTemplate sqlSession;
//	
//	@Test
//	public void test_mybatis1() {
//		Connection con = sqlSession.getConnection();
//		log.info(con + "\n" + sqlSession);
//	}
	
	
//myBatis Test방법 2(아이바티스 세션의 세션팩토리 사용)	
	@Setter(onMethod_ = {@Autowired})
	private SqlSessionFactory sqlSessionFactory;
	
	@Test
	public void test_mybatis() {
		SqlSession sqlSession;
		try {
			sqlSession = sqlSessionFactory.openSession();
			Connection con = sqlSession.getConnection();
			log.info(con + "\n" + sqlSession);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
