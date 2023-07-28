package com.spring.tmz.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.tmz.domain.Notice_fileVO;
import com.spring.tmz.service.Notice_service;

import net.coobird.thumbnailator.Thumbnailator;

@Controller
public class Notice_file_ajx_controller {

   private static final Logger logger = LoggerFactory.getLogger(Notice_file_ajx_controller.class);
   
   //저장경로 (Windows 환경이므로 경로구분자를 \\로 지정)
    private String upload_file_repo_dir = "C:\\tmz_upload\\ntupload";
    private Notice_service notice_service;

 
    //파일 업로드 요청 JSP 페이지 호출
    @GetMapping("/notice_fileUploadAjax")
    public String call_file_upload_ajax() {
       logger.info("upload ajax =====================");
       return "notice/notice_register";
    }
    
    //Step1- 날짜 형식 경로 문자열 생성 메소드
    private String get_date_fmt_path_name() { //메서드 추가
        //날짜 형식 지정
        SimpleDateFormat simple_date_format = new SimpleDateFormat("yyyy/MM/dd");
        //날짜 생성
        Date date = new Date();
        //날짜 형식이 지정된 날짜문자열(yyyy/MM/dd) 생성
        String str_datefmt_pathname = simple_date_format.format(date);
        //경로구분자를 운영체제에 맞도록 변경한 문자열을 반환
        return str_datefmt_pathname.replace("/", File.separator);
    }
 
    //썸네일 이미지 생성
    //Step1: 업로드파일에 대한 이미지 파일여부 검사 메소드
    private boolean checkis_image_for_uploadfile(File upload_file) { // 메서드 추가
        try {
           String str_content_type = Files.probeContentType(upload_file.toPath());
           logger.info("업로드파일의 str_content_type: " + str_content_type);
           
           return str_content_type.startsWith("image");
           } catch (IOException e) {
              e.printStackTrace();
        }
     
     return false;
    }
    
