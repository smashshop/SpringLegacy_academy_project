package com.spring.tmz.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@EqualsAndHashCode
public class PagingDTO {
	
	private String keyword;
	private String frnd_startdate;	
	private String continent_name;
	private String country_name;
	private Integer page_num;
	
	public PagingDTO() {
		this.page_num = 1;
	}
	
	public PagingDTO(String keyword, String frnd_startdate, String continent_name, String country_name, Integer page_num) {

		if (page_num == null || page_num <= 0) {
			this.page_num = 1;
		}
		else {
			this.page_num = page_num;			
		}
		
		this.keyword = keyword;
		this.frnd_startdate = frnd_startdate;
		this.continent_name = continent_name;
		this.country_name = country_name;
	}
	
	public String addPagingParamsToURI() {
		
		 UriComponentsBuilder uriBuilder =
				 UriComponentsBuilder.fromPath("")				 					 
				 					 .queryParam("keyword", this.keyword)
		 							 .queryParam("frnd_startdate", this.frnd_startdate)
		 							 .queryParam("continent_name", this.continent_name)
		 							 .queryParam("country_name", this.country_name);
		 
		String uriString = uriBuilder.toUriString();
		System.out.println("생성된 URI String: " + uriString);
		return uriString;
	}



}
