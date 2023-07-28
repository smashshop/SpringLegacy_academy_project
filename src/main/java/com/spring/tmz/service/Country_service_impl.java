package com.spring.tmz.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.tmz.domain.CountryVO;
import com.spring.tmz.mapper.Country_mapper;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Service
@AllArgsConstructor
public class Country_service_impl implements Country_service{

	private Country_mapper country_mapper;
	
	
	@Override
	public List<CountryVO> get_country_list() {
		return country_mapper.select_country_name();
	}
	
	@Override
	public List<CountryVO> get_country_list(String contienent_name) {
		return country_mapper.select_country_name(contienent_name);
	}
	
}
