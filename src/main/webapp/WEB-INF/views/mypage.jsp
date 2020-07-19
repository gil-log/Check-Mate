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

<!-- Check Mate! 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Ranchers&display=swap" rel="stylesheet">
<!-- 한글 Check Mate! 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<!-- 본문 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<!-- 달력 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
<style type="text/css">
.checkmate-text{
/* 	font-family: 'Ranchers', cursive; */
	font-family: 'Do Hyeon', sans-serif;
	font-size: 40px;
}
.progress-bg{
	background: url("${pageContext.request.contextPath}/resources/checkmateimg/checkmate_logo_text.png");
}
.container-fluid{
	font-family: 'Jua', sans-serif;
}
#calendar{
	font-family: 'Noto Sans KR', sans-serif;
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
                                    <div class="progress-bar" style="width:0%; height:30px;" id="attendProgress">0%</div>
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
																style="float: right;" id="attendOk"></a>
														</div>
														<div class="calendar-events m-b-20" data-class="bg-danger">
															<i class="fa fa-circle text-danger m-r-10"></i>결석 <a
																style="float: right;" id="attendNo"></a>
														</div>
														<div class="calendar-events m-b-20"
															data-class="bg-warning">
															<i class="fa fa-circle text-warning m-r-10"></i>지각 <a
																style="float: right;" id="attendLate"></a>
														</div>
														<hr>
														
														<h5 class="card-title text-center">과제 현황</h5>
														
														<div class="col-lg-10" style="margin:auto;">
														<div class="progress m-t-15" style="height:30px;">
														<div class="progress-bar bg-secondary" style="width:0%; height:30px;" id="hwProgress">0%</div>
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
																style="float: right;" id="hwFinished"></a>
														</div>
														<div class="calendar-events m-b-20" data-class="bg-danger">
															<i class="fa fa-circle text-dark m-r-10"></i>과제 미제출 <a
																style="float: right;" id="hwUnFinished"></a>
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
															<i class="fa fa-chess-queen text-warning m-r-10">1위.</i>
															<a class="m-r-10" id="rank1"></a>
															<a style="float: right;" id="rankOne">test1</a>
														</div>
														<div class="m-b-20"
															data-class="bg-success" id="rank2div">
															<i class="fa fa-chess-bishop text-danger m-r-10"> 2위.</i>
															<a class="m-r-10" id="rank2"></a>
															<a style="float: right;" id="rankTwo">test2</a>
														</div>
														<div class="m-b-20" data-class="bg-danger" id="rank3div">
															<i class="fa fa-chess-rook text-primary m-r-10"> 3위.</i>
															<a class="m-r-10" id="rank3"></a>
															<a style="float: right;" id="rankThree">test3</a>
														</div>
														<hr>
														<h4 class="alert-heading text-center">내 순위</h4>
															<i class="fa fa-chess-king text-dark m-r-10" id="myRanking"></i>
															<a class="m-r-10" id="rank4"></a>
															<a style="float: right;" id="myRank">test1</a>
														<hr>

														</div>

													</div>
												</div>

													<div class="card">
														<div class="card-body border-top">
															<h5 class="card-title text-center checkmate-text" id="totalProgressTitle">수료까지...</h5>

															<div class="col-lg-14" style="margin: auto;">
																<div class="progress m-t-15" style="height: 70px;">
																	<div
																		class="progress-bar progress-bar-striped progress-bar-animated bg-warning"
																		style="width: 0%; height: 70px;" id="totalProgress">0%</div>
																</div>
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

					<!-- 수료 프로그레스바 밑에 넣고 싶을때 -->
					<div class="col-lg-12">


					</div>
					
				<!-- BEGIN MODAL -->
                <div class="modal none-border" id="my-event">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title"><strong>Add Event</strong></h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body"></div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-success save-event waves-effect waves-light">Create event</button>
                                <button type="button" class="btn btn-danger delete-event waves-effect waves-light" data-dismiss="modal">Delete</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal Add Category -->
                <div class="modal fade none-border" id="add-new-event">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title"><strong>Add</strong> a category</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label class="control-label">Category Name</label>
                                            <input class="form-control form-white" placeholder="Enter name" type="text" name="category-name" />
                                        </div>
                                        <div class="col-md-6">
                                            <label class="control-label">Choose Category Color</label>
                                            <select class="form-control form-white" data-placeholder="Choose a color..." name="category-color">
                                                <option value="success">Success</option>
                                                <option value="danger">Danger</option>
                                                <option value="info">Info</option>
                                                <option value="primary">Primary</option>
                                                <option value="warning">Warning</option>
                                                <option value="inverse">Inverse</option>
                                            </select>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger waves-effect waves-light save-category" data-dismiss="modal">Save</button>
                                <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END MODAL -->
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
<%--     <script src="${pageContext.request.contextPath}/resources/custom/js/cal.js"></script> --%>
    <script src="${pageContext.request.contextPath}/resources/template/dist/js/jquery.ui.touch-punch-improved.js"></script>
    <script src="${pageContext.request.contextPath}/resources/template/dist/js/jquery-ui.min.js"></script>

    <script type="text/javascript">
    $(document).ready(function() {
    	calendarInit();
    	calendarEventsList();
    	calendarPoint();
    });

    function calendarEventsList() {

        $.ajax({
            url : 'calendarinfo',                    // 전송 URL
            type : 'GET',                // GET or POST 방식
            traditional : true,
            data : {
            },
            //Ajax 성공시 호출 
            success : function(d){
                $('#calendar').fullCalendar( 'addEventSource', d )
            },
         
            //Ajax 실패시 호출
            error : function(jqXHR, textStatus, errorThrown){
                console.log("jqXHR : " +jqXHR +"textStatus : " + textStatus + "errorThrown : " + errorThrown);
            }
        });
    }

    function calendarPoint() {
        
        $.ajax({
            url : 'calendarpoint',                    // 전송 URL
            type : 'GET',                // GET or POST 방식
            traditional : true,
            data : {
            },
            //Ajax 성공시 호출 
            success : function(d){

                // 출석 부분
                document.getElementById('attendProgress').style.width = d.attendPercent+"%";
                $('#attendProgress').text(d.attendPercent+"%");
                $('#attendOk').text("+ " + d.attendOne * 5);
                $('#attendLate').text("- " + d.attendTwo * 3);
                $('#attendNo').text("- " + d.attendThree * 5);

                // 과제 부분
                document.getElementById('hwProgress').style.width = d.hwPercent+"%";
                $('#hwProgress').text(d.hwPercent+"%");
                $('#hwFinished').text("+ " + d.hwFinished);
                $('#hwUnFinished').text(d.hwUnFinished);

                // 랭크 부분
                if(d.rankCount==1){
                    
                    $('#rank1').text(d.rankOne.u_id);
                    $('#rankOne').text(d.rankOne.u_point +" 점");

                    $('#rank2div').hide();
                    $('#rank3div').hide();
                    
                    $('#myRanking').text(" "+d.myRank.rank+"위.");
                    $('#rank4').text(d.myRank.u_id);
                    $('#myrank').text(d.myRank.u_point +" 점");
                    
                    } else if(d.rankCount==2){

                        $('#rank1').text(d.rankOne.u_id);
                        $('#rankOne').text(d.rankOne.u_point +" 점");

                        $('#rank2').text(d.rankTwo.u_id);
                        $('#rankTwo').text(d.rankTwo.u_point +" 점");
                        
                        $('#rank3div').hide();
                        
                        $('#myRanking').text(" "+d.myRank.rank+"위.");
                        $('#rank4').text(d.myRank.u_id);
                        $('#myrank').text(d.myRank.u_point +" 점");
                        

                        } else if(d.rankCount==3){
                            $('#rank1').text(d.rankOne.u_id);
                            $('#rankOne').text(d.rankOne.u_point +" 점");
                            $('#rank2').text(d.rankTwo.u_id);
                            $('#rankTwo').text(d.rankTwo.u_point +" 점");
                            $('#rank3').text(d.rankThree.u_id);
                            $('#rankThree').text(d.rankThree.u_point +" 점");
                            
                            $('#myRanking').text(" "+d.myRank.rank+"위.");
                            $('#rank4').text(d.myRank.u_id);
                            $('#myrank').text(d.myRank.u_point +" 점");
                            

                            } else if(d.rankCount==4){
                                $('#rank1').text(d.rankOne.u_id);
                                $('#rankOne').text(d.rankOne.u_point +" 점");
                                $('#rank2').text(d.rankTwo.u_id);
                                $('#rankTwo').text(d.rankTwo.u_point +" 점");
                                $('#rank3').text(d.rankThree.u_id);
                                $('#rankThree').text(d.rankThree.u_point +" 점");

                                $('#myRanking').text(" "+d.myRank.rank+"위.");
                                $('#rank4').text(d.myRank.u_id);
                                $('#myrank').text(d.myRank.u_point +" 점");
                                }
                $('#myRank').text(d.myPoint + " 점");

                // 수료 프로그레스바 부분
                
                if(d.totalPercent >= 80){
                	$('#totalProgressTitle').text("Check Mate!");
                }
                document.getElementById('totalProgress').style.width = d.totalPercent+"%";
                $('#totalProgress').text(d.totalPercent+"%");
                
                
            },
         
            //Ajax 실패시 호출
            error : function(jqXHR, textStatus, errorThrown){
                console.log("jqXHR : " +jqXHR +"textStatus : " + textStatus + "errorThrown : " + errorThrown);
            }
        });

        }
    
    function calendarInit(){
    	
    	$('#calendar').fullCalendar({
            slotDuration: '00:15:00',
            /* If we want to split day time each 15minutes */
            minTime: '08:00:00',
            maxTime: '19:00:00',
            defaultView: 'month',
            handleWindowResize: true,
            displayEventTime: false,
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            events: [],
            eventLimit: true

        });
    	
    }
    </script>
 
</body>

</html>