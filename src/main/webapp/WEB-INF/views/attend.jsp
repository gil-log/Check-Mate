<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
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
<link rel="icon" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/resources/checkmateimg/checkmate_logo.png">
<title>Check&Mate -</title>

<!-- Custom CSS -->
<link
	href="${pageContext.request.contextPath}/resources/template/assets/libs/flot/css/float-chart.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link
	href="${pageContext.request.contextPath}/resources/template/dist/css/style.min.css"
	rel="stylesheet">
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
	
				<!-- icon box 시작 -->
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<div class="row">
									<h4 class="card-title m-b-0">출석</h4>
									<div class="ml-auto">
										<div class="tetx-right">
	
											
											<!-- 관리자인 경우 시작 -->
											<c:if test="${g_flag eq 1}">	
											
												<!-- dropdown 추가 시작 -->
												<a class="nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic"
													href="" data-toggle="dropdown" aria-haspopup="true"
													aria-expanded="false"> 
													<i class="fa fa-plus w-30px m-t-5" id="attend-switch" ></i>
												</a>
												<!-- dropdown 추가 끝 -->
											
											</c:if>	
											<!-- 관리자인 경우 끝 -->
												
												
										</div>
									</div>
								</div>
							</div>
								
							<!-- dropdown 추가 시작 -->
											
							<div id ="makeAttend" style="display:none">
								<h7 class="card-title m-b-0">시간 설정</h7>

								<form id="attendMake" >
									<select id="timer" class="dropdown-item" name = "time">
										<option value="3">3분 후</option>
										<option value="5">5분 후</option>
										<option value="10">10분 후</option>
									</select>
									<div class="dropdown-item">
										<input type = "reset" class="btn btn-sm btn-rounded" value="초기화"> 
										<input type="button" class="btn btn-sm btn-success btn-rounded" onclick="attendMake()" value="설정">
									</div>
								</form>
							</div>
							<!-- dropdown 추가 끝 -->
	
							<!-- 출석현황 네모박스 출력 시작 -->
							<div class="row" id="attendBox">
							</div>
						</div>
					</div>
				</div>
				<!-- icon박스 끝 -->
				
				
				

			<!-- 본문을 여기에 넣기 -->
			<div> ㅎㅇㅎㅇ </div>
			<div> ${g_flag} </div>

			<!-- 관리자용 출석관리 modal 시작-->
            <div class="modal fade none-border" id="noticeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                       	<form class="form-horizontal" id="attendManage">
                       		<div class="modal-header">
                           		<h4 class="modal-title"><strong><a id="modal_a_date">출석 날짜 (a_date)</a></strong></h4>
                            	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        	</div>
                        	<div class="modal-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <table class="table" id="listTable" width="100%" cellspacing="0">
			                                <thead class="thead-light">
			                                    <tr>
			                                      	<th>이름</th>
			                                      	<th>출석여부</th>
			                                      	<th>출석수정</th>
		                                    	</tr>
			                                </thead>
			                                <tbody id = "tbody">
			                                </tbody>
			                            </table>
                                    </div>
                                </div>
		                        <div class="modal-footer">
		                            <button type="button" class="btn btn-success waves-effect waves-light save-category" onclick="attendManage()"> 저장 </button>
		                            <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">닫기</button>
		                        </div>
                       		</div>
                    	</form>
                    </div>
                </div>
            </div>
            <!-- 관리자용 출석관리 modal 끝 -->





		</div>
		<!-- footer -->
		<!-- ============================================================== -->
		<footer class="footer text-center">
			All Rights Reserved by Matrix-admin. Designed and Developed by <a
				href="https://wrappixel.com">WrapPixel</a>.
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
	<script
		src="${pageContext.request.contextPath}/resources/template/assets/libs/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/template/assets/libs/popper.js/dist/umd/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/assets/extra-libs/sparkline/sparkline.js"></script>
	<!--Wave Effects -->
	<script
		src="${pageContext.request.contextPath}/resources/template/dist/js/waves.js"></script>
	<!--Menu sidebar -->
	<script
		src="${pageContext.request.contextPath}/resources/template/dist/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/template/dist/js/custom.min.js"></script>
	<!--This page JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/template/dist/js/pages/dashboards/dashboard1.js"></script>
	<!-- Charts js Files -->
	<script
		src="${pageContext.request.contextPath}/resources/template/assets/libs/flot/excanvas.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/assets/libs/flot/jquery.flot.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/assets/libs/flot/jquery.flot.pie.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/assets/libs/flot/jquery.flot.time.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/assets/libs/flot/jquery.flot.stack.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/assets/libs/flot/jquery.flot.crosshair.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/assets/libs/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/dist/js/pages/chart/chart-page-init.js"></script>
	
	
	<!-- 팝업 동작 -->
	<script type="text/javascript">
	 var toggle = false;
	 
	 $('#attend-switch').on("click", function() {
		toggle = !toggle;
		if(toggle){
			alert("출석생성 ON");
 			$("#makeAttend").slideDown();
	 	}
	 	else{
	 		$("#makeAttend").slideUp();
		}
	 });
	</script>
	
	
	
	<!-- 출석 리스트 화면 출력 -->
	<script type="text/javascript">
		$(document).ready(function() {
			attendUpdate();
			$('#modalDel').hide();
		});
		//attend에 들어왔을 때 시간비교 후 출석현황 update
		function attendUpdate(){
			$.ajax({
				url : 'attendUpdate', // 전송 URL
				type : 'GET', // GET or POST 방식
				traditional : true,
			
				//Ajax 성공시 호출 
				success : function() {
					attendList();
				},
				//Ajax 실패시 호출
				error : function(request, status, error){
					alert("오류가 발생하였습니다.");
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}
		function attendList(){
			$.ajax({
				url : 'attendList', // 전송 URL
				type : 'get', // GET or POST 방식
				traditional : true,
				dataType : "JSON", 
				//Ajax 성공시 호출 
				success : function(data) {
					var htmls = "";
					
					$(data).each(function(){
						if(${g_flag} == 1){
							if(this.a_flag == 0){
								htmls += "<div class='col-md-6 col-lg-2 col-xlg-3'>";
								htmls += "<div class='card card-hover'>";
								htmls += "<div class='box bg-cyan text-center'>";
								htmls += "<h1 class='font-light text-white'>";
								htmls += "<i class='mdi mdi-calendar-check'>";
								htmls += "</i>";
								htmls += "</h1>";
								htmls += "<h6 class='text-white'>";
								htmls += this.a_date;
								htmls += "</h6>";
								htmls += "<h6 class='text-white'>";
								htmls += "출석 중";
								htmls += "</h6>";
								htmls += "</div>";
								htmls += "</div>";
								htmls += "</div>";
		 					}
							else{
								htmls += "<div class='col-md-6 col-lg-2 col-xlg-3'>";
								htmls += "<div class='card card-hover'>";
								
								htmls += "<div class='box bg-danger text-center' onClick = 'attendDetail(\"";
								htmls += this.a_date;
							 	htmls += "\")' >";
							
								htmls += "<h1 class='font-light text-white'>";
								htmls += "<i class='mdi mdi-calendar-check'>";
								htmls += "</i>";
								htmls += "</h1>";
								htmls += "<h6 class='text-white'>";
								htmls += this.a_date;
								htmls += "</h6>";
								htmls += "<h6 class='text-white'>";
								htmls += "출석 마감";
								htmls += "</h6>";
								htmls += "</div>";
								htmls += "</div>";
								htmls += "</div>";
							}
						}
						else{
							if(this.a_flag==0){
								htmls += "<div class='col-md-6 col-lg-2 col-xlg-3' >";
								htmls += "<div class='card card-hover'>";
								htmls += "<div class='box bg-cyan text-center' onClick = 'attendClick(\"";
								htmls += this.a_deadLine;
								htmls += "\")' >";
								
								htmls += "<h1 class='font-light text-white'>";
								htmls += "<i class='mdi mdi-calendar-check'>";
								htmls += "</i>";
								htmls += "</h1>";
								htmls += "<h6 class='text-white'>";
								htmls += this.a_date;
								htmls += "</h6>";
								htmls += "<h6 class='text-white'>";
								htmls += "출석 중";
								htmls += "</h6>";
								htmls += "</div>";
								htmls += "</div>";
								htmls += "</div>";
							}
							else if(this.a_flag==1){
								htmls += "<div class='col-md-6 col-lg-2 col-xlg-3'>";
								htmls += "<div class='card card-hover'>";
								htmls += "<div class='box bg-success text-center'>";
								htmls += "<h1 class='font-light text-white'>";
								htmls += "<i class='mdi mdi-calendar-check'>";
								htmls += "</i>";
								htmls += "</h1>";
								htmls += "<h6 class='text-white'>";
								htmls += this.a_date;
								htmls += "</h6>";
								htmls += "<h6 class='text-white'>";
								htmls += "출석 완료";
								htmls += "</h6>";
								htmls += "</div>";
								htmls += "</div>";
								htmls += "</div>";
							}
							else if(this.a_flag==2){
								htmls += "<div class='col-md-6 col-lg-2 col-xlg-3'>";
								htmls += "<div class='card card-hover'>";
								htmls += "<div class='box bg-warning text-center'>";
								htmls += "<h1 class='font-light text-white'>";
								htmls += "<i class='mdi mdi-calendar-check'>";
								htmls += "</i>";
								htmls += "</h1>";
								htmls += "<h6 class='text-white'>";
								htmls += this.a_date;
								htmls += "</h6>";
								htmls += "<h6 class='text-white'>";
								htmls += "지각";
								htmls += "</h6>";
								htmls += "</div>";
								htmls += "</div>";
								htmls += "</div>";
							}
							else{
								htmls += "<div class='col-md-6 col-lg-2 col-xlg-3'>";
								htmls += "<div class='card card-hover'>";
								htmls += "<div class='box bg-danger text-center'>";
								htmls += "<h1 class='font-light text-white'>";
								htmls += "<i class='mdi mdi-calendar-check'>";
								htmls += "</i>";
								htmls += "</h1>";
								htmls += "<h6 class='text-white'>";
								htmls += this.a_date;
								htmls += "</h6>";
								htmls += "<h6 class='text-white'>";
								htmls += "결석";
								htmls += "</h6>";
								htmls += "</div>";
								htmls += "</div>";
								htmls += "</div>";
							}
						}
						
					});
					$('#attendBox').html(htmls);
				},
				//Ajax 실패시 호출
				error : function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}
		
	</script>
	
	
	
	<!-- 출석 생성 동작 -->
	<script type="text/javascript">
		var limitTime, date, deadLine;
	
		function attendMake() {
			alert("attendMake에 도착했다.");
			var time= jQuery("#attendMake").serialize().split("=");
			limitTime = time[1];
			
			$.ajax({
				url : 'attendMake', // 전송 URL
				type : 'POST', // GET or POST 방식
				traditional : true,
				data : {
					limitTime : time[1]	// 보내고자 하는 data 변수 설정
				},
				//Ajax 성공시 호출 
				success : function(data) {
					alert("출석이 생성되었습니다.");
			 		$("#makeAttend").slideUp();
			 		
 					attendList();
					
 					deadLine = data.a_deadLine;
					date = data.a_date;
					attendTimer();
			 		
				},
				//Ajax 실패시 호출
				error : function(jqXHR, textStatus, errorThrown) {
					alert("오류가 발생하였습니다.");
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}
		
		<!-- timer 함수 -->
		function attendTimer() {
			alert("attendTimer에 도착했다.")
			setTimeout(function(){attendClose()} , limitTime * 60000); //밀리세컨드 -->limitTime으로 바꿔라
		}
		
		<!-- attendClose 함수-->
		function attendClose(){
			alert("문닫자");
			$.ajax({
				url : 'attendClose', // 전송 URL
				type : 'POST', // GET or POST 방식
				traditional : true,
				data : {
					a_date : date,
					a_deadLine : deadLine
				},
				//Ajax 성공시 호출 
				success : function(data) {
					alert(data);
					attendList();
					
				},
				//Ajax 실패시 호출
				error : function(request, status, error){
					alert("오류가 발생하였습니다.");
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}
	</script>
	
	
	<!-- 출석버튼 누르는 동작 -->
	<script type="text/javascript">

		var a_date = "";
	
		function attendClick(deadLine) {
			var result = confirm("출석체크를 하시겠습니까?");
			if(result){
				$.ajax({
					url : 'attendClick', // 전송 URL
					type : 'POST', // GET or POST 방식
					traditional : true,
					data : {
						deadLine : deadLine	// 보내고자 하는 data 변수 설정
					},
					//Ajax 성공시 호출 
					success : function(msg) {
						alert(msg);
						attendList();
					},
					//Ajax 실패시 호출
					error : function(request, status, error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			}
		}
		
		function attendDetail(date) {
			var result = confirm("출석현황을 확인하시겠습니까?");
			a_date = date;
			
			if(result){
				$.ajax({
					url : 'attendDetail', // 전송 URL
					type : 'GET', // GET or POST 방식
					traditional : true,
					data : {
						a_date : date	// 보내고자 하는 data 변수 설정
					},
					//Ajax 성공시 호출 
					success : function(data) {
						var htmls = "";
						
						$(data).each(function(){
								
							$("#modal_a_date").text(data[0].a_date + " 출석현황");

							htmls += "<tr>";

							htmls += "<th>";
							htmls += "<input type = 'hidden' name = 'modal_u_id' value='"+ this.u_id+ "'>";
							htmls += this.u_name;
							htmls += "</th>";

							htmls += "<th>";
							htmls += this.a_flag == 1 ? '출석' : this.a_flag == 2 ? '지각' : '결석';
							htmls += "</th>";
							
							htmls += "<th>";
							htmls += "<select name = 'model_a_flag'>";
							htmls += "<option value = '" + this.a_flag + "' selected> 선택 </option>";
							htmls += "<option value = '1'> 출석 </option> ";
							htmls += "<option value = '2'> 지각 </option> ";
							htmls += "<option value = '3'> 결석 </option> ";
							htmls += "</select>";
							htmls += "</th>";

							htmls += "</tr>";
						});

						$('#tbody').html(htmls);
						$('#noticeModal').modal();
					},
					//Ajax 실패시 호출
					error : function(request, status, error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			}
		}

		function attendManage() {
			var modifiedData= $("#attendManage").serializeArray();
			console.log(modifiedData);
			alert("몇시: " + a_date);

			
			$.ajax({
				url : 'attendManage', // 전송 URL
				type : 'POST', // GET or POST 방식
				traditional : true,
				data : { // 보내고자 하는 data 변수 설정
					modifiedData : modifiedData,
					a_date : a_date	
				},
				dataType: 'json',
				//Ajax 성공시 호출 
				success : function(data) {
					alert("data: " + data);
					$('#noticeModal').hide();
					alert("수정이 완료되었습니다.");
				},
				//Ajax 실패시 호출
				error : function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}
	</script>
	
	
	<!-- ajax 사용 예제 -->
	<script type="text/javascript">
	$('ajaxtest').on('click', function() {
		var sendVar = "뷰에서 컨트롤러";
		
		$.ajax({
			url : 'test', // 전송 URL
			type : 'POST', // GET or POST 방식
			traditional : true,
			data : sendVar, // 보내고자 하는 data 변수 설정
			
			//Ajax 성공시 호출 
			success : function(d) {
				alert(d);
			},
			//Ajax 실패시 호출
			error : function(jqXHR, textStatus, errorThrown) {
				console.log("jqXHR : " + jqXHR + "textStatus : "
						+ textStatus + "errorThrown : " + errorThrown);
			}
		});
	})
	</script>
	
	
</body>
</html>