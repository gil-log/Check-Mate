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
    <title>Check&Mate - </title>
    
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/template/assets/libs/flot/css/float-chart.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/template/dist/css/style.min.css" rel="stylesheet">
 
 	<!-- thispage css -->
 	<link href="${pageContext.request.contextPath}/resources/template/assets/libs/magnific-popup/dist/magnific-popup.css" rel="stylesheet">
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



                <div style="float: right;">
                					<button type="button" class="btn btn-success margin-5" style="float: right; background-color: #c12a2a;
    border-color: #c12a2a; margin-right:10px;" onclick="deleteHw();">숙제삭제</button>
                </div>
                
				<!-- 본문을 여기에 넣기 -->
                <div class="row el-element-overlay">
                
                
                <c:forEach items="${hwCompleteList}" var="hwComplete">
                    <div class="col-lg-3 col-md-6">
                        <div class="card">
                            <div class="el-card-item">
                                <div class="el-card-avatar el-overlay-1"> <img src="${pageContext.request.contextPath}/resources/template/assets/images/big/img1.jpg" alt="user" />
                                    <div class="el-overlay">
                                        <ul class="list-style-none el-info">
                                            <li class="el-item"><a class="btn default btn-outline el-link" data-toggle="modal" data-target="#Modal1" data-hno="${hwComplete.h_no}" data-uid="${hwComplete.u_id}" onclick="hwView(this);"><i class="mdi mdi-link"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="el-card-content">
                                    <h4 class="m-b-0">${hwComplete.h_title}</h4> <span class="text-muted">${hwComplete.u_id}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>    
                    
                    
                    
                 <div class="modal fade" id="Modal1" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalLabel" aria-hidden="true ">
					<div class="modal-dialog" role="document ">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">과제</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true ">&times;</span>
								</button>
							</div>
							
							
							
							
							
							   <div class="card-body">
                                    <div class="form-group row">
                                        <label for="h_title" class="col-sm-2 text-right control-label col-form-label">제목</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id = "modalTitle" value="" readonly>
                                        </div>
                                    </div>
                                   
                                    <div class="form-group row">
                                        <label for="h_date" class="col-sm-2 text-right control-label col-form-label">제출일</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id = "modalDate" value="" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="h_score" class="col-sm-2 text-right control-label col-form-label">배점</label>
                                        <div class="col-sm-9">
                                            <input type="number" class="form-control" id= "modalScore" value="" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="h_content" class="col-sm-2 text-right control-label col-form-label">과제설명</label>
                                        <div class="col-sm-9">
                                            <textarea class="form-control" rows="6" id="modalContent" cols="60" readonly></textarea>
                                        </div>
                                    </div>
                                    
                                    
                                    <div class="form-group row">
                                    
                                    
                                    	<form id="frm" action="fileDown" method="post" enctype="multipart/form-data">
                                			<input type="hidden" id = "fileFrm" name="fileName" value="">
                                		</form>
                                        <div class="col-sm-9">
                                        
                                        <label for="fileA" class="col-sm-2 text-right control-label col-form-label">첨부파일</label>
                                        <a href="#" id="fileA" onclick="document.getElementById('frm').submit();"></a>
                                        
                                        </div>
                                    </div>
                                </div>
							
							
							
							
							
							
							
							
							
							
							

                            
                            
							<!-- <div class="modal-body">Here is the text coming you can put
								also image if you want…</div> -->
						</div>
					</div>
				</div>
                    
                    
                    
                    

   
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                </div>
                

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

	<!-- this page js -->
    <script src="${pageContext.request.contextPath}/resources/template/assets/libs/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/libs/magnific-popup/meg.init.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/template/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/extra-libs/sparkline/sparkline.js"></script>

	<script>
		function hwView(thisVal){

			var h_no = $(thisVal).data("hno");

			var u_id = $(thisVal).data("uid");

 
 		       $.ajax({
		           url : "homework",
		           type: "GET",
		           traditional : true,
		           data : {
			           h_no : h_no,
			           u_id : u_id
			           },
		           success : function(data){

		        	   $("#modalTitle").val(data.hwView.h_title);
		        	   $("#modalDate").val(data.hwView.h_date);
		        	   $("#modalScore").val(data.hwView.h_score);
		        	   $("#modalContent").val(data.hwView.h_content);
		        	   $("#fileFrm").val(data.hwView.h_file);
		        	   $("#fileA").text(data.hwView.h_file);
		             
		           }, error: function(request, status, error){
		              alert("통신실패");
		           }
		        });
			}


   		//그룹장이 과제 삭제
   		function deleteHw() {
   			var h_no = ${hwCompleteList[0].h_no};
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
	</script>
</body>

</html>