<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html dir="ltr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/checkmateimg/favicon.png">
    <title>Check&Mate</title>
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/template/dist/css/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
/* 
$(function(){
	//아이디 중복체크
	    $('#u_id').blur(function(){
	        $.ajax({
		     type:"POST",
		     url:"/checkSignup",
		     data:{
		            "u_id":$('#u_id').val()
		     },
		     success:function(data){	//data : checkSignup에서 넘겨준 결과값
		            if($.trim(data)=="YES"){
		               if($('#u_id').val()!=''){ 
		               	alert("사용가능한 아이디입니다.");
		               }
		           	}else{
		               if($('#u_id').val()!=''){
		                  alert("중복된 아이디입니다.");
		                  $('#u_id').val('');
		                  $('#u_id').focus();
		               }
		            }
		         }
		    }) 
	     })
	});
 */
$(function(){ 
	$("#alert-success").hide(); 
	$("#alert-danger").hide(); 
	$("input").keyup(function(){ 
		var pwd1=$("#upwd").val(); 
		var pwd2=$("#pwdchk").val(); 
		 console.log(pwd1);
		 console.log(pwd2);
		if(pwd1 != "" || pwd2 != ""){ 
			if(pwd1 == pwd2){ 
				$("#alert-success").show();
				$("#alert-danger").hide(); 
				$("#submit-r").removeAttr("disabled");
			}else{
				$("#alert-success").hide();
				$("#alert-danger").show();
				$("#submit-r").attr("disabled", "disabled");	
			}
		}
	});
});
</script>

<style>
.btnss {
    -webkit-box-flex: 1;
    -ms-flex: 1 1 auto;
    flex: 1 1 auto;
    padding: 4.25rem;
}
</style>
</head>

