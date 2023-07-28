<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <!-- 시큐리티 할때는 필수!!!!!!!! 꼭 넣어야함!!!!주의!!!! -->
<c:set var="contextPath" value = "${pageContext.request.contextPath }"/>

   <!DOCTYPE html>
   <html><head>   
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Corona Admin</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${contextPath }/resources/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${contextPath }/resources/assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="${contextPath }/resources/assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="${contextPath }/resources/assets/images/favicon.png">
<script language="javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>   
  </head>
  <body>
  
    <div class="container-scroller">
      <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="row w-100 m-0">
          <div class="content-wrapper full-page-wrapper d-flex align-items-center auth login-bg">
            <div class="card col-lg-4 mx-auto">
              <div class="card-body px-5 py-5">
                <h3 class="card-title text-left mb-3">Travel ZZANG</h3><br>
                <form name = "frmBoard" id="frmBoard" method = "post" action = "${contextPath}/signup/join"><!-- class="was-validated" -->
                <sec:csrfInput/>  <!-- 폼태그 안에다가 이거 넣자 -->
                  <div class="form-group">
                    <label>ID</label>
                    <input type="text" id = "user_id" name = "user_id" class="form-control p_input" placeholder="아이디">
                  <p class="user_id_confirm"></p>
                      <div class="row">  
                    &nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-info btn-icon-text" id="btnIdDup">중복확인</button>
                    </div>
                  </div>
                  <div class="form-group">
                    <label>Email</label>
                    <input type="text" id = "user_email" name = "user_email" class="form-control p_input" placeholder="이메일">
                  </div>
                  <p class="user_email_confirm"></p>
                  <div class="form-group">
                    <label>Password</label>
                    <input type="password" id = "user_pw" name = "user_pw" class="form-control p_input" placeholder="비밀번호">
                  </div>
                  <p class="user_pw_confirm"></p>
                  <div class="form-group">
                    <label>Re_confirmation</label>
                    <input type="password" id = "user_pw2" class="form-control p_input" placeholder="비밀번호 재확인">
                  </div>
                   <p class="user_pw2_confirm"></p>
                  <div class="form-group">
                    <label>Name</label>
                    <input type="text" id = "user_name" name = "user_name" class="form-control p_input" placeholder="이름">
                  </div>
                  <p class="user_name_confirm"></p>
                  <div class="form-group">
                    <label>Birthday</label><br>
                  <div class="user_birth">
				  <input type="text" id="user_birth_yy" placeholder="년(4자)" class="btn btn-outline-secondary btn-md" maxlength="4">
				  <select id="user_birth_mm" class="btn btn-outline-secondary btn-md" aria-label="월">
				   	<option value="">월</option>
					<option value="01">
                       	1
                    </option>
					<option value="02">
                       	2
                    </option>
					<option value="03">
                       	3
                    </option>
					<option value="04">
                       	4
                    </option>
					<option value="05">
                       	5
                    </option>
					<option value="06">
                       	6
                    </option>
					<option value="07">
                       	7
                    </option>
					<option value="08">
                       	8
                    </option>
					<option value="09">
                       	9
                    </option>
					<option value="10">
                       	10
                    </option>
					<option value="11">
                       	11
                    </option>
					<option value="12">
                       	12
                    </option>
				  </select>
				  <select id="user_birth_dd" class="btn btn-outline-secondary btn-md" aria-label="일">
				   	<option value="">일</option>
					<option value="01">
                        1
                    </option>
					<option value="02">
                        2
                    </option>
					<option value="03">
                        3
                    </option>
					<option value="04">
                        4
                    </option>
					<option value="05">
                        5
                    </option>
					<option value="06">
                        6
                    </option>
					<option value="07">
                        7
                    </option>
					<option value="08">
                        8
                    </option>
					<option value="09">
                        9
                    </option>
					<option value="10">
                        10
                    </option>
					<option value="11">
                        11
                    </option>
					<option value="12">
                        12
                    </option>
                    <option value="13">
                        13
                    </option>
                    <option value="14">
                        14
                    </option>
                    <option value="15">
                        15
                    </option>
                    <option value="16">
                        16
                    </option>
                    <option value="17">
                        17
                    </option>
                    <option value="18">
                        18
                    </option>
                    <option value="19">
                        19
                    </option>
                    <option value="20">
                        20
                    </option>
                    <option value="21">
                        21
                    </option>
					<option value="22">
                        22
                    </option>
                    <option value="23">
                        23
                    </option>
                    <option value="24">
                        24
                    </option>
                    <option value="25">
                        25
                    </option>
                    <option value="26">
                        26
                    </option>
                    <option value="27">
                        27
                    </option>
                    <option value="28">
                        28
                    </option>
                    <option value="29">
                        29
                    </option>
                    <option value="30">
                        30
                    </option>
                    <option value="31">
                        31
                    </option>
				  </select>
                  </div>   
                  </div>
                  <p class="user_birth_confirm"></p>   
                  <div class="form-group">
                    <label>Tag</label>
                    <input type="text" id = "user_tag" name = "user_tag" class="form-control p_input" placeholder="자기소개">
                    <span>자신을 소개하고 싶은 한 단어씩 띄어서 30자 이내로 작성해주세요. <br>
                    	  ex) 20대 여행좋아</span>
                  </div>
                  <p class="user_tag_confirm"></p>
                  <div class="form-group">
                    <button type="button" class="btn btn-primary btn-block enter-btn" onclick="isExistboardValue()" id="enter_btn">Sign Up</button>
                  </div>
                 </form>
                  </div>
              </div>
            </div>
          </div>
          <!-- content-wrapper ends -->
        </div>
        <!-- row ends -->
      </div>
     
      <!-- page-body-wrapper ends -->
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="${contextPath }/resources/assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="${contextPath }/resources/assets/js/off-canvas.js"></script>
    <script src="${contextPath }/resources/assets/js/hoverable-collapse.js"></script>
    <script src="${contextPath }/resources/assets/js/misc.js"></script>
    <script src="${contextPath }/resources/assets/js/settings.js"></script>
    <script src="${contextPath }/resources/assets/js/todolist.js"></script>
    <!-- endinject -->
  
