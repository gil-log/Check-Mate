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
    <title>Check&Mate - Group</title>
    
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/template/assets/libs/flot/css/float-chart.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/template/assets/libs/select2/dist/css/select2.min.css">
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/template/dist/css/style.min.css" rel="stylesheet">
    
  <%--         <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/custom/css/normalize.css" />
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/custom/css/demo.css" />
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/custom/css/component.css" />
    --%>   
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->


</head>
<style>
/* .rows {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    margin-right: -10px;
    margin-left: 80%;
    width: 10%;
} */

.card-bodys {
    -webkit-box-flex: 1;
    -ms-flex: 1 1 auto;
    flex: 1 1 auto;
    padding: 4.25rem;
}
</style> 

<style>
	/* 로딩이미지 박스 꾸미기 */
	div#viewLoading {
		text-align: center;
		background: #FFFFF0;
		filter: alpha(opacity=60);
		opacity: alpha*0.6;
	}
</style>

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
      <div class="auth-wrapper d-flex no-block justify-content-center align-items-center bg-dark">
         <div class="container-fluid">
            <!-- 본문을 여기에 넣기 -->
            <!-- 그룹생성입니다. -->
            <div class="text-center p-t-20 p-b-20">
               <span class="db"><img
                  src="${pageContext.request.contextPath}/resources/checkmateimg/logo_transparent.png"
                  height="200" width="200" alt="logo" /></span>
            </div>

            <div class="row">
            <div class="col-lg-9"></div>            
               <div class="card-bodys">
                  <a href="javascript:void(0)" data-toggle="modal"
                     data-target="#add-new-event"
                     class="btn m-t-20 btn-info btn-block waves-effect waves-light">
                     <i class="ti-plus"></i> 그룹 생성하기
                  </a>
               </div>
            </div>
            <!-- Modal Add Category -->
            <div class="modal fade none-border" id="add-new-event">
               <div class="modal-dialog">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h4 class="modal-title">
                           <strong>Add</strong> a group
                        </h4>
                        <button type="button" class="close" data-dismiss="modal"
                           aria-hidden="true">&times;</button>
                     </div>
                     <form action="/group" method="POST">
                        <div class="modal-body">
                           <div class="row">
                              <div class="col-md-10">
                                 <label class="control-label">Group Name</label> <input
                                    class="form-control form-white"
                                    placeholder="그룹 이름을 작성해 주세요." type="text" name="g_name"
                                    required="required" /> <input type="hidden" name="u_id"
                                    value="${user.u_id}" />
                              </div>
                           </div>
                        </div>
                        <div class="modal-footer">
                           <button type="submit"
                              class="btn btn-danger waves-effect waves-light save-category">Save</button>
                           <button type="button" class="btn btn-secondary waves-effect"
                              data-dismiss="modal">Close</button>
                        </div>
                     </form>
                  </div>
               </div>
            </div>
            <!-- END MODAL -->

            <!-- 인원추가입니다.  -->
            <!-- Modal Add Category -->
            <div class="modal fade none-border" id="add-new-user">
               <div class="modal-dialog">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h4 class="modal-title">
                           <strong>Add</strong> a people
                        </h4>
                        <button type="button" class="close" data-dismiss="modal"
                           aria-hidden="true">&times;</button>
                     </div>
                        <div class="modal-body">
                        
                                       <div id="viewLoading">
											<img src="${pageContext.request.contextPath}/resources/checkmateimg/viewLoading.gif" />
										</div>
										
                           <div class="form-group row">

                                    <label class="col-md-12 m-t-15">추가할 인원의 ID를 입력하세요.</label><br>                                                                    
                                    <div class="col-md-9">
                                        <select class="select2 form-control m-t-15" multiple="multiple" style="height: 36px;width: 100%;" id="userListSelect">                                     
                                            <optgroup label="UserID"></optgroup>
                                        </select>
                                    </div>
                                    
                                    
                                    

	
	
                           <button type="button" class="btn btn-danger waves-effect waves-light save-category" 
                                 onclick="userPlus();" id="groupUserPlus">추가</button>
                                                
                                             
                           </div>
                        </div>
                  </div>
                        <!-- <div class="modal-footer">
                           <button type="button"
                              class="btn btn-danger waves-effect waves-light save-category" onclick="userPlus();" id="">Save</button>
                           <button type="button" class="btn btn-secondary waves-effect"
                              data-dismiss="modal">Close</button>
                        </div> -->
                       
               </div>
            </div>
            
                 <div style="display:none;">
                    <input type="text" id="selectedGno" value="">
                    <input type="text" id="selectedGname" value="">
                 </div>
            <!-- END MODAL -->

            <!-- Sales Cards  -->
            <div class="row" id="groupListDiv"><!--  style="margin-left: 5%;" -->
               <%--    
                    <!-- Column -->
                    <div class="col-md-6 col-lg-2 col-xlg-3">
                        <div class="card card-hover">
                            <div class="box bg-cyan text-center">
                            <img src="${pageContext.request.contextPath}/resources/checkmateimg/icon1.png" height="150" width="150" alt="logo" />
                                <h1 class="font-light text-white"><i class="fas fa-chess-pawn"></i></h1>
                                <h4 class="text-white" id="gname">group name</h4>
                            </div>
                        </div>
                    </div>
                    <!-- Column -->
                    <div class="col-md-6 col-lg-2 col-xlg-3">
                        <div class="card card-hover">
                            <div class="box bg-success text-center">
                            <img src="${pageContext.request.contextPath}/resources/checkmateimg/icon1.1.png" height="150" width="150" alt="logo" />
                                <h1 class="font-light text-white"><i class="fas fa-chess-rook"></i></h1>
                                <h4 class="text-white">Dashboard</h4>
                            </div>
                        </div>
                    </div>                        
                    <!-- Column -->
                </div>
                 --%>
               <!-- ============================================================== -->
               <!-- Sales chart -->
            </div>


         </div>
         <!-- ============================================================== -->
         <!-- End Page wrapper  -->
         <!-- ============================================================== -->

         <!-- ============================================================== -->
         <!-- End Wrapper -->
      </div>
   </div>
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
      
      <!-- This Page JS -->
      <script 
         src="${pageContext.request.contextPath}/resources/template/assets/libs/select2/dist/js/select2.full.min.js"></script>
         
         <script src="${pageContext.request.contextPath}/resources/template/assets/libs/select2/dist/js/select2.min.js"></script>
         

      <script type="text/javascript">
    $(document).ready(function(){
       
       // group.jsp가 실행되면 밑에 그룹 리스트 뿌려주는 ajax 함수 실행되도록
       groupList();
       
       
       
		// 페이지가 로딩될 때 'Loading 이미지'를 숨긴다.
		$('#viewLoading').hide();

		
		$(document).ajaxStart(function(){
			$('#viewLoading').show();
		});
		$(document).ajaxStop(function(){
			$('#viewLoading').hide();
		});

    });
       
    function groupList(){
       $.ajax({
          url : "grouplist",
          type: "GET",
          data : {"g_no" : 0},
          dataType: "json",
          success : function(data){
         
          const groupList = data.aaData;
         
         var size = groupList.length;
         
         
            for(var i = 0; i < size; i++){
               
               if(groupList[i].g_flag == 1){
                  // 배경 초록색인거가 append 되는거
                  // $('#groupListDiv').append();
                  $('#groupListDiv').append("<div class='col-md-6 col-lg-2 col-xlg-3' style='float: none; margin: 0 auto;''><div class='card card-hover'>" + 
                        "<div class='ml-auto'><div class='tetx-right'>" +  
                        "<a class ='groupInfo'href='#' data-toggle='modal' data-target='#add-new-user' data-gno=" + groupList[i].g_no + 
                        " data-gname='" + groupList[i].g_name + "'>" + 
                        "<i class='fa fa-user-plus w-30px m-t-5'></i></a></div></div>" + 
                        "<div class='box bg-success text-center' onclick='gomain(this);'>" + 
                        "<h1 class='font-light text-white'><i class='fas fa-chess-king'></i></h1>" + 
                        "<h4 class='text-white'>" + groupList[i].g_name + "</h4></div></div></div>");
                  
               } else {
                  // 배경 파란색인거가 append 되는거
                  $('#groupListDiv').append("<div class='col-md-6 col-lg-2 col-xlg-3' style='float: none; margin: 0 auto;'><div class='card card-hover'>" + 
                     "<div class='ml-auto' style='display:none;'><div class='tetx-right'>" +  
                     "<a class ='groupInfo'href='#' data-toggle='modal' data-target='#add-new-user' data-gno=" + groupList[i].g_no + 
                     " data-gname='" + groupList[i].g_name + "'>" + 
                     "<i class='fa fa-user-plus w-30px m-t-5'></i></a></div></div>" + 
                     "<div class='box bg-cyan text-center' onclick='gomain(this);'><br>" + 
                     "<h1 class='font-light text-white'><i class='fas fa-chess-pawn'></i></h1>" + 
                     "<h4 class='text-white'>" + groupList[i].g_name + "</h4></div></div></div>");               
               }          
         }
            
          }, error: function(request, status, error){
             alert("통신실패");
          }
       });
    }
    
    function userList(g_no) {
       $.ajax({
          url : "user",
          type: "GET",
          data : {"g_no" : g_no},
          dataType: "json",
          success : function(data){
         
          const userList = data.aaData;
         
         var size = userList.length;
         
         
            for(var i = 0; i < size; i++){
               
               $('#userListSelect').append('<option value="'+userList[i].u_id+'">'+userList[i].u_id+'</option>');
      
         }
            
          }, error: function(request, status, error){
             alert("통신실패");
          }
       });
       
    }
   </script>
   <script> 
   
    $(document).ready(function(){
       $('#add-new-user').on('show.bs.modal', function(event) {
          var g_no = $(event.relatedTarget).data('gno');
          var g_name = $(event.relatedTarget).data('gname');
   
          $('#userListSelect').children('option').remove();
          
           userList(g_no);
          
          $('#selectedGno').val(g_no);
          $('#selectedGname').val(g_name);
      
       });
    });
    
    function userPlus() {
        
        var l = $("#userListSelect").select2().find(":selected").length;
        
        l *= 1;
        
       
      var g_no = $('#selectedGno').val();
      var g_name = $('#selectedGname').val();
      
        
        var groupArray = new Array(l);
          
        for(var i = 0; i < l; i++){
           groupArray[i] = new Array(3);
        }
        
        for(var i = 0; i < l; i++){
           
           groupArray[i][0] = g_no;
           groupArray[i][1] = g_name;
           groupArray[i][2] = $("#userListSelect").select2().find(":selected").eq(i).val();
           
           console.log(groupArray[i][0] + groupArray[i][1] + groupArray[i][2]);
           
        }
         /* 
        var send = new Object();
        
        send.grouplist = groupArray;
       */
      
       $.ajax({
          url : "userPlus",
          type: "POST",
          traditional : true,
          data : { 
             grouplist : groupArray
          },
          success : function(data){
             $('#add-new-user').modal('hide');
             alert(data);
          }, error: function(request, status, error){
             alert("인원추가 통신실패");
       
          }
    	});
       
  
    }         
   </script>
   
<!--    <script>
    $(document).ready(function(){
       $(groupListDiv).unbind("click").on("click", function(){          
          var g_no = $('#selectedGno').val();
          alert(g_no);
          g_no *= 1;
            $.ajax({
               url : "groupRead",
               type : "GET",
               traditional : true,
               data : {
                  g_no : g_no
               },
            });
         });
      });
   </script> -->
   
   <script>
   
   
   
   function gomain(thisVal) {
      var g_no = $(thisVal).parents().children(".ml-auto").children(".tetx-right").children(".groupInfo").data("gno");
       g_no *= 1;
         $.ajax({
            url : "groupRead",
            type : "GET",
            traditional : true,
            data : {
               g_no : g_no
            },
            success : function(data){
               location.href="main";
            }
         });
      }
    
   
   </script>
   
   
   
   <script>
      $(".select2").select2();
   </script>
</body>

</html>