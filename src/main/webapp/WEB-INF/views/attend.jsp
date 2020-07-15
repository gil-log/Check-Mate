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

							
											<!-- dropdown 추가 시작 -->
											<a class="nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic"
												href="" data-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false"> 
												<i class="fa fa-plus w-30px m-t-5" id="attend-switch" ></i>
											</a>
											<!-- dropdown 추가 끝 -->
											
											
											
										</div>
									</div>
								</div>
							</div>
							
							<!-- dropdown 추가 시작 -->
											
							<div id ="makeAttend" style="display:none">
								<h7 class="card-title m-b-0">시간 설정</h7>

								<form id="attendInsert" >
									<select id="timer" class="dropdown-item" name = "time">
										<option value="5">5분 후</option>
										<option value="10">10분 후</option>
										<option value="15">15분 후</option>
									</select>
									<div class="dropdown-item">
										<input type = "reset" class="btn btn-sm btn-rounded" value="초기화"> 
										<input type="button" class="btn btn-sm btn-success btn-rounded" onclick="ajaxtest()" value="설정">
									</div>
								</form>
							</div>
							<!-- dropdown 추가 끝 -->




							<!-- 출석현황 네모박스 출력 시작 -->
							<div class="row">
								<c:forEach items="${attendList}" var="attendList">
									<c:choose>
										<c:when test="${attendList.a_flag eq 0}">
											<div class="col-md-6 col-lg-2 col-xlg-3">
												<div class="card card-hover">
													<div class="box bg-cyan text-center">
														<h1 class="font-light text-white">
															<i class="mdi mdi-calendar-check"></i>
														</h1>
														<h6 class="text-white"> ${attendList.a_date}</h6>
														<h6 class="text-white">출석 중</h6>
													</div>
												</div>
											</div>
										</c:when>
										
										<c:when test="${attendList.a_flag eq 1}">
											<div class="col-md-6 col-lg-2 col-xlg-3">
												<div class="card card-hover">
													<div class="box bg-success text-center">
														<h1 class="font-light text-white">
															<i class="mdi mdi-calendar-check"></i>
														</h1>
														
														<h6 class="text-white"> ${attendList.a_date}</h6>
														<h6 class="text-white">출석 완료</h6>
													</div>
												</div>
											</div>
										</c:when>
									
										<c:when test="${attendList.a_flag eq 2}">
											<div class="col-md-6 col-lg-2 col-xlg-3">
												<div class="card card-hover">
													<div class="box bg-warning text-center">
														<h1 class="font-light text-white">
															<i class="mdi mdi-calendar-check"></i>
														</h1>
														<h6 class="text-white"> ${attendList.a_date}</h6>
														<h6 class="text-white">지각</h6>
													</div>
												</div>
											</div>
										</c:when>
									
										<c:otherwise>
											<div class="col-md-6 col-lg-2 col-xlg-3">
												<div class="card card-hover">
													<div class="box bg-danger text-center">
														<h1 class="font-light text-white">
															<i class="mdi mdi-calendar-check"></i>
														</h1>
														<h6 class="text-white"> ${attendList.a_date}</h6>
														<h6 class="text-white">결석</h6>
													</div>
												</div>
											</div>
										</c:otherwise>
									
									</c:choose>
									
								</c:forEach>
							</div>
							<!-- 출석현황 네모박스 출력 끝 -->
							
							
							
						</div>
					</div>
				</div>
			</div>
			<!-- icon박스 끝 -->



			<!-- 본문을 여기에 넣기 -->
			<div> ㅎㅇㅎㅇ </div>
			<div> ${attendList} </div>







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
	
	<!-- ajax 사용 예제 -->
	<script type="text/javascript">
		function ajaxtest() {
			var time= jQuery("#attendInsert").serialize();
	
			alert(time);
			
			$.ajax({
				url : 'attendInsert', // 전송 URL
				type : 'POST', // GET or POST 방식
				traditional : true,
				data : {
					test : time
				// 보내고자 하는 data 변수 설정
				},

				//Ajax 성공시 호출 
				success : function(d) {
					alert("출석을 생성하셨습니다.");
					
				},

				//Ajax 실패시 호출
				error : function(jqXHR, textStatus, errorThrown) {
					console.log("jqXHR : " + jqXHR + "textStatus : "
							+ textStatus + "errorThrown : " + errorThrown);
				}
			});
		}
	</script>
	
	<script type="text/javascript">
	$('ajaxtest').on('click', function() {
		var sendVar = "뷰에서 컨트롤러";
		
		$.ajax({
			url : 'test', // 전송 URL
			type : 'POST', // GET or POST 방식
			traditional : true,
			data : sendVar,//$('#attendInsert').serialize(),// 보내고자 하는 data 변수 설정
			

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
	}
	</script>
	
	
	<!-- 출석 생성(popup) -->
	<script type="text/javascript">
	 var toggle = false;
	 
	 $('#attend-switch').on("click", function() {
		toggle = !toggle;
		if(toggle){
			alert("까꿍");
 			$("#makeAttend").slideDown();
	 	}
	 	else{
	 		$("#makeAttend").slideUp();
		}
	 });
	</script>
</body>

</html>