<script type="text/javascript">

var frmBoard = $("#frmBoard");
var join_check_id = false;
var join_check_id2 = false;
var join_check_email = false;
var join_check_pw = false;
var join_check_pw2 = false;
var join_check_name = false;
var join_check_birth = false;
var join_check_birth_yy = false;
var join_check_birth_mm = false;
var join_check_birth_dd = false;
var join_check_tag = false;
var join_check_exist = false;


//아이디 유효성 검사
$("#user_id").on("change",function(){

    var regExp = /^[a-z][a-z0-9]{5,19}$/;
    
    var result = $("#user_id").val();
   
    if(regExp.test(result)){
        $(".user_id_confirm").html("※올바른 아이디 형식 입니다. 중복확인을 위해 아래의 버튼을 눌러주세요.");
        $(".user_id_confirm").css("color","green");
        $(".user_id_confirm").css("display","block");
        $(".user_id_confirm").css("text-align","left");
        $(".user_id_confirm").css("font-size","14px");
        $(".user_id_confirm").css("padding-bottom","4px");     
     
        return join_check_id = true;
       
    }else{
        $(".user_id_confirm").html("※ 6~20자의 영문 소문자, 숫자만 사용 가능합니다.");
        $(".user_id_confirm").css("color","red");
        $(".user_id_confirm").css("display","block");
        $(".user_id_confirm").css("text-align","left");
        $(".user_id_confirm").css("font-size","14px");
        $(".user_id_confirm").css("padding-bottom","4px");
       
        return join_check_id = false;
       
    }
});

//아이디 중복체크 유효성 검사
$("#btnIdDup").on("click", function(){
    var user_id = $("#user_id").val();
   //alert(user_id);
   
    if(user_id != "" || user_id != null){ //조건문 2개
        
        $.ajax({
        url : "${contextPath}/signup/idCheckdo/" + user_id , 
        type : "get",
        dataType : "text",
        success : function(result){

    if (result == "사용 가능") {
    	alert("※ 아이디 중복확인 : 사용 가능한 아이디입니다.");
              
    }else{
    	alert("※ 아이디 중복확인 : 이미 사용중인 아이디입니다.");    
    }
    },
        error: function(a, b, c) {
            console.log(a, b, c);
        }        
    });
        return join_check_id2 = true;  
       
    }else{
          /* alert('아이디를 입력하세요.');
          $('#txtid').focus(); */
          
        return join_check_id2 = false; //중간에 있으면 뒤를 실행을 안함
          
      }
});

