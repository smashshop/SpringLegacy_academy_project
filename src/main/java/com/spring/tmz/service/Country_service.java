package com.spring.tmz.service;

import java.util.List;

import com.spring.tmz.domain.CountryVO;

public interface Country_service {
	
	public List<CountryVO> get_country_list();
	public List<CountryVO> get_country_list(String continent_name);
}
