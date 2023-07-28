package com.spring.tmz.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StatisticsVO {
	
		//일간통계 VO	
	
		private int user_regdate2;
		private int cnt;
		
	
		//월간통계 VO
	
		private Integer M01;
		private Integer M02;
		private Integer M03;
		private Integer M04;
		private Integer M05;
		private Integer M06;
		private Integer M07;
		private Integer M08;
		private Integer M09;
		private Integer M10;
		private Integer M11;
		private Integer M12;
		
		//동행순위
		
		private String frepl_writer;		
		private int frepl_confirm_sum;
		private String user_name;
	
		
		

}
