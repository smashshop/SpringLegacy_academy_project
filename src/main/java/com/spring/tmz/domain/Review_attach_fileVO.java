package com.spring.tmz.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Review_attach_fileVO {
	 
	 private String ruuid;
	 private String ruploadpath;
	 private String rfilename; 
	 private String rfiletype;
	 private long rv_no; 
	 
	 private String review_repo_path = "C:\\tmz_upload\\review"; //서버레포지토리경로 저장

}
