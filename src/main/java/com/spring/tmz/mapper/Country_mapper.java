package com.spring.tmz.mapper;

import java.util.List;

import com.spring.tmz.domain.CountryVO;

public interface Country_mapper {

	public List<CountryVO> select_country_name();
	public List<CountryVO> select_country_name(String continent_name);
}