    //업로드 요청 파일-저장 및 결과 메시지 전송
    @PostMapping (value = "/notice_file_upload_ajax_action", produces = { "application/json; charset=UTF-8" }) // 수정
    @ResponseBody // 추가
    public ResponseEntity<List<Notice_fileVO>> file_upload_actionpost(MultipartFile[] upload_files) { // 수정
       logger.info("====FileUpload With Ajax ========");

       // 업로드 파일 각각에 대한 피드백정보(AttachInfoDTO)를 담을 리스트 객체
       List<Notice_fileVO> list_attach_info = new ArrayList<Notice_fileVO>();// 추가

       // 날짜 형식(yyyy/MM/dd)의 폴더구조 생성
       // File file_upload_path = new File(upload_file_repo_dir, getDatefmget_date_fmt_path_nametPathName());
       // //주석처리 또는 삭제
       // log.info("upload path: " + file_upload_path); //주석처리 또는 삭제
       // 날짜 형식 폴더경로 문자열 생성(사용자에게 전달될 각 업로드파일의 저장경로로 날짜구조 폴더만 전달)
       String str_datefmt_pathname = get_date_fmt_path_name(); // 추가

       // 전체 업로드 경로 파일객체 생성
       File file_upload_path = new File(upload_file_repo_dir, str_datefmt_pathname); // 추가
       logger.info("upload path: " + file_upload_path); // 추가

       // 경로가 존재하지 않으면 전체 폴더 구조 생성, 기존 폴더 구조중 일부가 있으면 없는 부분을 포함하여 전체를 생성
       if (!file_upload_path.exists()) { // 추가
    	   file_upload_path.mkdirs(); // 추가
       }
       // 각각의 업로드파일 이름 구성 후, 저장경로와 파일이름으로 생성된 파일객체를 서버에 저장
       for (MultipartFile multipart_upload_file : upload_files) {
          logger.info("=================================");
          logger.info("Upload File Name: " + multipart_upload_file.getOriginalFilename());
          logger.info("Upload File Size: " + multipart_upload_file.getSize());

          // 업로드파일 각각에 대한 피드백 정보가 저장될 AttachInfoDTO 객체 생성
          Notice_fileVO attach_info = new Notice_fileVO();// 추가

          // attachInfoDTO에 repository 경로 저장
          attach_info.setNotice_repo_path(upload_file_repo_dir.toString());// 추가
          logger.info("attach_info.notice_repo_path: " + attach_info.getNotice_repo_path());// 추가
          // attachInfoDTO에 날짜형식 경로 저장
          attach_info.setNuploadpath(str_datefmt_pathname.toString());// 추가
          logger.info("attach_info.nuploadpath: " + attach_info.getNuploadpath());// 추가

          // 업로드파일이름 원본문자열
          String str_upload_file_name = multipart_upload_file.getOriginalFilename();

          // [Edge, IE 오류 해결] multipart_upload_file.getOriginalFilename()에서 업로드 파일이름만 추출
          // 파일이름만 있는 경우, 파일이름만 추출됨
          str_upload_file_name = str_upload_file_name.substring(str_upload_file_name.lastIndexOf("\\") + 1);
          logger.info("수정된 파일이름(str_upload_file_name): " + str_upload_file_name);

          // attachInfoDTO에 원본업로드파일이름 저장
          attach_info.setNfilename(str_upload_file_name);// 추가
          logger.info("attach_info.nfilename: " + attach_info.getNfilename());// 추가
          // UUID를 이용한 고유한 파일이름 적용
          // 랜덤한 UUID값을 가진 UUID 객체 생성
          UUID uuid = UUID.randomUUID(); // 추가
          // attachInfo에 UUID 문자열 저장
          attach_info.setNuuid(uuid.toString()); // 추가
          logger.info("attach_info.nuuid: " + attach_info.getNuuid()); // 추가

          // 파일이름에 UUID 문자열 추가(파일 확장자 때문에 UUID를 앞에다 추가해야 함
          str_upload_file_name = uuid.toString() + "_" + str_upload_file_name; // 추가
          logger.info("UUID처리된파일이름: " + str_upload_file_name); // 추가
          // 업로드 정보(저장폴더와 파일이름 문자열)의 파일객체 생성
          // File saveUploadFile = new File(upload_file_repo_dir, str_upload_file_name); //주석처리
          // log.info("저장시 사용되는 파일이름(save_upload_file, 경로포함): " + save_upload_file); //주석처리

          // 날짜형식폴더구조가 포함된 File 객체를 사용하도록 수정됨
          File save_upload_file = new File(file_upload_path, str_upload_file_name); // 추가
          logger.info("저장시 사용되는 파일이름(save_upload_file, 경로포함): " + save_upload_file); // 추가
          try {
             // 서버에 파일객체를 이용하여 업로드 파일 저장
        	  multipart_upload_file.transferTo(save_upload_file);

             // 업로드 파일에 대하여 이미지파일 여부 확인
             if (checkis_image_for_uploadfile(save_upload_file)) {
                // 이미지파일 임 --> if 문 처리로 썸네일이미지 생성 및 저장
                // attachInfoDTO.file_type에 "I" 저장
            	 attach_info.setNfiletype("I"); // 추가
                logger.info("attach_info.nfiletype: " + attach_info.getNfiletype()); // 추가
                // 썸네일 생성경로와 파일이름이 설정된 파일객체를 전송 보내는 FileOutputStream 객체 생성
                FileOutputStream outputStreamForThumbnail = new FileOutputStream(
                      new File(file_upload_path, "s_" + str_upload_file_name));
                // FileOutput-스트림으로 보내진 파일객체를 서버에 저장(input)하여, 20X20 크기(px)의 썸네일 생성
                Thumbnailator.createThumbnail(multipart_upload_file.getInputStream(), // 원본파일이 inputStream
                      outputStreamForThumbnail, 50, 50); // 썸네일이 outputStream
                // OUT 스트림리소스 닫기
                outputStreamForThumbnail.flush();
                outputStreamForThumbnail.close();

             } else {// 이미지파일이 아님, //else {} 전체 추가
                // attachInfoDTO.file_type 에 "F" 저장
            	 attach_info.setNfiletype("F"); // 추가
                logger.info("attach_info.file_type: " + attach_info.getNfiletype());// 추가
             }
          } catch (Exception e) {
             logger.error(e.getMessage());
          }
          // List 객체에 attachInfoDTO 추가
          list_attach_info.add(attach_info); // 추가
       } // End-for
       return new ResponseEntity<List<Notice_fileVO>>(list_attach_info, HttpStatus.OK); // 수정
    }

