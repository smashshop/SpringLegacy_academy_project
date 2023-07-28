package com.spring.tmz.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/mybatis-context.xml",
                  "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class Review_controller_test {
   
   @Setter(onMethod_= {@Autowired})
   private WebApplicationContext ctx;
   
   private MockMvc mockMvc;
   @Before
   public void setup() {
      this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
   }
//   @Test
//   public void testShowBoardList() throws Exception{
//      log.info(mockMvc.perform(MockMvcRequestBuilders.get("/review/review-list"))
//            .andReturn()
//            .getModelAndView()
//            .getModelMap()            
//            );
//   }
//   @Test
//   public void testshowBoardRegisterPage() throws Exception {
//      log.info(mockMvc.perform(MockMvcRequestBuilders.get("/review/review-register"))
//      .andReturn()
//      .getModelAndView()
//      .getModelMap()            
//      );
//   }
//   @Test
//   public void registerNewBoard() throws Exception {
//      String result = 
//      mockMvc.perform(MockMvcRequestBuilders.post("/review/review-register")
//                                          .param("rv_title", "게시물 등록 컨트롤러 테스트 제목")
//                                          .param("rv_content", "게시물 등록 컨트롤러 테스트 내용")
//                                          .param("rv_writer", "test")
//            )
//      .andReturn()
//      .getModelAndView()
//      .getViewName();         
//      log.info(result);
//   }
//   @Test
//    public void testshowBoardDetail() throws Exception {
//    log.info(mockMvc.perform(MockMvcRequestBuilders
//          .get("/review/review-detail") // /myboard/detailmod
//          .param("rv_no", "1"))
//          .andReturn()
//         .getModelAndView()
//         .getModelMap());
//    }
//   @Test
//    public void testModifyBoard() throws Exception {
//    String resultPage = mockMvc.perform(MockMvcRequestBuilders
//          .post("/review/review-modify")
//          .param("rv_no", "1")
//          .param("rv_title", "게시물 수정-컨트롤러 테스트 제목")
//          .param("rv_content", "게시물 수정-컨트롤러 테스트 내용")
//          .param("rv_writer", "test"))
//          .andReturn()
//          .getModelAndView()
//          .getViewName();
//    log.info(resultPage);
//    }
//   @Test
//   public void testShowBoardList() throws Exception {
//    log.info(mockMvc.perform(MockMvcRequestBuilders.get("/review/review-list")
//    .param("review_page_num", "2") //페이징 테스트 시 추가
//    .param("review_page_row_amount_per_page", "10") //페이징 테스트 시 추가
//    )
//    .andReturn()
//    .getModelAndView()
//    .getModelMap());
//   }
   

}