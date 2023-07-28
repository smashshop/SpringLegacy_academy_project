package com.spring.tmz.domain;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice_regionVO {
	
	private String country_name;
	private String continent_name;
	private int continent_no;

}
