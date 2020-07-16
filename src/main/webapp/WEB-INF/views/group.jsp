<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>그룹생성</title>
<style type="text/css"> 
/* 	body{
	background-color:#eeeeee;
	
	} */
			
     #group{ 
         text-align: center; 
         display: block; 
         margin: 0 auto; 
         font-size: 16px; 
         color: #999; 
     } 
     .title{ 
         font-family: 'Oswald', sans-serif; 
         font-size: 30px; 
         color: #216182; 
     } 
     #fm { 
         margin: 0 auto; 
         width: 459px; 
     } 
     input, textarea { 
         width: 439px; 
         height: 27px; 
         background-color: #efefef; 
         border-radius: 6px; 
         border: 1px solid #dedede; 
         padding: 10px; 
         margin-top: 3px; 
         font-size: 0.9em; 
         color: #3a3a3a; 
     } 
         input:focus, textarea:focus{ 
             border: 1px solid #97d6eb; 
         } 
     
     textarea{ 
         height: 60px; 
         background-color: #efefef; 
     } 
     #submit{ 
         width: 127px; 
         height: 48px; 
         text-align: center; 
         border: none; 
         margin-top: 20px; 
         cursor: pointer; 
     } 
     #submit:hover{ 
         color: #fff; 
         background-color: #216282; 
         opacity: 0.9; 
     } 
     #cancel { 
         width: 127px; height: 48px; 
         text-align: center; 
         border: none; 
         margin-top: 20px; 
         cursor: pointer; 
     } 
     #cancel:hover{ 
         color: #fff; 
         background-color: #216282; 
         opacity: 0.9; 
     }

    .modal { 
         position: fixed; 
         left: 0; 
         top: 0; 
         width: 100%; 
         height: 100%; 
         background-color: rgba(0, 0, 0, 0.5); 
         opacity: 0; 
         visibility: hidden; 
         transform: scale(1.1); 
         transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform 0.25s; 
     } 
     .modal-content { 
         position: absolute; 
         top: 50%; 
         left: 50%; 
         transform: translate(-50%, -50%); 
         background-color: white; 
         padding: 1rem 1.5rem; 
         width: 500px; 
         height: 350px; 
         border-radius: 0.5rem; 
     } 
     .close-button { 
         float: right; 
         width: 1.5rem; 
         line-height: 1.5rem; 
         text-align: center; 
         cursor: pointer; 
         border-radius: 0.25rem; 
         background-color: lightgray; 
     } 
     .close-button:hover { 
         background-color: darkgray; 
     } 
     .show-modal { 
         opacity: 1; 
         visibility: visible; 
         transform: scale(1.0); 
         transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s; 
     } 
  /* -------------------- */
   .col-lg-4 {
   		-webkit-box-flex: 0;
   		flex: 0 0 16.66667%;
    	max-width: 16.66667%;
    	width: 100%;
  		min-height: 1px;
    	padding-right: 10px;
    	padding-left: 10px;
    	margin-right:2px;
   	} 
   	.card {
    	margin-bottom: 20px;
    	display: flex;
    	-webkit-box-orient: vertical;
    	-webkit-box-direction: normal;
    	flex-direction: column;
    	min-width: 0;
    	background-color: #fff;
    	background-clip: border-box;
    	border: 0px solid transparent;
    	border-radius: 0px;
	}
	.card-hover:hover {
		    transform: translateY(-4px) scale(1.01);
	}
    .box {
   		border-radius: 5px;
    	padding: 30px;
	}
	.text-center {
    	text-align: center!important;
	}
	.bg-success {
   	 	background-color: #28b779!important;
	}
	.bg-manager {
    	background-color: #ffb848!important;
    }
	html body .font-light {
    	font-weight: 300;
	}
	.text-white {
    	color: #fff!important;
	}
	.row {
    	display: flex;
    	flex-wrap: wrap;
    	margin-right: -10px;
    	margin-left: -10px;
	}
  /* ------------------- */  
</style>
</head>
<body> 
<div id="group">
     <h1 class="title">Check&Mate</h1> 
     <!-- 버튼 --> 
     <button class="trigger">동아리 생성</button>   <br><br>
     <!-- 팝업 될 레이어 --> 
     <div class="modal"> 
         <div class="modal-content"> 
             <span class="close-button">&times;</span> 
             <h1 class="title">동아리 생성</h1> <br>
             <form id="fm" action="/groupcreate" method="POST">        
               <input type="text" name="g_name" placeholder="동아리 이름을 작성해 주세요" id="g_name" required="required"> 
               <input type="hidden" name="u_id" value="${user.u_id}"/>           
               <input type="button" id="cancel" value="취소"> 
               <input type="submit" id="submit" value="생성하기"> 
             </form> 
         </div> 
     </div>
</div>
	<div class="container-fluid">
     <div class="row">
     <!-- Column -->     
       <div class="col-lg-4" id="listTable">
           <div class="card card-hover">
              <div class="box bg-success text-center">
                  <h1 class="font-light text-white"><i class="mdi mdi-chart-areaspline"></i></h1>
                  <h6 class="text-white">Charts</h6>
              </div>
            </div>
        </div> 
        <!-- Column -->
       <div class="col-lg-4" id="listTable">
           <div class="card card-hover">
              <div class="box bg-manager text-center">
                  <h1 class="font-light text-white"><i class="mdi mdi-chart-areaspline"></i></h1>
                  <h6 class="text-white">Charts</h6>
              </div>
            </div>
        </div>          
        <!-- Column -->
       <div class="col-lg-4" id="listTable">
           <div class="card card-hover">
              <div class="box bg-success text-center">
                  <h1 class="font-light text-white"><i class="mdi mdi-chart-areaspline"></i></h1>
                  <h6 class="text-white">Charts</h6>
              </div>
            </div>
        </div> 
       </div>
      </div>        
<script type="text/javascript"> 
         var modal = document.querySelector(".modal"); 
         var trigger = document.querySelector(".trigger"); 
         var closeButton = document.querySelector(".close-button"); 
         var cancelButton = document.querySelector("#cancel");

        //console.log(modal);

        function toggleModal() { 
             modal.classList.toggle("show-modal"); 
         }

        function windowOnClick(event) { 
             if (event.target === modal) { 
                 toggleModal(); 
             } 
         }

        trigger.addEventListener("click", toggleModal); 
         closeButton.addEventListener("click", toggleModal); 
         cancel.addEventListener("click", toggleModal); 
         window.addEventListener("click", windowOnClick); 
     </script>
     <script>

     
     <!--Wave Effects -->
    <script src="${pageContext.request.contextPath}/resources/template/dist/js/waves.js"></script>
</body>
</html>