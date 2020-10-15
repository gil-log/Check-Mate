<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

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
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/template/dist/css/style.min.css" rel="stylesheet">
    
    <!-- 웹 소켓 -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
    
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
                    <!-- column -->
                    <div class="col-lg-6">
                        <!-- card new -->
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                <h4 class="card-title m-b-0">공지사항</h4>
                                     <div class="ml-auto">
                                        <div class="tetx-right">
                                        <a href="information" data-toggle="tooltip" data-placement="top" title="" data-original-title="더보기">
                                                <i class="fa fa-plus w-30px m-t-5"></i>
                                                 </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <ul class="list-style-none">
                            
							<c:set var="noticeIsNull" value="${noticeIsNull}"/>
                            <c:if test="${noticeIsNull == 1}">
                                <li class="d-flex no-block card-body">
                                    <i class="fa fa-chess-queen w-30px m-t-5"></i>
                                    <div>
                                        <a class="m-b-0 font-medium p-0">등록된 공지사항이 없습니다.</a>
                                    </div>
                                    <div class="ml-auto">
                                        <div class="tetx-right">
                                            <h5 class="text-muted m-b-0"></h5>
                                            <span class="text-muted font-16"></span>
                                        </div>
                                    </div>
                                </li>
							</c:if>
                            <c:if test="${noticeIsNull == 0}">
								<c:forEach items="${noticeList}" var="noticeList">
                                <li class="d-flex no-block card-body">
                                    <i class="fa fa-bullhorn w-30px m-t-5"></i>
                                    <div>
                                        <a class="m-b-0 font-medium p-0"><c:out value="${noticeList.n_title}"/></a>
                                    </div>
                                    <div class="ml-auto">
                                        <div class="tetx-right">
                                            <h5 class="text-muted m-b-0"><c:out value="${noticeList.u_id}"/></h5>
                                            <span class="text-muted font-16"><c:out value="${noticeList.n_date}"/></span>
                                        </div>
                                    </div>
                                </li>   
                            	</c:forEach>
                            </c:if>
                            </ul>
                        </div>
                        
                        <!-- card new -->
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                <h4 class="card-title m-b-0">숙제</h4>
                                     <div class="ml-auto">
                                        <div class="tetx-right">
                                        <a href="homework" data-toggle="tooltip" data-placement="top" title="" data-original-title="더보기">
                                                <i class="fa fa-plus w-30px m-t-5"></i>
                                                 </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <ul class="list-style-none">
                            
							<c:set var="homeworkIsNull" value="${homeworkIsNull}"/>
                            <c:if test="${homeworkIsNull == 1}">
                                <li class="d-flex no-block card-body">
                                    <i class="fa fa-chess w-30px m-t-5"></i>
                                    <div>
                                        <a class="m-b-0 font-medium p-0">등록된 숙제가 없습니다.</a>
                                    </div>
                                    <div class="ml-auto">
                                        <div class="tetx-right">
                                            <h5 class="text-muted m-b-0"></h5>
                                            <span class="text-muted font-16"></span>
                                        </div>
                                    </div>
                                </li>
							</c:if>
                            <c:if test="${homeworkIsNull == 0}">
								<c:forEach items="${homeworkList}" var="homeworkList">
                                <li class="d-flex no-block card-body">
                                    <i class="fa fa-chess-knight w-30px m-t-5"></i>
                                    <div>
                                        <a class="m-b-0 font-medium p-0"><c:out value="${homeworkList.h_title}"/></a>
                                    </div>
                                    <div class="ml-auto">
                                        <div class="tetx-right">
                                            <h5 class="text-muted m-b-0"><c:out value="${homeworkList.u_id}"/></h5>
                                            <span class="text-muted font-16"><c:out value="${homeworkList.h_date}"/></span>
                                        </div>
                                    </div>
                                </li>   
                            	</c:forEach>
                            </c:if>
                            </ul>
                        </div>
                        
                    </div>
                    <!-- column -->
                    <div class="col-lg-6">
                        <!-- Card -->
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">그룹 채팅</h4>
                                
                                
                                <div class="chat-box scrollable" style="height:35px;" id='chatUserList'>

                                </div>
                                
                                <div class="chat-box scrollable" style="height:475px;">
                                    <!--chat Row 여기에 채팅이 계속 append 됨-->
                                    <ul class="chat-list" id='chatList'>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-body border-top">
                                <div class="row">
                                    <div class="col-9">
                                        <div class="input-field m-t-0 m-b-0">
                                            <textarea id="message" placeholder="메시지 입력 후 전송 버튼을 눌러주세요." class="form-control border-0" style="resize: none;"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <button class="btn-circle btn-lg btn-cyan float-right text-white fas fa-paper-plane" id="chatSendBtn">
                                        </button>
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
                 Check&Mate
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

		let sock = new SockJS('http://localhost:8080/chat/');
		
    	sock.onmessage = onMessage;
    	sock.onclose = onClose;
    	
    	$('#chatSendBtn').click(function(){
        	if($('#message').val()==''){
            	
            	} else{
            		sendMessage();
            		$('#message').val('');
                	}
    		
    	});

    	$("#message").keyup(function(e){
        	if($('#message').val()=='\n'){
        	} else{
        		if(e.keyCode == 13){
            		sendMessage();
            		$('#message').val('');
        		} 
            }
        });

    	
    	function sendMessage(){
    		sock.send($('#message').val());
    	}
    	
    	function onMessage(msg) {
    		//msg는 websocket class에서 보내준 데이터임
    		var data = msg.data;
    		var socketSenderId = null;
    		var message = null;
    		var nowTime = null;
    		var gFlag = null;
    		
    		var strArray = data.split('|');

    		// main에 접속할때 세션 연결되면 채팅방 인원에 표현하려고 u_id g_flag 2개 보냈음
    		if(strArray.length == 1){
    			if(strArray[0] == '0'){
        			$("#chatUserList").empty();
    			}
    		}
    		else if(strArray.length == 2){
    			
        		chatUserId = strArray[0];
        		chatUserGflag = strArray[1];

        		//관리자면 노란색으로 채팅 인원 리스트에 보여줌
        		if(chatUserGflag == 1){
            		var html = '<i class="fa fa-chess-queen" style="color: #D1BA09">'+chatUserId+'&nbsp;&nbsp;</i>';
        			$("#chatUserList").append(html);
            		} else {
                		var html = '<i class="fa fa-chess-knight">'+chatUserId+'&nbsp;&nbsp;</i>';
            			$("#chatUserList").append(html);
                		}
        		} else {


        			// 받은 문자열 쪼개주어서 요소 나누기
            		for(var i=0; i<strArray.length; i++){
            			console.log('str['+i+']: ' + strArray[i]);
            		}
            		
            		var myId = '${group.u_id}';
            		console.log('로그인한 내 아이디 : ' + myId);
            		
            		socketSenderId = strArray[0]; //소켓에서 받은 메시지 전송자의 아이디 등록
            		message = strArray[1]; // 받은 메시지
            		nowTime = strArray[2];
            		gFlag = strArray[3];
            		//내가 보낸 메시지는 왼쪽에 뜰꺼고 상대방이 보낸 메시지는 오른쪽에 뜨게 구분해준다
            		
            		if(socketSenderId == myId){

            			var html = '<li class="odd chat-item" tabindex ="-1">';
            			html += '<div class="chat-content">';
            			html += '<div class="box bg-light-inverse">'+message+'</div>';
                        html += '<br>';
                        html += '</div>';
                        html += '<div class="chat-time">'+nowTime+'</div>';
                        html += '</li>';

                		$("#chatList").append(html);
                		
                		$("#chatList").children().last().focus();
            		} else{
            			
            			var html = '<li class="chat-item" tabindex ="-1">';

            			if(gFlag == '0'){
                			html += '<div class="chat-img"><img src="${pageContext.request.contextPath}/resources/checkmateimg/chessknight.png" alt="user"></div>';
                			html += '<div class="chat-content">';
                			html += '<h6 class="font-medium">'+socketSenderId+'</h6>'
                			html += '<div class="box bg-light-info">'+message+'</div>';
                            html += '</div>';
                            html += '<div class="chat-time">'+nowTime+'</div>';
                            html += '</li>';
            			} else {
                			html += '<div class="chat-img"><img src="${pageContext.request.contextPath}/resources/checkmateimg/chessking.png" alt="user"></div>';
                			html += '<div class="chat-content">';
                			html += '<h6 class="font-medium" style="font-family: sans-serif; font-weight: bold; color: #D1BA09" id="chatOtherId">'+socketSenderId+'</h6>'
                			html += '<div class="box bg-light-info"><a style="font-weight: bold;">'+message+'</a></div>';
                            html += '</div>';
                            html += '<div class="chat-time">'+nowTime+'</div>';
                            html += '</li>';
            				
                		}
                		
                		$("#chatList").append(html);
                		
                		$("#chatList").children().last().focus();
                		
            		}
            		}
    		
    	}
    	
    	function onClose(evt) {
        	
    		$("#message").append("연결 끊김");
    		
    	}
    </script>
</body>

</html>