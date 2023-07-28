package com.spring.tmz.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice_fileVO {
	
	private String nfilename;	
	private String nuuid;
	private String nuploadpath;
	private String nfiletype;
	private long ntc_no;

	
	private String notice_repo_path ="C:\\tmz_upload\\ntupload";


}
