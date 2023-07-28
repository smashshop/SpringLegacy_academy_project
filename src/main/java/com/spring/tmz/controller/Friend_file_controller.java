package com.spring.tmz.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.tmz.domain.Friend_fileVO;
import com.spring.tmz.service.Friend_service;

import lombok.Setter;

@Controller
public class Friend_file_controller {
	
	private static final Logger log = LoggerFactory.getLogger(Friend_file_controller.class);
	
	@Setter(onMethod_ = @Autowired)
	private Friend_service friend_service;
	
	private String upload_file_repo_dir = "C:\\tmz_upload\\friend";
	
	//날짜 형식 문자열 생성 메서드
	private String get_date_fmt_path_name() { //메서드 추가
		 //날짜 형식 지정
		 SimpleDateFormat simple_date_format = new SimpleDateFormat("yyyy/MM/dd");
		 //날짜 생성
		 Date date = new Date();
		 //날짜 형식이 지정된 날짜문자열(yyyy/MM/dd) 생성
		 String str_date_fmt_path_name = simple_date_format.format(date);
		 //경로구분자를 운영체제에 맞도록 변경한 문자열을 반환
		 return str_date_fmt_path_name.replace("/", File.separator);
	}

	
	@PostMapping(value = "/friend_file_upload_ajax_action", produces =  "application/json; charset=UTF-8" )
	@ResponseBody
	public ResponseEntity<List<Friend_fileVO>> file_upload_ajax_action(MultipartFile[] upload_files) {
		log.info("====FileUpload With Ajax ========");
		
		List<Friend_fileVO> list_attach_info = new ArrayList<Friend_fileVO>();
		
		String str_date_fmt_path_name = get_date_fmt_path_name();
		
		File file_upload_path = new File(upload_file_repo_dir, str_date_fmt_path_name);
		log.info("upload path: " + file_upload_path);
		
		if (!file_upload_path.exists()) { // 추가
			file_upload_path.mkdirs(); // 추가
		}
		
		for (MultipartFile multi_part_upload_file : upload_files) {
			log.info("=================================");
			log.info(upload_files.toString());

			log.info("Upload File Name: "+ multi_part_upload_file.getOriginalFilename());
			log.info("Upload File Size: "+ multi_part_upload_file.getSize());
			
			Friend_fileVO attach_info = new Friend_fileVO();
			
			attach_info.setFrepoPath(upload_file_repo_dir.toString());
			log.info("attach_info.repoPath: " + attach_info.getFrepoPath());
			
			attach_info.setFuploadpath(str_date_fmt_path_name.toString());
			log.info("attach_info.getFuploadpath: " + attach_info.getFuploadpath());
			
			String str_upload_file_name = multi_part_upload_file.getOriginalFilename();
			
			str_upload_file_name = str_upload_file_name.substring(str_upload_file_name.lastIndexOf("\\") +1);
			log.info("수정된 파일이름(str_upload_file_name): " + str_upload_file_name);
			
			attach_info.setFfilename(str_upload_file_name);
			log.info("attach_info.getFfilename: " + attach_info.getFfilename());
			
			UUID uuid = UUID.randomUUID();
			
			attach_info.setFuuid(uuid.toString());
			log.info("attach_info.uuid: " + attach_info.getFuuid());
			
			str_upload_file_name = uuid.toString() + "-" + str_upload_file_name;
			log.info("UUID 처리된 파일 이름: " + str_upload_file_name);
			
			File save_upload_file = new File(file_upload_path, str_upload_file_name);
			log.info("저장시 사용되는 경로 + 파일 이름: " + save_upload_file);
			
			try {
				multi_part_upload_file.transferTo(save_upload_file);
				multi_part_upload_file.getInputStream();
			} catch (Exception e) {
				log.error(e.getMessage());
			}
			
			list_attach_info.add(attach_info);
		}
		return new ResponseEntity<List<Friend_fileVO>>(list_attach_info, HttpStatus.OK);
	}
	
	//업로드할 이미지 표시
	@GetMapping(value = "/friend_display_upload_file")
	@ResponseBody
	public ResponseEntity<byte[]> send_upload_file(String file_name) {
		
		File file = new File(file_name);
		
		ResponseEntity<byte[]> result = null;
		
		HttpHeaders header = new HttpHeaders();
		
		try {
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<byte[]> (FileCopyUtils.copyToByteArray(file),
												 header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@GetMapping("/friend_file_get/{frnd_no}")
	@ResponseBody
	public ResponseEntity<List<Friend_fileVO>> get_file_list(@PathVariable("frnd_no")int frnd_no){
		return new ResponseEntity<List<Friend_fileVO>>(friend_service.get_frnd_file(frnd_no), HttpStatus.OK);
	}
	
}
