package com.spring.tmz.common.task;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.spring.tmz.domain.Confirm_partyVO;
import com.spring.tmz.domain.FriendVO;
import com.spring.tmz.domain.Friend_replVO;
import com.spring.tmz.mapper.Friend_mapper;
import com.spring.tmz.mapper.Friend_repl_mapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Component
public class Change_frnd_status {
	
	private Friend_mapper friend_mapper;
	private Friend_repl_mapper friend_repl_mapper;
	
	@Scheduled(cron = "0 */3 * * * *")
	public void Change_status() {
		
		System.out.println("스케쥴러 시작");
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		String now = sdf.format(date);
		
		List<FriendVO> friend_list = friend_mapper.select_frnd_list_nopaging();
		
		for(FriendVO friend : friend_list) {
			if(date.after(friend.getFrnd_startdate())) {
				friend.setFrnd_status(true);
				friend_mapper.update_frnd_status(friend);
			}
			
			if(date.after(friend.getFrnd_enddate())) {

				List<Friend_replVO> friend_repl_list = friend_repl_mapper.select_repl_list_nopaging(friend.getFrnd_no() );
				
				if(friend_repl_list.size() > 0 ) {
					
					Confirm_partyVO con = new Confirm_partyVO();

					for(Friend_replVO friend_repl :  friend_repl_list) {
						
						if(friend_repl.getFrepl_confirm()) {
							
							con.setFrnd_no(friend.getFrnd_no());
							con.setParty_member(friend_repl.getFrepl_writer());
							con.setParty_writer_replier(false);
							friend_mapper.insert_confirm_party(con);
							
							con.setFrnd_no(friend.getFrnd_no());
							con.setParty_member(friend.getFrnd_writer());
							con.setParty_writer_replier(true);
							friend_mapper.insert_confirm_party(con);
							
						}
					}
					
				}
				
			}
		}
	}
	
}
