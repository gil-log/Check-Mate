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
    <title>Check&Mate</title>
    
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/template/assets/libs/flot/css/float-chart.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/template/assets/libs/fullcalendar/dist/fullcalendar.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/template/assets/extra-libs/calendar/calendar.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/template/dist/css/style.min.css" rel="stylesheet">
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

				<div class="row">

					<div class="col-md-12">
						<div class="card">
							<div class="">
								<div class="row">
									<div class="col-lg-3 border-right p-r-0">
										<div class="card-body border-bottom">
											<h4 class="card-title m-t-10 text-center">출석&과제 점수표</h4>
										</div>
										<div class="card-body">
											<div class="row">


												<div class="col-md-12">
												
													<div id="" class="">
													
							<h5 class="card-title text-center">출석 현황</h5>
                                
                                <div class="col-lg-10" style="margin:auto;">
                                <div class="progress m-t-15" style="height:30px;">
                                    <div class="progress-bar" style="width:100%; height:30px;">100%</div>
                                </div>
                                </div>
                                
													<hr>
														<div class="calendar-events m-b-20"
															data-class="bg-primary">
															<i class="fa fa-circle text-primary m-r-10"></i>출석 진행 중
														</div>
														<div class="calendar-events m-b-20"
															data-class="bg-success">
															<i class="fa fa-circle text-success m-r-10"></i>출석 완료 <a
																style="float: right;">+5</a>
														</div>
														<div class="calendar-events m-b-20" data-class="bg-danger">
															<i class="fa fa-circle text-danger m-r-10"></i>결석 <a
																style="float: right;">-5</a>
														</div>
														<div class="calendar-events m-b-20"
															data-class="bg-warning">
															<i class="fa fa-circle text-warning m-r-10"></i>지각 <a
																style="float: right;">-3</a>
														</div>
														<hr>
														
														<h5 class="card-title text-center">과제 현황</h5>
														
														<div class="col-lg-10" style="margin:auto;">
														<div class="progress m-t-15" style="height:30px;">
														<div class="progress-bar bg-secondary" style="width:100%; height:30px;">100%</div>
														</div>
														</div>
                                
													<hr>
														<div class="calendar-events m-b-20"
															data-class="bg-primary">
															<i class="fa fa-circle text-secondary m-r-10"></i>과제 진행 중
														</div>
														<div class="calendar-events m-b-20"
															data-class="bg-success">
															<i class="fa fa-circle text-info m-r-10"></i>과제 제출 완료 <a
																style="float: right;">+10</a>
														</div>
														<div class="calendar-events m-b-20" data-class="bg-danger">
															<i class="fa fa-circle text-dark m-r-10"></i>과제 미제출 <a
																style="float: right;">-10</a>
														</div>
														<hr>
													</div>

												</div>
												
												<div class="col-md-12">
												<div class="card">
													<div class="alert alert-primary">
													
													
													
														<h4 class="alert-heading text-center">순위표</h4>
														<hr>
														
														
														<div class="card-body border-top">

														<div class="m-b-20"
															data-class="bg-primary">
															<i class="fa fa-chess-queen text-warning m-r-10"></i>1위.
															<a style="float: right;">test1</a>
														</div>
														<div class="m-b-20"
															data-class="bg-success">
															<i class="fa fa-chess-bishop text-danger m-r-10"></i> 2위.
															<a style="float: right;">test2</a>
														</div>
														<div class="m-b-20" data-class="bg-danger">
															<i class="fa fa-chess-rook text-primary m-r-10"></i> 3위.
															<a style="float: right;">test3</a>
														</div>
														<hr>
														<h4 class="alert-heading text-center">내 순위</h4>
															<i class="fa fa-chess-king text-dark m-r-10"></i> 5위.
															<a style="float: right;">test1</a>
														<hr>

														</div>

													</div>
												</div>
												</div>




											</div>
										</div>
									</div>
									<div class="col-lg-9">
										<div class="card-body b-l calender-sidebar">
											<div id="calendar"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-6"></div>

					<div class="col-lg-12">

						<div class="card">
							<div class="card-body border-top">
														<h5 class="card-title text-center">Check Mate!</h5>
														
														<div class="col-lg-10" style="margin:auto;">
														<div class="progress m-t-15" style="height:70px;">
														<div class="progress-bar progress-bar-striped progress-bar-animated bg-warning" style="width:100%; height:70px;">100%</div>
														</div>
														</div>
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
    <script src="${pageContext.request.contextPath}/resources/template/assets/libs/moment/min/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/libs/fullcalendar/dist/fullcalendar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/assets/libs/fullcalendar/dist/locale/ko.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/dist/js/pages/calendar/cal-init.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/dist/js/jquery.ui.touch-punch-improved.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/dist/js/jquery-ui.min.js"></script>

    <script>

    $(document).ready(function() {
    	
    	calendarEventsList();
    	
        var defaultEvents = [
            {
            	id : 1
            	, title : "All Day Event"
               , start : "2020-07-01"
          },
          {
        	  	id : 1,
                title : "Long Event"
              , start : "2020-07-02"
              , end : "2020-07-04"
          },
          {
                id : 2
              , title : "출석진행중"
              , color : "#7460ee"

              , start : "2020-07-13T16:00:00"
          },
          {
                id : 2
              , title : "zzzz"
              , color : "#0000FF"
              , start : "2020-07-20T16:00:00"
          }
            ];
       
        calendarCreate(defaultEvents);
    });
    
    function calendarEventsList() {
    	var u_id = '${group.u_id}';
    	var g_no = ${group.g_no};
        $.ajax({
            url : 'caltest',                    // 전송 URL
            type : 'GET',                // GET or POST 방식
            traditional : true,
            data : {
                u_id : u_id,        // 보내고자 하는 data 변수 설정
                g_no : g_no
            },
            
            //Ajax 성공시 호출 
            success : function(d){
                alert(d);
            },
         
            //Ajax 실패시 호출
            error : function(jqXHR, textStatus, errorThrown){
                console.log("jqXHR : " +jqXHR +"textStatus : " + textStatus + "errorThrown : " + errorThrown);
            }
        });
    }
    
    
    function calendarCreate(defaultEvents) {
  	  $('#calendar').fullCalendar({
          slotDuration: '00:15:00',
          /* If we want to split day time each 15minutes */
          minTime: '08:00:00',
          maxTime: '19:00:00',
          defaultView: 'month',
          handleWindowResize: true,

          header: {
              left: 'prev,next today',
              center: 'title',
              right: 'month,agendaWeek,agendaDay'
          },
          events: defaultEvents,
          editable: false,
          droppable: false, // this allows things to be dropped onto the calendar !!!
          eventLimit: true, // allow "more" link when too many events
          selectable: true,
          locale: 'ko'
      });
    	
    }
    
    </script>
    
</body>

</html>