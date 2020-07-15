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
					<div class="col-lg-6">
						<div class="card">
                            <div class="card-body border-top">
                            
                                <h5 class="card-title text-center">출석 현황</h5>
                                
                                <div class="col-lg-10" style="margin:auto;">
                                <div class="progress m-t-15" style="height:30px;">
                                    <div class="progress-bar" style="width:100%; height:30px;">100%</div>
                                </div>
                                </div>
                                <div id='calendar'></div>
                            </div>
                        </div>
                        
                        <div class="card">
                            <div class="card-body border-top">
                                <h5 class="card-title">과제 현황</h5>
                                <div class="progress m-t-15">
                                    <div class="progress-bar progress-bar-striped progress-bar-animated" style="width:40%"></div>
                                </div>
                                <div class="progress m-t-15">
                                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-warning" style="width:50%"></div>
                                </div>
                                <div class="progress m-t-15">
                                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" style="width:60%"></div>
                                </div>
                                <div class="progress m-t-15">
                                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-cyan" style="width:70%"></div>
                                </div>
                                <div class="m-t-15">
                                    <code>
                                        &lt;div class=&quot;progress m-t-15&quot;&gt;<br/>
                                            &lt;div class=&quot;progress-bar progress-bar-striped progress-bar-animated bg-cyan&quot; style=&quot;width:70%&quot;&gt;&lt;/div&gt;<br/>
                                        &lt;/div&gt;
                                    </code>
                                </div>
                            </div>
                        </div>
                        
					</div>
					
					<div class="col-lg-6">
					
					<div class="card">
                                <div class="alert alert-primary" role="alert">
                                  <h4 class="alert-heading">포인트 현황</h4>
                                  <hr>
                                  <div class="card-body border-top">
                                  <p class="mb-0">Whenever you need to, be sure to use margin utilities to keep things nice and tidy.</p>
                                
                                  </div>
                                  
                                  </div>
                                
                        </div>
					
					
					</div>
					
					<div class="col-lg-12">

                        <div class="card">
                            <div class="card-body border-top">
                                <h5 class="card-title">Check Mate!</h5>
                                <div class="progress m-t-15">
                                    <div class="progress-bar progress-bar-striped progress-bar-animated" style="width:40%"></div>
                                </div>
                                <div class="progress m-t-15">
                                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-warning" style="width:50%"></div>
                                </div>
                                <div class="progress m-t-15">
                                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" style="width:60%"></div>
                                </div>
                                <div class="progress m-t-15">
                                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-cyan" style="width:70%"></div>
                                </div>
                                <div class="m-t-15">
                                    <code>
                                        &lt;div class=&quot;progress m-t-15&quot;&gt;<br/>
                                            &lt;div class=&quot;progress-bar progress-bar-striped progress-bar-animated bg-cyan&quot; style=&quot;width:70%&quot;&gt;&lt;/div&gt;<br/>
                                        &lt;/div&gt;
                                    </code>
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

    <script type="text/javascript">

    $(document).ready(function() {
    	
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
              , title : "Repeating Event"
              , color : "#0000FF"

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