//이메일 유효성 검사
$("#user_email").on("change",function(){

    var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
   
    var result = $("#user_email").val();
   
    if(regExp.test(result)){
        $(".user_email_confirm").html("※사용가능한 이메일입니다.");
        $(".user_email_confirm").css("color","green");
        $(".user_email_confirm").css("display","block");
        $(".user_email_confirm").css("text-align","left");
        $(".user_email_confirm").css("font-size","14px");
        $(".user_email_confirm").css("padding-bottom","4px");
      
        return join_check_email = true;
       
    }else{
        $(".user_email_confirm").html("※이메일을 형식에 맞게 입력해주세요.");
        $(".user_email_confirm").css("color","red");
        $(".user_email_confirm").css("display","block");
        $(".user_email_confirm").css("text-align","left");
        $(".user_email_confirm").css("font-size","14px");
        $(".user_email_confirm").css("padding-bottom","4px");
  
        return join_check_email = false;
       
    }
});

//비밀번호 유효성 검사
$("#user_pw").on("change",function(){

    var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
    
    var result = regex.exec($("#user_pw").val());
    
    
    if(result != null){
        $(".user_pw_confirm").html("※사용가능한 비밀번호입니다.");
        $(".user_pw_confirm").css("color","green");
        $(".user_pw_confirm").css("display","block");
        $(".user_pw_confirm").css("text-align","left");
        $(".user_pw_confirm").css("font-size","14px");
        $(".user_pw_confirm").css("padding-bottom","4px");
        
        return join_check_pw = true; 
        
    }else{
        $(".user_pw_confirm").html("※최소 8 자, 하나 이상의 대문자, 하나의 소문자 및 하나의 숫자를 입력해주세요.");
        $(".user_pw_confirm").css("color","red");
        $(".user_pw_confirm").css("display","block");
        $(".user_pw_confirm").css("text-align","left");
        $(".user_pw_confirm").css("font-size","14px");
        $(".user_pw_confirm").css("padding-bottom","4px");
        
        return join_check_pw = false;
    }
});

//비밀번호 재확인 유효성 검사
$("#user_pw2").on("change",function(){

    var regExp2 = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
    
    var result = $("#user_pw").val();
    var result2 = $("#user_pw2").val();
   
    if(result == result2){
        $(".user_pw2_confirm").html("※일치합니다.");
        $(".user_pw2_confirm").css("color","green");
        $(".user_pw2_confirm").css("display","block");
        $(".user_pw2_confirm").css("text-align","left");
        $(".user_pw2_confirm").css("font-size","14px");
        $(".user_pw2_confirm").css("padding-bottom","4px");

        return join_check_pw2 = true; 
       
    }
   
    if (result == null || result == "") {
	    $("#user_pw2").val("");
	   
	    $(".user_pw2_confirm").html("※비밀번호 먼저 입력해주세요.");
        $(".user_pw2_confirm").css("color","red");
        $(".user_pw2_confirm").css("display","block");
        $(".user_pw2_confirm").css("text-align","left");
        $(".user_pw2_confirm").css("font-size","14px");
        $(".user_pw2_confirm").css("padding-bottom","4px");
	   
	    return join_check_pw2 = false; 
	   
	if(result != result2){
		$(".user_pw2_confirm").html("※설정하려는 비밀번호가 맞는지 확인하기 위해 다시 입력 해주세요.");
		$(".user_pw2_confirm").css("color","red");
		$(".user_pw2_confirm").css("display","block");
		$(".user_pw2_confirm").css("text-align","left");
		$(".user_pw2_confirm").css("font-size","14px");
		$(".user_pw2_confirm").css("padding-bottom","4px");
		     
	    return join_check_pw2 = false; 
	
	}
	
    }else{
       $(".user_pw2_confirm").html("※설정하려는 비밀번호가 맞는지 확인하기 위해 다시 입력 해주세요.");
       $(".user_pw2_confirm").css("color","red");
       $(".user_pw2_confirm").css("display","block");
       $(".user_pw2_confirm").css("text-align","left");
       $(".user_pw2_confirm").css("font-size","14px");
       $(".user_pw2_confirm").css("padding-bottom","4px");
    
       return join_check_pw2 = false; 
    
    }
}); 

