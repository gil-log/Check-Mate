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
    
    <link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/template/assets/extra-libs/multicheck/multicheck.css">
    <link href="${pageContext.request.contextPath}/resources/template/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/template/assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/checkmateimg/checkmate_logo.png">
    <title>과제제출페이지</title>
    
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/template/assets/libs/flot/css/float-chart.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/template/dist/css/style.min.css" rel="stylesheet">
    <!-- 달력 CSS 추가-->
    
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<style>
#listTable {
cursor:pointer;
}
</style>
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
                <!--과제 list  -->
                <div id="listForm">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title m-b-0">과제</h5>
                            </div>
                            <table class="table" id="listTable" width="100%" cellspacing="0">
                                  <thead class="thead-light">
                                    <tr>
                                      <th>No.</th>
                                      <th>제목</th>
                                      <th>마감일</th>
                                      <th>작성자</th>
                                    </tr>
                                  </thead>
                            </table>
                        </div>
                        </div>
                 </div>
                
                
                <!-- 과제 작성 폼(관리자)-->
            
                <div class="row">
                    <div class="col-md-8 offset-md-2">
                       <div>
                        <div class="card">
                        	<form id="addForm" method="post" enctype="multipart/form-data">
                                <div class="card-body">
                                    <h4 class="card-title">과제등록</h4>
                                    <div class="form-group row">
                                        <label for="h_title" class="col-sm-2 text-right control-label col-form-label">제목</label>
                                        <div class="col-sm-9">
                                           <input type="text" class="form-control" id="h_title" name="h_title" placeholder="제목을 입력하세요.">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="datePicker" class="col-sm-2 text-right control-label col-form-label">마감일</label>
                                        <div class="col-sm-9">
                                            <input type="date" class="form-control" id="h_deadline">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="h_score" class="col-sm-2 text-right control-label col-form-label">배점</label>
                                        <div class="col-sm-9">
                                            <input type="number" class="form-control" id="h_score" placeholder="배점을 입력하세요">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="h_content" class="col-sm-2 text-right control-label col-form-label">과제설명</label>
                                        <div class="col-sm-9">
                                            <textarea class="form-control" rows="6" cols="60" id="h_content" name="h_content" autocomplete="off"></textarea>
                                        </div>
                                    </div>
                                </div><!-- card-body끝 -->
                                <div class="border-top">
                                	<!--  -->
                                    <div class="card-body">
                                        <label for="cono1" class="col-sm-2 text-right control-label col-form-label">첨부파일</label>
                                        <input type="file" name="h_file" id="h_file"/>
                                       <!-- <input type="text" name="src"/> -->
                                    </div>
                                   <!-- -->
                                </div>
                                <button type="submit" class="btn btn-primary" id="addHwactionBtn" onclick="addHwaction();">등록</button>
							    <button type="button" class="btn btn-primary" >목록으로</button>
                      		 </form> 
                        </div><!--div.id card 끝  -->
                    </div><!--div.id addForm 끝  -->
                </div>
             </div>
                
               <div class="col-12">
                 <div style="display:none;">
                 	<input type="number" id="noticeToggle" value="0">
                 </div>
                 <a class="btn btn-success" id="noticeWriteBtn">과제 등록</a>
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
    <script src="${pageContext.request.contextPath}/resources/template/assets/libs/jquery/dist/jquery.form.js"></script>
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
    
    <!-- this page js -->
    <script src="${pageContext.request.contextPath}/resources/template/assets/extra-libs/multicheck/datatable-checkbox-init.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/extra-libs/multicheck/jquery.multicheck.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/extra-libs/DataTables/datatables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    
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
	   	$('#addForm').hide(); 
		$('#noticeWriteBtn').hide();
		
		hwlisttable();
		
		if(${group.g_flag} == 1){
			$('#noticeWriteBtn').show();
		}
		
		
   });
   
   function hwlisttable(){
   	
   	if ( $.fn.DataTable.isDataTable('#listTable') ) {
   		  $('#listTable').DataTable().destroy();
   		}
   
  	 $('#listTable').dataTable({
        pageLength: 10,
        bPaginate: true,
        bLengthChange: true,
        lengthMenu : [ [ 10, 25, 50, -1 ], [ 10, 25, 50, "All" ] ],
        bAutoWidth: false,
        processing: true,
        order: [[2, 'desc']], // asc 또는 desc
        ordering: true,
        serverSide: false,
        searching: true,
        ajax : {
            "url":"homeworkadd",
            "type":"GET",
            "dataType" : "JSON",
            "data": {
           		"h_no" : 0
            }
        },
        columns : [
            {data: "h_no"},
            {
           	 data: "h_title",
           	 render: function(data, type, row, meta){             
                    data = data;
                return data;
           	 }
            },
            {data: "h_deadline"},
            {data: "u_id"}
        ]
    });
  	
  	//테이블 row 선택
     $('#listTable tbody').on('click', 'tr', function() {
    	$('.selected').toggleClass('selected');
        $(this).toggleClass('selected');
        var h_no = $(this).find("td").eq(0).text();
        
        location.href = "homeworkshow?h_no="+h_no;
     
     });
    
   }
   </script>
   
   <script type="text/javascript">
   $('[data-toggle="tooltip"]').tooltip();
   $(".preloader").fadeOut();
   
   $('#noticeWriteBtn').on("click", function() {
   	if($("#noticeToggle").val() == 0){
   		$(this).text("과제 보기");
   		$("#noticeToggle").val(1);
   		$("#addForm").show();
   		$("#listForm").slideUp();
   		$("#addForm").fadeIn();
   	} else {
   		$(this).text("과제 작성");
   		hwlisttable();
   		$("#noticeToggle").val(0);
        $("#addForm").hide();
        $("#listForm").fadeIn();
   	}
   });
 
   
    function addHwaction(){
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

    	
    	fileUpload();
    	
    	const sendVar = new Array(5);
    	
    	sendVar[0] = $('#h_title').val();
    	sendVar[1] = $('#h_deadline').val();
    	sendVar[2] = $('#h_score').val();
    	sendVar[3] = $('#h_content').val();
    	sendVar[4] = $('#h_file').val();
    
    	
    	$.ajax({
    		url : 'homeworkadd',
    		type : 'POST',
    		traditional : true,
    		data : {
    			homework : sendVar //보내고자 하는 data 변수 설정
    		},
    		
    		//Ajax 성공시 호출
    		success : function(msg){
    			alert(msg);
    			
    			$('#noticeWriteBtn').text("과제 등록");
    			$("#noticeToggle").val(0);
    			$('#h_title').val("");
        		$('#h_deadline').val("");
        		$('#h_score').val("");
        		$('#h_content').val("");
        		$('#h_file').val("");
        		$("#addForm").hide();
                $("#listForm").fadeIn();
    			
    		},
    		//Ajax 실패시 호출
            error : function(jqXHR, textStatus, errorThrown){
                console.log("jqXHR : " +jqXHR +"textStatus : " + textStatus + "errorThrown : " + errorThrown);
            }
    	});
    	

		hwlisttable();
    	
    }
    
    function fileUpload(){
    	
    	var formData = new FormData();
    	formData.append('h_file',$('#h_file')[0].files[0]);
    	
    	$.ajax({
    		cache : false,
    		url : 'fileadd',
    		type : 'post', 
    		processData : false,
    		contentType : false,
    		traditional : true,
    		data : formData,
    		success : function(data){
    			
    			$("#h_file").val(data);
    			
    			console.log(data);
    			console.log(checkImageType(data));
    		
    		},
    		error : function(xhr, status){
    			alert(xhr+": "+status+", file error");
    		}
    	});
    }
    
   
 </script>
    
</body>

</html>