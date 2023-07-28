package com.spring.tmz.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Friend_fileVO {
	
	private String fuuid;
	private String ffilename; 
	private String fuploadpath;
	private Integer frnd_no;
	private String frepoPath = "C:\\tmz_upload\\friend";

}