//이름 유효성검사
$("#user_name").on("input",function(){

    var regExp = /^[가-힣]*$/;
    
    var result = $("#user_name").val();
   
    if(regExp.test(result)){
    	
    	$(".user_name_confirm").html("");
       
    	return join_check_name = true;
       
    }else{
    	
    	$(".user_name_confirm").html("※한글만 입력 가능합니다.");
        $(".user_name_confirm").css("color","red");
        $(".user_name_confirm").css("display","block");
        $(".user_name_confirm").css("text-align","left");
        $(".user_name_confirm").css("font-size","14px");
        $(".user_name_confirm").css("padding-bottom","4px");
        
        return join_check_name = false;
    }
});  

//(생일)년 유효성 검사
	if(user_birth_yy != "" || user_birth_yy != null) {

$("#user_birth_yy").on("change",function(){
	
		var regExp = /^(19|20)\d{2}$/; 
	
		var result1 = $("#user_birth_yy").val();
	
		if(regExp.test(result1)){
			$(".user_birth_confirm").html("");
			$(".user_birth_confirm").css("color","green");
			$(".user_birth_confirm").css("display","block");
			$(".user_birth_confirm").css("text-align","left");
			$(".user_birth_confirm").css("font-size","14px");
			$(".user_birth_confirm").css("padding-bottom","4px");  
	
			return join_check_birth_yy = true;
	
		}else{
			$(".user_birth_confirm").html("※태어난 년도 4자리를 정확하게 입력하세요.");
			$(".user_birth_confirm").css("color","red");
			$(".user_birth_confirm").css("display","block");
			$(".user_birth_confirm").css("text-align","left");
			$(".user_birth_confirm").css("font-size","14px");
			$(".user_birth_confirm").css("padding-bottom","4px");
	
			return join_check_birth_yy = false;
	
		}
	});
}

$("#user_birth_mm").on("change",function(){

	var result2 = $("#user_birth_mm option:selected").val();
	
	if(result2 >= '01'){
		$(".user_birth_confirm").html("");
		$(".user_birth_confirm").css("color","green");
		$(".user_birth_confirm").css("display","block");
		$(".user_birth_confirm").css("text-align","left");
		$(".user_birth_confirm").css("font-size","14px");
		$(".user_birth_confirm").css("padding-bottom","4px");   

		return join_check_birth_mm = true;

	}else{
		$(".user_birth_confirm").html("※태어난 월을 선택하세요.");
		$(".user_birth_confirm").css("color","red");
		$(".user_birth_confirm").css("display","block");
		$(".user_birth_confirm").css("text-align","left");
		$(".user_birth_confirm").css("font-size","14px");
		$(".user_birth_confirm").css("padding-bottom","4px");

		return join_check_birth_mm = false;

	}
});
		
$("#user_birth_dd").on("change",function(){

	var result3 = $("#user_birth_dd option:selected").val();

	if(result3 >= '01'){
		$(".user_birth_confirm").html("");
		$(".user_birth_confirm").css("color","green");
		$(".user_birth_confirm").css("display","block");
		$(".user_birth_confirm").css("text-align","left");
		$(".user_birth_confirm").css("font-size","14px");
		$(".user_birth_confirm").css("padding-bottom","4px");  

		return join_check_birth_dd = true;

	}else{
		$(".user_birth_confirm").html("※태어난 일을 선택하세요.");
		$(".user_birth_confirm").css("color","red");
		$(".user_birth_confirm").css("display","block");
		$(".user_birth_confirm").css("text-align","left");
		$(".user_birth_confirm").css("font-size","14px");
		$(".user_birth_confirm").css("padding-bottom","4px");

		return join_check_birth_dd = false;

	}
});

