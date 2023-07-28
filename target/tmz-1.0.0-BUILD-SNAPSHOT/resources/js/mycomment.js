/**
 * mycomment.js: 댓글/답글 데이터 처리용 Ajax Closure Module 
 */

//alert("댓글처리 클로저 모듈 실행됨======================");

var comment_clsr = (function() {
	//브라우저의 상세 페이지에서 Javascript에 의해 호출 시 전달받는 매개변수 설명
	//bnoAndPage: 서버로 전달할 값,
	//callback: 서버 처리 성공 시 브라우저에 의해 처리되는 함수
	//error: 서버 처리 실패 시 브라우저에 의해 처리되는 함수
	//댓글 목록(페이징) - ajax() 함수 사용
	function get_cmt_list(paging_params, callback, error) {
		var rv_no = paging_params.rv_no;
		var page = paging_params.page || 1;
		console.log("getCmtList()가 전달받은 rv_no: " + rv_no);
		console.log("getCmtList()가 전달받은 page: " + page);
		console.log("getCmtList()함수의 ajax 처리 시작....................");
		//댓글 목록 조회 컨트롤러의 매핑 URL: GET /replies/pages/{bno}/{page}
		//$.ajax() 함수는, 자바스크립트 객체를 매개값으로 받아 처리
		$.ajax({
			type: 'get', //전송유형: get 방식
			url: "/tmz/review-replies/review-pages/" + rv_no + "/" + page, //컨트롤러 메소드 호출 URL
			dataType: 'json', //서버로부터 받는 값들이 JSON 형식임(서버의 produces 속성에 대응)
			//'json', 'xml' , 'text', 'html' ,'script' 값을 설정할 수 있음
			//서버처리 성공 시 실행 함수, XHR (XML Http Request)
			//result 매개변수를 통해 서버로부터 전달받은 데이터가 callback 함수에 의해 처리됨
			success: function(reply_paging_creator, status, xhr) {
				if (callback) { //callback 매개변수에 함수가 있으면 ,참
					callback(reply_paging_creator);
				}
			},
			//서버처리 실패 시, 매개변수로 전달된 함수 실행, XHR (XML Http Request)
			error: function(xhr, status, er) {
				if (error) { //error 매개변수에 함수가 있으면 ,참
					error(er);
				}
			}
		}
		); //.ajax END
	}//getCmtList END
	//댓글 등록
	function register_cmt(comment, callback, error) {
		var rv_no = comment.rv_no;
		console.log("registerCmt() 에 전달된 rv_no: " + rv_no);
		console.log("registerCmt() 함수의 comment 등록 ajax 처리 시작....................");
		//댓글 등록 컨트롤러의 매핑 URL: GET /replies/{bno}/new
		//data: 브라우저가 서버에게 보내는 데이터
		//contentType: 서버에게 보내는 데이터의 MIME타입 설정, 컨트롤러의 consumes 속성에 대응
		$.ajax({
			type: "post",
			url: "/tmz/review-replies/" + rv_no + "/new",
			data: JSON.stringify(comment),
			beforeSend : function(xhr)
                      {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
                      },
			contentType: "application/json; charset=utf-8",
			success: function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error: function(xhr, status, er) {
				if (error) {
					alert(er);
				}
			}
		});//.ajax END
	}//registerCmt 함수 END
	//답글 등록:
	function register_review_reply(reply, callback, error) {
		var rv_no = reply.rv_no;
		var rrepl_pno = reply.rrepl_pno;
		console.log("registerReply() 전달받은 rv_no: " + rv_no);
		console.log("registerReply() 전달받은 rrepl_pno: " + rrepl_pno);
		console.log("registerReply()함수의 댓글에 대한 답글 등록 ajax 처리 시작..................");
		//답글 등록 컨트롤러의 매핑 URL: GET /replies/{bno}/{prno}/new
		//data: 브라우저가 서버에게 보내는 데이터
		//contentType: 서버에게 보내는 데이터의 MIME타입 설정, 컨트롤러의 consumes 속성에 대응
		
		$.ajax({
			type: "post",
			url: "/tmz/review-replies/" + rv_no + "/" + rrepl_pno + "/new",
			data: JSON.stringify(reply),
			beforeSend : function(xhr)
                      {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
                      },
			contentType: "application/json; charset=utf-8",
			dataType: 'text',
			success: function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error: function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		}
		);//.ajax END
	}//registerReply 함수 END
	//jQuery Ajax의 get() 메소드 사용: url 주소로 GET 방식으로 요청, 객체로 받음
	//get( url [, data] [, success(data, textStatus, jqXHR)] [, dataType] )
	//댓글 조회
	function get_cmt_reply(rv_no_and_rrepl_no, callback, error) {
		var rv_no = rv_no_and_rrepl_no.rv_no;
		var rrepl_no = rv_no_and_rrepl_no.rrepl_no;
		console.log("get_cmt_reply() 전달받은 rv_no: " + rv_no);
		console.log("get_cmt_reply() 전달받은 rno: " + rrepl_no);
		console.log("get_cmt_reply() 함수의 특정 댓글에 조회 ajax 처리 시작......");
		//댓글 조회 컨트롤러의 매핑 URL: GET /replies/{bno}/{rno}  .json 추가
		$.get("/tmz/review-replies/" + rv_no + "/" + rrepl_no + ".json", //json 형식으로 전송됨
			function(result) {
				if (callback) {
					callback(result);
				}
			}).fail(function(xhr, status, err) {
				if (error) {
					error();
				}
			});//fail END
	}//getCmtReply 함수 END
	//댓글 수정: 수정된 특정 댓글을 서버로 전송
	function modify_cmt_reply(comment, callback, error) {
		var rv_no = comment.rv_no;
		var rrepl_no = comment.rrepl_no;
		console.log("modify_cmt_reply() 전달받은 rv_no: " + rv_no + " 전달받은 rrepl_no: " + rrepl_no);
		console.log("modify_cmt_reply() 함수의 특정 댓글 수정 ajax 처리 시작......");
		//댓글 수정 컨트롤러의 매핑 URL: PUT 또는 PATCH /replies/{bno}/{rno}
		$.ajax({
			type: "put",
			url: "/tmz/review-replies/" + rv_no + "/" + rrepl_no,
			data: JSON.stringify(comment),
			contentType: "application/json; charset=utf-8",
			dataType: "text", // 서버로부터 전달받는 데이터 유형을 설정(xml, text, html, json 등)
			beforeSend : function(xhr)
                      {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
                      },
			success: function(modify_result, status, xhr) {
				if (callback) {
					callback(modify_result);
				}
			},
			error: function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});//ajax END
	}//update EN
	//댓글 삭제(실제 삭제)
	function remove_cmt_reply(comment, callback, error) {
		var rv_no = comment.rv_no;
		var rrepl_no = comment.rrepl_no;
		var rrepl_writer = comment.rrepl_writer
		console.log("remove_cmt_reply() 전달받은 rv_no: " + rv_no);
		console.log("remove_cmt_reply() 전달받은 rrepl_no: " + rrepl_no);
		console.log("remove_cmt_reply() 전달받은 rrepl_writer: " + rrepl_writer);
		console.log("remove_cmt_reply() 함수의 댓글 삭제 ajax 처리 시작.......");
		//댓글 삭제 컨트롤러의 매핑 URL: DELETE /replies/{bno}/{rno}
		$.ajax({
			type: "delete",
			url: "/tmz/review-replies/" + rv_no + "/" + rrepl_no,
			data: JSON.stringify({ rv_no: rv_no, rrepl_no: rrepl_no, rrepl_writer: rrepl_writer }),
			beforeSend : function(xhr)
                      {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
                      },
			contentType: "application/json; charset=utf-8",
			success: function(remove_result, status, xhr) {
				if (callback) {
					callback(remove_result);
				}
			},
			error: function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		}); //ajax END
	}//removeCmtReply 함수 END
	
	//날짜시간 표시형식 설정 (서버와 상관없음)
	//JSON 날짜시간을 그대로 표시하면 1594169682000 이렇게 표시됩니다.
	//일반적인 날짜 시간 표시 형식으로 표시, 
	function show_datetime(datetime_value) {
		var dateObj = new Date(datetime_value);//전달된 댓글의 수정 날짜시간 값 저장
		var str = "";
		var yyyy = dateObj.getFullYear(); //YYYY
		var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
		var dd = dateObj.getDate();
		var hh = dateObj.getHours();
		var mi = dateObj.getMinutes();
		var ss = dateObj.getSeconds();
		str = [yyyy, '/',
			(mm > 9 ? '' : '0') + mm, '/',
			(dd > 9 ? '' : '0') + dd, ' ',
			(hh > 9 ? '' : '0') + hh, ':',
			(mi > 9 ? '' : '0') + mi, ':',
			(ss > 9 ? '' : '0') + ss].join(''); //배열값으로 하나의 문자열로 합침
		return str;
	}
	return {
		get_cmt_list: get_cmt_list,
		register_cmt: register_cmt,
		register_review_reply: register_review_reply,
		get_cmt_reply : get_cmt_reply,
		modify_cmt_reply : modify_cmt_reply,
		remove_cmt_reply : remove_cmt_reply,
		show_datetime : show_datetime
	};
})(); //즉시 실행 함수
