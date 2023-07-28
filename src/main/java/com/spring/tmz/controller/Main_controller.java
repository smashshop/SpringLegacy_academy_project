package com.spring.tmz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.tmz.domain.PagingDTO;
import com.spring.tmz.service.Friend_service;
import com.spring.tmz.service.Review_service;
import com.spring.tmz.service.Userinfo_service;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class Main_controller {
	
	private Friend_service friend_service;
	private Review_service review_service;
	private Userinfo_service userinfo_service;
	
	@RequestMapping("/main")
	public String show_main(Model model) {
		
		model.addAttribute("frnd_list", friend_service.get_frnd_list(new PagingDTO(null, null, null, null, 0)));
		model.addAttribute("rv_list", review_service.get_review_board_list_main());
		model.addAttribute("select_continent_east_asia", userinfo_service.select_continent_east_asia());
	      
		model.addAttribute("select_continent_southeast_asia", userinfo_service.select_continent_southeast_asia());
		  
		model.addAttribute("select_continent_southwest_asia", userinfo_service.select_continent_southwest_asia());
		  
		model.addAttribute("select_continent_europe", userinfo_service.select_continent_europe());
		  
		model.addAttribute("select_continent_america", userinfo_service.select_continent_america());
		  
		model.addAttribute("select_continent_oceania", userinfo_service.select_continent_oceania());
		  
		model.addAttribute("select_continent_africa", userinfo_service.select_continent_africa());
				
		return "main";
	}
	
}
