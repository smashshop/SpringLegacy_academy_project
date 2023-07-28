package com.spring.tmz.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.tmz.domain.ContinentVO;
import com.spring.tmz.mapper.Continent_mapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class Continent_service_impl implements Continent_service {

	private Continent_mapper continent_mapper;
	
	
	@Override
	public List<ContinentVO> get_continent_list() {
		return continent_mapper.select_continent_name();
	}
	
	
	
}