//자기소개 유효성 검사
$("#user_tag").on("change",function(){	

   var regExp = /^[\d|가-힣 ]{1,29}$/;

   var result = $("#user_tag").val();

    if(regExp.test(result)){
        $(".user_tag_confirm").html("");
        $(".user_tag_confirm").css("color","green");
        $(".user_tag_confirm").css("display","block");
        $(".user_tag_confirm").css("text-align","left");
        $(".user_tag_confirm").css("font-size","14px");
        $(".user_tag_confirm").css("padding-bottom","4px");

       return join_check_tag = true;

    }else{
        $(".user_tag_confirm").html("한글 두글자 이상 작성해주세요.");
        $(".user_tag_confirm").css("color","red");
        $(".user_tag_confirm").css("display","block");
        $(".user_tag_confirm").css("text-align","left");
        $(".user_tag_confirm").css("font-size","14px");
        $(".user_tag_confirm").css("padding-bottom","4px");

       return join_check_tag = false;

    }
});

//게시물 입력값 유무 확인 함수
function isExistboardValue(){
   
    var user_id=$("#user_id").val();
    var user_email=$("#user_email").val();
    var user_pw=$("#user_pw").val();
    var user_pw2=$("#user_pw2").val();
    var user_name=$("#user_name").val();
    var user_birth=$(".user_birth").val();
    var user_birth_yy= $("#user_birth_yy").val();
    var user_birth_mm= $("#user_birth_mm option:selected").val();
    var user_birth_dd= $("#user_birth_dd option:selected").val();
    var user_tag=$("#user_tag").val();
   
    bir = user_birth_yy + "-" + user_birth_mm + "-" + user_birth_dd;
    
    if( (user_id.length == 0 || user_id == "") || (user_email.length == 0 || user_email == "") ||
        (user_pw.length == 0 || user_pw == "") || (user_pw2.length == 0 || user_pw2 == "") || 
        (user_name.length == 0 || user_name == "") || (user_birth == null ||user_birth == "") ||
        (user_birth_yy == null ||user_birth_yy == "") || (user_birth_mm == null ||user_birth_mm == "") ||
        (user_birth_dd == null ||user_birth_dd == "") || (user_tag == 0 ||user_tag == "")){
       
	   return join_check_exist = false;
       
    }else{
    	
       return join_check_exist = true;
       
    }
}  

var bir = '';

//회원가입 버튼 동작
$("#enter_btn").on("click", function(){
   
    if( join_check_id == true && join_check_id2 == true && 
        join_check_email == true && join_check_pw == true && 
        join_check_pw2 == true && join_check_name == true && 
        join_check_birth_yy == true && 
        join_check_birth_mm == true && join_check_birth_dd == true && 
        join_check_tag == true ){
    	
        frmBoard.append("<input type = 'hidden' name = 'user_birth' value = '" + bir + "'/>");
        frmBoard.attr("action", "${contextPath}/signup/join");
        frmBoard.attr("method", "post");
        frmBoard.submit();
      
        alert("회원가입 성공했습니다!");
   
	}else{
	   
/* 	    alert("user_birth_mm: " + user_birth_mm);
	    alert("user_birth_dd: " + user_birth_dd); */
/* 	    alert($("#user_birth_yy").val(););
	    alert($("#user_birth_mm option:selected").val());
	    alert($("#user_birth_dd option:selected").val()); */
	   
	   /* alert("join_check_birth_dd: " + join_check_birth_dd);
	    alert("join_check_birth: " + join_check_birth); */
      
       /* alert("join_check_id : " + join_check_id);
         alert("join_check_id2 : " + join_check_id2); 
         alert("join_check_email : " + join_check_email); 
         alert("join_check_pw : " + join_check_pw); 
         alert("join_check_pw2 : " + join_check_pw2); 
         alert("join_check_name : " + join_check_name); */ 
       /* alert(join_check_birth_yy + "  " + join_check_birth_dd + "   " + join_check_birth_mm + "   " + join_check_name); */
	    alert("회원가입 실패했습니다. 양식에 맞게 입력해주세요.");
        return "/signup/join";
       
   }
});  

</script>

</body>
</html>
