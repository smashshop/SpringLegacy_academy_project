package com.spring.tmz.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Notice_file_down_controller {
	private static final Logger log = LoggerFactory.getLogger(Notice_file_down_controller.class);

	@GetMapping(value = "/notifile_download_action", produces = { "application/octet-stream" })
	@ResponseBody 
	public ResponseEntity<Resource> notifile_download_action(
			// 사용자 브라우저를 확인하기 위해 User-Agent 해더를 매개변수로 설정
			@RequestHeader("User-Agent") String userAgent, String file_name) {
		log.info("브라우저로 요청에서 전달된 User-Agent 해더정보: " + userAgent);
		log.info("처리 전 파일이름: " + file_name);

		// 톰캣 서버 운영체제에 있는 파일을 액세스할 수 있는 Resource 객체를 생성하기 위하여
		// 스프링 Resource 인터페이스를 통해 FileSystemResource 구현객체를 생성합니다.
		Resource resource = new FileSystemResource(file_name);
		log.info("resource: " + resource);

		// 파일이 존재하지 않으면, 오류전송 후, 메소드 종료
		if (!resource.exists()) {
			return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);
		}
		// 파일이 존재하면 아래의 내용 수행
		// 확인된 파일이름을 변수에 저장
		String noti_resource_filename = resource.getFilename();
		log.info("UUID 제거 전 resourceFileName :" + noti_resource_filename);

		// UUID가 제거된 파일이름
		noti_resource_filename = noti_resource_filename.substring(noti_resource_filename.indexOf("_") + 1);
		log.info("UUID 제거 후 noti_resource_filename :" + noti_resource_filename);

		// 스프링의 HttpHeders 객체 생성
		HttpHeaders httpHeaders = new HttpHeaders();
		
		String noti_download_name = null;

		try {			
			if (userAgent.contains("Trident") || userAgent.contains("MSIE") || userAgent.contains("Edge")
					|| userAgent.contains("Edg")) {
				log.info("IE 또는 엣지 브라우저입니다");
				noti_download_name = URLEncoder.encode(noti_resource_filename, "UTF-8");
				log.info("IE에서의 파일이름: " + noti_download_name);

			} else {
				log.info("Chrome 브라우저입니다");
				// UTF-8로 인코딩한 문자열의 바이트를, HTML기본 인코딩(ISO-8859-1)으로 인코딩 된 문자열 생성
				// ISO-8859-1 대신 UTF-8을 지정하면, 웹브라우저에 전달된 파일이름이 ____.jpg로 표시됩니다.
				noti_download_name = new String(noti_resource_filename.getBytes("UTF-8"), "ISO-8859-1");
				// 콘솔(UTF-8 디코딩)을 사용하는데, 브라우저에 맞추어 ISO-8859-1 인코딩, 따라서 한글이 이상하게 표시됨(정상)
				log.info("Chrome에서의 파일이름: " + noti_download_name);

			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		// 생성된 HttpHeaers 객체에 파일을 다운로드 받을 수 있도록 Content-Disposition 해더 설정
		// HTML기본 인코딩(ISO-8859-1)으로 인코딩된 파일이름 문자열을 지정
		httpHeaders.add("Content-Disposition", "attachment; filename=" + noti_download_name);

		// ResponseEntity<Resource>에 서버의 파일리소스, HttpHeaders객체, 상태를 담아서 반환
		return new ResponseEntity<Resource>(resource, httpHeaders, HttpStatus.OK);
	}
}