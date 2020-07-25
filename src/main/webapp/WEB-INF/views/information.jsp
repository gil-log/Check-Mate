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
    
    
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/checkmateimg/checkmate_logo.png">
    <title>Check&Mate</title>
    
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/template/assets/libs/flot/css/float-chart.css" rel="stylesheet">
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/template/assets/extra-libs/multicheck/multicheck.css">
    <link href="${pageContext.request.contextPath}/resources/template/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/template/assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/template/dist/css/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<style>
.selected {
	background-color: gainsboro;
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
            	<div id="listForm">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title m-b-0">공지사항</h5>
                            </div>
                            <table class="table" id="listTable" width="100%" cellspacing="0">
                                  <thead class="thead-light">
                                    <tr>
                                      <th>No.</th>
                                      <th>제목</th>
                                      <th>작성일</th>
                                      <th>작성자</th>
                                    </tr>
                                  </thead>
                            </table>
                        </div>
                        </div>
                 </div>
                 
                 <div id="plusForm">
                 
                        <div class="card">
                            <form class="form-horizontal">
                                <div class="card-body">
                                    <h4 class="card-title">공지사항 작성</h4>
                                    <div class="form-group row">
                                        <label for="n_title" class="col-sm-3 text-right control-label col-form-label">공지 제목</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="n_title" placeholder="제목">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="cono1" class="col-sm-3 text-right control-label col-form-label">공지 내용</label>
                                        <div class="col-sm-6">
                                            <textarea class="form-control" id="n_content"></textarea>
                                        </div>
                                    </div>
                                
                                </div>
                                <div class="border-top">
                                    <div class="card-body">
                                        <button type="button" class="btn btn-primary" id ="addNoticeBtn" onclick="addNotice();">작성</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                 
                 </div>
               	
                 <div class="col-12">
                 <div style="display:none;">
                 	<input type="number" id="noticeToggle" value="0">
                 </div>
                 <a class="btn btn-success" href="#" id="noticeWriteBtn">공지 작성</a>
                 </div>
                 

                                                        
                <!-- Modal Add Category -->
                <div class="modal fade none-border" id="noticeModal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title"><strong><a id="modal_n_no">1</a>. <a id="modal_n_title">공지 제목</a></strong></h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label class="control-label">공지 내용</label>
                                            <textarea class="form-control form-white" id="modal_n_content" readonly>여기에 내용 들어갈겅미</textarea>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger waves-effect waves-light save-category" id="modalDel" onclick="noticeDelete();">삭제</button>
                                <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">닫기</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END MODAL -->
                
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

        $("#plusForm").hide();
		$('#noticeWriteBtn').hide();
		$('#modalDel').hide();
		
    	listtable();
      
		if(${group.g_flag} == 1){
			$('#modalDel').show();
			$('#noticeWriteBtn').show();
		}

    });
    
    function listtable(){
    	
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
             "url":"notice",
             "type":"GET",
             "dataType" : "JSON",
             "data": {
            	"n_no" : 0
             }
         },
         columns : [
             {data: "n_no"},
             {
            	 data: "n_title",
            	 render: function(data, type, row, meta){             
                     data = data;
                 return data;
            	 }
             },
             {data: "n_date"},
             {data: "u_id"}
         ]
     });
   	 
     //테이블 row 선택
     $('#listTable tbody').on('click', 'tr', function() {
    	$('.selected').toggleClass('selected');
        $(this).toggleClass('selected');

        var n_no = $(this).find("td").eq(0).text();

        $("#modal_n_no").text(n_no);
        
        $.ajax({
            url : 'notice',                    // 전송 URL
            type : 'GET',                // GET or POST 방식
            traditional : true,
            data : {
                n_no : n_no        // 보내고자 하는 data 변수 설정
            },
            
            //Ajax 성공시 호출 
            success : function(d){
                
        		$("#modal_n_no").text(d.n_no);
        		$("#modal_n_title").text(d.n_title);
        		$("#modal_n_content").text(d.n_content);

                $('#noticeModal').modal();
            },
         
            //Ajax 실패시 호출
            error : function(jqXHR, textStatus, errorThrown){
                console.log("jqXHR : " +jqXHR +"textStatus : " + textStatus + "errorThrown : " + errorThrown);
            }
        });
     });
     
    }

    </script>
    
    <script type="text/javascript">
    $('[data-toggle="tooltip"]').tooltip();
    $(".preloader").fadeOut();
    
    $('#noticeWriteBtn').on("click", function() {
    	if($("#noticeToggle").val() == 0){
    		$(this).text("공지 보기");
    		$("#noticeToggle").val(1);
    		$("#plusForm").show();
    		$("#listForm").slideUp();
    		$("#plusForm").fadeIn();
    	} else {
    		$(this).text("공지 작성");
        	listtable();
    		$("#noticeToggle").val(0);
            $("#plusForm").hide();
            $("#listForm").fadeIn();
    	}
    });
    

    function addNotice() {
    	
		if($("#n_title").val()==""){
			alert("제목을 입력해주세요.");
			$("#n_title").focus();
			return false;
		}
		if($("#n_content").val()==""){
			alert("내용을 입력해주세요.");
			$("#n_content").focus();
			return false;
		}
    	
        const sendVar = new Array(2);
        
        sendVar[0] = $("#n_title").val();
        sendVar[1] = $("#n_content").val();

        $.ajax({
            url : 'notice',                    // 전송 URL
            type : 'POST',                // GET or POST 방식
            traditional : true,
            data : {
                notice : sendVar        // 보내고자 하는 data 변수 설정
            },
            
            //Ajax 성공시 호출 
            success : function(msg){
            	alert(msg);
        		$('#noticeWriteBtn').text("공지 작성");
            	listtable();
        		$("#noticeToggle").val(0);
        		$("#n_title").val("");
        		$("#n_content").val("");
                $("#plusForm").hide();
                $("#listForm").fadeIn();
            },
         
            //Ajax 실패시 호출
            error : function(jqXHR, textStatus, errorThrown){
                console.log("jqXHR : " +jqXHR +"textStatus : " + textStatus + "errorThrown : " + errorThrown);
            }
        });
    }

    function noticeDelete() {
		var n_no = $("#modal_n_no").text();

        $.ajax({
            url : 'notice',                    // 전송 URL
            type : 'DELETE',                // GET or POST 방식
            traditional : true,
            data : {
                n_no : n_no        // 보내고자 하는 data 변수 설정
            },
            
            //Ajax 성공시 호출 
            success : function(msg){
            	alert(msg);
            	listtable();
            	$('#noticeModal').modal("hide"); //닫기 
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