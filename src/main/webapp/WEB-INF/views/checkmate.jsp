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

/* 
	$("#submit-r").on("click", function(){
		window.alert("회원가입에 성공 하였습니다!");
		    
		window.close();
		});
	 */
});
</script>

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
                        <span class="db"><img src="${pageContext.request.contextPath}/resources/checkmateimg/logo.png" height="200" width="200" alt="logo" /></span>
                    </div>
                    <!-- Form -->
                    <form class="form-horizontal m-t-20" id="loginform" method="post" action="loginok">  <!--경로 로그인 성공시 group으로 가고싶은데 redirect가 안됨..우선 임시로 이걸그냥 group로 원래logincheck로 하고싶음  -->
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
                        </div>
                    </c:if>
                    <c:if test="${user != null }">
						<div>
						<h3>${user.u_id}님 방문을 환영 합니다.</h3>
						<button id="logoutBtn" type="button">로그아웃</button>
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
                    <form class="form-horizontal m-t-20" method="post" action="register">
                        <div class="row p-b-30">
                            <div class="col-12">
                            	<div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text bg-success text-white"><i class="ti-user"></i></span>
                                    </div>
                                    <input type="text" name="u_id" class="form-control form-control-lg" id="uid" placeholder="아이디" required>
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
                                    <input type="text" name="u_name" class="form-control form-control-lg" id="uname" placeholder="이름" required>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text bg-danger text-white"><i class="ti-email"></i></span>
                                    </div>
                                    <input type="text" name="u_email" class="form-control form-control-lg" id="uemail" placeholder="이메일 주소" required>
                                </div>
                            </div>
                        </div>
                            
                            <div class="row m-t-20 p-t-20 border-top border-secondary">
                                <div class="col-12">
                                    <a class="btn btn-success" href="#" id="to-login" name="action">돌아가기</a>
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
        
        $("#registerform").hide();
        $("#loginform").fadeIn();
    });
    $("#logoutBtn").on("click", function(){
		location.href="logout";
	});
    </script>

</body>

</html>