<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
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
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/checkmateimg/checkmate_logo.png">
    <title>과제제출페이지</title>
    
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/template/assets/libs/flot/css/float-chart.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/template/dist/css/style.min.css" rel="stylesheet">
    <!-- Custom CSS -->
   <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

</head>

<body>
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
    
		<!-- topbar 여기 경로를 수정해줘야 할 수도 있음.-->
        <%@include file="nav/topbar.jsp"%>
        <!-- topbar end -->

  		<!-- sidebar 여기 경로를 수정해줘야 할 수도 있음.-->
        <%@include file="nav/sidebar.jsp"%>
        <!-- sidebar end -->          
            
    <div class="page-wrapper">
            <!-- Container fluid  본문 내용 부분 -->
            <!-- ============================================================== -->
            <div class="container-fluid">

				<!-- 본문을 여기에 넣기 -->
				<!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                 <!-- 과제설명 폼 -->
                <div class="row">
                    <div class="col-md-8 offset-md-2">
                        <div class="card">
                        	<div id="hwForm">
                            <form class="form-horizontal">
                                <div class="card-body">
                                    <h4 class="card-title">과제</h4>
                                    <div class="form-group row">
                                        <label for="h_title" class="col-sm-2 text-right control-label col-form-label">제목</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" value="${homework.h_title}" readonly>
                                        </div>
                                    </div>
                                   
                                    <div class="form-group row">
                                        <label for="h_date" class="col-sm-2 text-right control-label col-form-label">게시일</label>
                                        <div class="col-sm-9">
                                            <input type="date" class="form-control" value="${homework.h_date}" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="h_deadline" class="col-sm-2 text-right control-label col-form-label">마감일</label>
                                        <div class="col-sm-9">
                                            <input type="date" class="form-control" value="${homework.h_deadline}" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="h_score" class="col-sm-2 text-right control-label col-form-label">배점</label>
                                        <div class="col-sm-9">
                                            <input type="number" class="form-control" value="${homework.h_score}" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="h_content" class="col-sm-2 text-right control-label col-form-label">과제설명</label>
                                        <div class="col-sm-9">
                                            <textarea class="form-control" rows="6" cols="60" readonly>${homework.h_content}</textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="border-top">
                                    <div class="card-body">
                                        <label for="h_file" class="col-sm-2 text-right control-label col-form-label">첨부파일</label>
                                    </div>
                                </div>
                                <button class="btn btn-primary" type="button" id="updateHwBtn" onclick="updateHw();">수정</button>
							    <button class="btn btn-primary" type="button" id="deleteHwBtn" onclick="deleteHw();">삭제</button>
                                
                            </form>
                           </div> 
                        </div>
                       
                    </div>
                    
                </div>
                <!-- 과제제출 폼  h_flag=0-->
                <div class="row">
                    <div class="col-md-8 offset-md-2">
                        <div class="card">
                        	<div id="submitForm">
                            <div class="card-body">
                                <h4 class="card-title">과제제출</h4>
                                <!-- Create the Quill editor container -->
            						<div class="form-group row">
		                            	<label for="fno" class="col-sm-2 text-right control-label col-form-label">번호</label>
		                                <div class="col-sm-9">
		                                	<input type="text" class="form-control" id="sub_no" value="${homework.h_no }">
		                                </div>
		                            </div>
		                            
							    	<div class="form-group row">
		                            	<label for="fname" class="col-sm-2 text-right control-label col-form-label">제목</label>
		                                <div class="col-sm-9">
		                                	<input type="text" class="form-control" id="sub_title" name="h_title" placeholder="Title Input Here">
		                                </div>
		                            </div>
							
							        <div class="form-group row">
							        	<label for="content" class="col-sm-2 text-right control-label col-form-label">내용</label>
							            <div class="col-sm-9">
							            	<textarea rows="4" id="sub_content" name="h_content" placeholder="Content Input Here" class="form-control" autocomplete="off"></textarea>
							            </div>
							        </div>
									<div class="form-group row">
                                    	<label for="file" class="col-sm-2 text-right control-label col-form-label">첨부파일:</label>
                                        <div class="col-sm-9">
                                        	<input type="file" class="form-control" id="sub_file" name="h_file" placeholder="File include Here">
                                        </div>
                                    </div>
							        <button class="btn btn-primary" type="button" id="addSubmitHwBtn" onclick="addSubmitHw();">제출</button>
							        <button class="btn btn-primary" type="button">취소</button>
							    
                            </div>
                           </div>
                        </div>
                    </div>
                </div>
                
                <!-- 과제제출 폼  h_flag=1-->
                <div class="row">
                    <div class="col-md-8 offset-md-2">
                        <div class="card">
                        	<div id="completeForm">
                            <div class="card-body">
                                <h4 class="card-title">과제제출</h4>
                                <!-- Create the Quill editor container -->
            						<div class="form-group row">
		                            	<label for="fno" class="col-sm-2 text-right control-label col-form-label">번호</label>
		                                <div class="col-sm-9">
		                                	<input type="hidden" class="form-control" id="sub_no" value="${homework.h_no }">
		                                </div>
		                            </div>
		                            
							    	<div class="form-group row">
		                            	<label for="fname" class="col-sm-2 text-right control-label col-form-label">제목</label>
		                                <div class="col-sm-9">
		                                	<input type="text" class="form-control" id="completeHtitle" value="${complete.h_title}" readonly>
		                                </div>
		                            </div>
							
							        <div class="form-group row">
							        	<label for="content" class="col-sm-2 text-right control-label col-form-label">내용</label>
							            <div class="col-sm-9">
							            	<textarea rows="4" class="form-control" id="completeHcontent" readonly>${complete.h_content}</textarea>
							            </div>
							        </div>
									<div class="form-group row">
                                    	<label for="file" class="col-sm-2 text-right control-label col-form-label">첨부파일:</label>
                                        <div class="col-sm-9">
                                        	<input type="file" class="form-control" id="completeHfile" >${complete.h_file}
                                        </div>
                                    </div>
							        <button class="btn btn-primary" type="button" id="addSubmitHwBtn" onclick="updateSubmitHw();">수정</button>
							        <button class="btn btn-primary" type="button" onclick="deleteSubmitHw();">삭제</button>
							    
                            </div>
                           </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Page Content -->
                <!-- ============================================================== -->
              

			</div>
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer text-center">
                All Rights Reserved by Matrix-admin. Designed and Developed by <a href="https://wrappixel.com">WrapPixel</a>.
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="${pageContext.request.contextPath}/resources/template/assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/template/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <script src="${pageContext.request.contextPath}/resources/template/dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="${pageContext.request.contextPath}/resources/template/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/template/dist/js/custom.min.js"></script>
    <!--This page JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/template/dist/js/pages/dashboards/dashboard1.js"></script>
    <!-- Charts js Files -->
    <script src="${pageContext.request.contextPath}/resources/template/assets/libs/flot/excanvas.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/libs/flot/jquery.flot.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/libs/flot/jquery.flot.pie.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/libs/flot/jquery.flot.time.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/libs/flot/jquery.flot.stack.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/libs/flot/jquery.flot.crosshair.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/libs/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/dist/js/pages/chart/chart-page-init.js"></script>
   
   	<script type="text/javascript">
   	
		$(document).ready(function(){
			
			$("#hwForm").show(); //과제 상세 폼 
			$("#updateHwBtn").hide(); //과제 상세 폼 
			$("#deleteHwBtn").hide(); //과제 상세 폼 
			
			if(${group.g_flag} == 1){ //관리자일 경우
				$('#updateHwBtn').show();
				$('#deleteHwBtn').show();
			}
			
			if(${myHwCount} == 1){ //숙제제출했으면, h_flag = 1
				$('#submitForm').hide();
				$('#completeForm').show();
			}else{
				$('#submitForm').show();
				$('#completeForm').hide();
			}
			
	  	 });
		
   		function addSubmitHw(){
   			if($('#h_title').val()==""){
   	    		alert("제목을 입력해주세요.");
   	    		$('#h_title').focus();
   	    		return false;
   	    	}
   	    	if($('#h_content').val()==""){
   	    		alert("내용을 입력해주세요.");
   	    		$('#h_content').focus();
   	    		return false;
   	    	}
   	    	
   	    	const sendVar = new Array(4);
   	    	sendVar[0] = $('#sub_title').val();
   	    	sendVar[1] = $('#sub_content').val();
   	    	sendVar[2] = $('#sub_file').val();
   	    	sendVar[3] = $('#sub_no').val();
   	    	
   	    	
   	    	$.ajax({
   	    		url : 'homeworkshow',
   	    		type : 'POST',
   	    		traditional : true,
   	    		data : {
   	    			homework : sendVar //보내고자 하는 data 변수 설정
   	    		},
   	    		
   	    		//Ajax 성공시 호출
   	    		success : function(msg){
   	    			
   	    			$('#sub_title').val("");
   	        		$('#sub_content').val("");
   	        		$('#sub_file').val("");
   	        	
   	        		$("#submitForm").hide();
   	        		
   	        		
   	        		$('#completeHtitle').val(sendVar[0]);
   	        		$('#completeHcontent').val(sendVar[1]);
   	        		$('#completeHfile').val(sendVar[2]);
   	        		
   	        		
   	        		
   	        		$("#completeForm").show();
   	    			
   	    		},
   	    		//Ajax 실패시 호출
   	            error : function(jqXHR, textStatus, errorThrown){
   	                console.log("jqXHR : " +jqXHR +"textStatus : " + textStatus + "errorThrown : " + errorThrown);
   	            }
   	    	});
   		}
   		
   		//그룹장이 과제 삭제
   		function deleteHw() {
   			var h_no = ${homework.h_no};
   	        $.ajax({
   	            url : 'homeworkadd',                    // 전송 URL
   	            type : 'DELETE',                // GET or POST 방식
   	            traditional : true,
   	            data : {
   	                h_no : h_no,        // 보내고자 하는 data 변수 설정
   	                h_flag : 0
   	            },
   	            
   	            //Ajax 성공시 호출 
   	            success : function(msg){
   	            	alert(msg);
   	            	location.href = "homeworklist"; 
   	            },
   	         
   	            //Ajax 실패시 호출
   	            error : function(jqXHR, textStatus, errorThrown){
   	                console.log("jqXHR : " +jqXHR +"textStatus : " + textStatus + "errorThrown : " + errorThrown);
   	            }
   	        });
   	    }

   		//그룹장이 과제 삭제
   		function deleteSubmitHw() {
   			var h_no = ${homework.h_no};
   	        $.ajax({
   	            url : 'homeworkadd',                    // 전송 URL
   	            type : 'DELETE',                // GET or POST 방식
   	            traditional : true,
   	            data : {
   	                h_no : h_no,        // 보내고자 하는 data 변수 설정
   	                h_flag : 1
   	            },
   	            
   	            //Ajax 성공시 호출 
   	            success : function(msg){
   	            	alert(msg);
   	            	location.href = "homeworklist"; 
   	            },
   	         
   	            //Ajax 실패시 호출
   	            error : function(jqXHR, textStatus, errorThrown){
   	                console.log("jqXHR : " +jqXHR +"textStatus : " + textStatus + "errorThrown : " + errorThrown);
   	            }
   	        });
   	    }
   	
   	</script>
   
    
</body>
</html>