<body>
    <div class="main-wrapper">
        <!-- ============================================================== -->
        <!-- Preloader - style you can find in spinners.css -->
        <!-- ============================================================== -->
        <div class="preloader">
            <div class="lds-ripple">
                <div class="lds-pos"></div>
                <div class="lds-pos"></div>
                <div class="lds-pos"></div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- Preloader - style you can find in spinners.css -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Login box.scss -->
        <!-- ============================================================== -->
        <div class="auth-wrapper d-flex no-block justify-content-center align-items-center bg-dark">
            <div class="auth-box bg-dark border-top border-secondary">
                <div id="loginform">
                    <div class="text-center p-t-20 p-b-20">
                        <span class="db"><img src="${pageContext.request.contextPath}/resources/checkmateimg/logo_transparent.png" height="200" width="200" alt="logo" /></span>
                    </div>
                    <!-- Form -->
                    <form class="form-horizontal m-t-20" id="loginform" method="post" action="loginok">
                    <c:if test="${user == null}">
                        <div class="row p-b-30">
                            <div class="col-12">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text bg-success text-white"><i class="ti-user"></i></span>
                                    </div>
                                    <input type="text" name="u_id" class="form-control form-control-lg" id="u_id" placeholder="아이디" required>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text bg-warning text-white"><i class="ti-pencil"></i></span>
                                    </div>
                                    <input type="password" name="u_pwd" class="form-control form-control-lg" id="u_pwd" placeholder="비밀번호" required>
                                </div>
                            </div>
                        </div> 
                        <div class="row border-top border-secondary">
                            <div class="col-12">
                                <div class="form-group">
                                    <div class="p-t-20">
                                        <button class="btn btn-danger" id="to-register" type="button"><i class="fa fa-user-plus m-r-5"></i> 회원가입</button>
                                        <button class="btn btn-success float-right" name = "submit" id = "submit" type="submit">로그인</button>
                                    </div>
                                </div>
                            </div>
                            
                            
                            <!-- 소셜 로그인 -->
                             <div>
                                <!-- 네이버 로그인 창으로 이동 -->
                                <div id="naver_id_login" style="text-align:center">
                                <a href="${url}">
                                <img width="380" height="76" src="${pageContext.request.contextPath}/resources/checkmateimg/naverlogin.png"/>
                                </a>
                                </div>
                                
                                <!-- 카카오 로그인 창으로 이동 -->
                                <div id="kakao_id_login" style="text-align:center">
                                        <a href="https://kauth.kakao.com/oauth/authorize?client_id=5a5993ff472f844911315cfb05709f5a&redirect_uri=http://localhost:8080/kcallback&response_type=code">
                                        <img width="380" height="76" src="${pageContext.request.contextPath}/resources/checkmateimg/kakaologin.png">
                                        </a>
                                </div>
                             </div>
                            
                            
                            
                        </div>
                    </c:if>
                    <c:if test="${user != null }">
                    
                      <div>
            			<div style="text-align: center;">
            				<h3 style="color: #D1BA09;">${user.u_id}님 방문을 환영 합니다.</h3>
            			</div>
            			<div class="btnss">
            				<button class="btn btn-success"
            				id="groupBtn" type="button"><i class="fa fa-chess m-r-5"></i> 그룹선택</button>
                        	<button class="btn btn-danger"
                        	id="logoutBtn" type="button"><i class="fa fa-lock-open m-r-5"></i> 로그아웃</button>               
                        </div>
                                    
            		</div>
                    
                    
					</c:if> 
					
					   <%-- <!-- 로그인에 실패할경우  -->
                      <c:if test="${msg == false}">               
                       <div >
                         <p style="color: red;">가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.</p>
                       </div>
                      </c:if> --%>
					                   
                    </form>
                </div>
                <div id="registerform">
                    <div class="text-center">
                        <span class="text-white">Check & Mate의 새로운 Mate가 되어 보세요!</span>
                    </div>
                    <div class="row m-t-20">
                        <!-- Form -->
                    <form class="form-horizontal m-t-20" style="margin:auto;" method="post" action="register" id="regFrom">
                        <div class="row p-b-30">
                            <div class="col-12">
                            	<div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text bg-success text-white"><i class="ti-user"></i></span>
                                    </div>
                                    <input type="text" name="u_id" class="form-control form-control-lg" id="u_id" placeholder="아이디" required>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text bg-warning text-white" ><i class="ti-pencil"></i></span>
                                    </div>
                                    <input type="password" name="u_pwd" class="form-control form-control-lg" id="upwd" placeholder="비밀번호" required>
                                </div>
                                <div class="input-group mb-3" id="check">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text bg-info text-white" ><i class="ti-pencil"></i></span>
                                    </div>
                                    <input type="password" class="form-control form-control-lg" id="pwdchk" placeholder="비밀번호 확인" required>
                                </div>
                                <div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div> 
                                <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text bg-success text-white"><i class="ti-user"></i></span>
                                    </div>
                                    <input type="text" name="u_name" class="form-control form-control-lg" id="u_name" placeholder="이름" required>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text bg-danger text-white"><i class="ti-email"></i></span>
                                    </div>
                                    <input type="text" name="u_email" class="form-control form-control-lg" id="u_email" placeholder="이메일 주소" required>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text bg-dark text-white"><i class="ti-email"></i></span>
                                    </div>
                                    <input type="text" class="form-control form-control-lg" id="u_email_auth" placeholder="메일 인증 번호" required>

                                </div>
                                
                                    <div class="text-center text-white" id="mailAuthMessage">
                        				<span class="text-white" ></span>
                    				</div>
                    			
                            </div>
                        </div>
                            
                            <div class="row m-t-20 p-t-20 border-top border-secondary">
                            
                                
                                <div class="col-12">
                                    <a class="btn btn-success" href="#" id="to-login" name="action">돌아가기</a>
                                    <button class="btn btn-info float-right" type="button" id = "mailAuthBtn" value="0">인증메일발송</button>
                                    <button class="btn btn-info float-right" type="submit" name = "submit" id = "submit-r" >회원가입</button>
                                </div>
                            </div>
                    </form>
                        

                    </div>
                </div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- Login box.scss -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper scss in scafholding.scss -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper scss in scafholding.scss -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Right Sidebar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Right Sidebar -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- All Required js -->
    <!-- ============================================================== -->
    <script src="${pageContext.request.contextPath}/resources/template/assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/template/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- ============================================================== -->
    <!-- This page plugin js -->
    <!-- ============================================================== -->
    <script>
    
    //이메일 인증 시작
    $('#submit-r').hide();
    
	$("#mailAuthBtn").on("click", function(){
		if($('#mailAuthBtn').val() == 0){

			
			
			  
			  var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			   if (exptext.test($('#u_email').val())!=true){
			   alert('이메일 형식이 올바르지 않습니다.');
			   $('#u_email').focus();
			   var bol = true;
				  return bol;
			   }


			
			
			
			
			
			if($('#u_email').val())
			
				
				
				
				
				
			$(this).val(1);
			$('#mailAuthMessage').text("인증 메일이 발송되었습니다!");
			$(this).text("인증하기");
			
			
			var u_mail = $('#u_email').val();
			
			const send = new Array(3);
			
			send[0] = u_mail;
			send[1] = 0;
			send[2] = 0; //처음 메일 주소 보내는 방식에서는 0으로 인식
	        $.ajax({
	            url : 'mailAuth',                    // 전송 URL
	            type : 'POST',                // GET or POST 방식
	            traditional : true,
	            data : {
	            	data : send
	            },
	            //Ajax 성공시 호출 
	            success : function(d){

	                
	            },
	         
	            //Ajax 실패시 호출
	            error : function(jqXHR, textStatus, errorThrown){
	                console.log("jqXHR : " +jqXHR +"textStatus : " + textStatus + "errorThrown : " + errorThrown);
	            }
	        });
			
			return true;
			
		} else if ($('#mailAuthBtn').val() == 1){
			
			var u_mail = $('#u_email').val();
			var ran = $('#u_email_auth').val();
			
			const send = new Array(3);
			
			send[0] = u_mail;
			send[1] = ran;
			send[2] = 1; //처음 메일 주소 보내는 방식에서는 0으로 인식
	        $.ajax({
	            url : 'mailAuth',                    // 전송 URL
	            type : 'POST',                // GET or POST 방식
	            traditional : true,
	            data : {
	            	data : send
	            },
	            //Ajax 성공시 호출 
	            success : function(d){
	            	if(d==0){
	        			$('#mailAuthMessage').text("인증에 성공 하였습니다!");
	        			$('#mailAuthBtn').hide();
	        		    $('#submit-r').show();
	            	} else if(d==1){
	        			$('#mailAuthMessage').text("인증에 실패 하였습니다. 인증 번호를 확인해주세요.");
	            	}
	            },
	         
	            //Ajax 실패시 호출
	            error : function(jqXHR, textStatus, errorThrown){
	                console.log("jqXHR : " +jqXHR +"textStatus : " + textStatus + "errorThrown : " + errorThrown);
	            }
	        });
			
		}
    });

    
    
    
    //이메일 인증 끝
    
    $('[data-toggle="tooltip"]').tooltip();
    $(".preloader").fadeOut();
    $("#registerform").hide();
    // ============================================================== 
    // Login and Recover Password 
    // ============================================================== 
    $('#to-register').on("click", function() {
        $("#loginform").slideUp();
        $("#registerform").fadeIn();
    });
    $('#to-login').click(function(){
        
    	//이메일 인증 부분
    	
    	$('#mailAuthBtn').val(0);
    	$('#u_email').val('');
		$('#mailAuthMessage').text("");
		$('#mailAuthBtn').text("인증메일발송");
    	
    	//때문에 추가 한거 끝
    	
        $("#registerform").hide();
        $("#loginform").fadeIn();
    });
    $("#logoutBtn").on("click", function(){
		location.href="logout";
	});
    $("#groupBtn").on("click", function(){
		location.href="group";
	});
    </script>

</body>

</html>