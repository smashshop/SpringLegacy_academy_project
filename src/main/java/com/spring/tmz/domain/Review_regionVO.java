package com.spring.tmz.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review_regionVO {
	private String continent_name;
	private String country_name;
	private int continent_no;

}