    // 썸네일 이미지 파일 다운로드
    @GetMapping("/notice_display_thumbnail_file")
    @ResponseBody
    public ResponseEntity<byte[]> send_thumb_nail_file(String file_name) {
       File file = new File(file_name);
       logger.info("썸네일파일이름(경로포함): " + file);

       ResponseEntity<byte[]> result = null;

       try {
          HttpHeaders headers = new HttpHeaders();
          // HttpHeader 객체에 썸네일이미지파일의 Content-Type 추가
          headers.add("Content-Type", Files.probeContentType(file.toPath()));
          // 복사된 썸네일 파일을 HttpHeader에 추가된 Content-Type과 상태값을 가지고 ResponseEntity<byte[]> 객체
          // 생성
          result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
       } catch (IOException e) {
          e.printStackTrace();
       }
       return result; // ResponseEntity<byte[]> 객체 반환
    }
    //서버에 업로드 된 파일 삭제
    @PostMapping("/delete_uploaded_file")
    @ResponseBody
    public ResponseEntity<String> delete_file(String file_name,String file_type){
       logger.info("delete_file_name:"+file_name);
       logger.info("delete_file_type:"+file_type);
       
       //File 객체 생성
       File delFile = null;
       
       try {
          //전체 경로명이 포함된 파일이름을 UTF-8로 디코딩하여 파일 객체를 생성합니다.
          delFile = new File(URLDecoder.decode(file_name,"UTF-8"));
          logger.info("decoded deleting file_name:"+delFile);
          
          //파일객체의 delete()메서드로 파일(썸네일 객체 정보 파일과 일반파일)을 삭제합니다.
          delFile.delete();
          
          //삭제파일의 유형이 image 값인 경우
          if(file_type.equals("I")) {
             //삭제된 파일의 파일객체에서 s_가 삭제된 파일이름을 얻음
             String original_image_file_name = delFile.getAbsolutePath().replace("s_", "");
             logger.info("largeFileName:"+original_image_file_name);
             
             //s_가 삭제된 파일이름으로 이미지파일 이름의 객체를 얻어서
             delFile = new File(original_image_file_name);
             //원본 이미지파일 삭제합니다.
             delFile.delete();      
          }
       } catch (UnsupportedEncodingException e) {
          e.printStackTrace();
          return new ResponseEntity<>(HttpStatus.NOT_FOUND);
       }
       //삭제 후, 파일이 삭제되었다는 메시지를 전달합니다
       return new ResponseEntity<String>("success_deleting_file",HttpStatus.OK);
    }
    
    
    //DB에 업로드 된 파일 삭제
    @PostMapping("/delete_notice_file")
    @ResponseBody
    public ResponseEntity<String> delete_notice_file(String file_uuid){
    	logger.info("delete_file_uuid:"+file_uuid);
    	int result = notice_service.delete_notice_file(file_uuid);
    	if(result ==0) {
    		return new ResponseEntity<String>("파일 삭제 실패",HttpStatus.NOT_FOUND);
    	}else {
    		return new ResponseEntity<String>("success_deleting_file",HttpStatus.OK);
    	}
    }
    
    
}
   
