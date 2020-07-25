<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${empty group }">
      <c:redirect url="checkmate"/>
</c:if>
<html>
<body>

        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        
        <header class="topbar" data-navbarbg="skin5">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                <div class="navbar-header" data-logobg="skin5">
                    <!-- This is for the sidebar toggle which is visible on mobile only -->
                    <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
                    <!-- ============================================================== -->
                    <!-- Logo -->
                    <!-- ============================================================== -->
                    <a class="navbar-brand" href="main">
                        <!-- Logo icon -->
                        <b class="logo-icon p-l-10">
                            <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                            <!-- Dark Logo icon -->
                            <img src="${pageContext.request.contextPath}/resources/checkmateimg/checkmate_logo.png" alt="homepage" class="light-logo" />
                           
                        </b>
                        <!--End Logo icon -->
                         <!-- Logo text -->
                        <span class="logo-text">
                             <!-- dark Logo text -->
                             <img src="${pageContext.request.contextPath}/resources/checkmateimg/checkmate_logo_text.png" alt="homepage" class="light-logo" />
                            
                        </span>
                        <!-- Logo icon -->
                        <!-- <b class="logo-icon"> -->
                            <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                            <!-- Dark Logo icon -->
                            <!-- <img src="../../assets/images/logo-text.png" alt="homepage" class="light-logo" /> -->
                            
                        <!-- </b> -->
                        <!--End Logo icon -->
                    </a>
                    <!-- ============================================================== -->
                    <!-- End Logo -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- Toggle which is visible on mobile only -->
                    <!-- ============================================================== -->
                    <a class="topbartoggler d-block d-md-none waves-effect waves-light" href="javascript:void(0)" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><i class="ti-more"></i></a>
                </div>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav float-left mr-auto">
                        <li class="nav-item d-none d-md-block"><a class="nav-link sidebartoggler waves-effect waves-light" href="javascript:void(0)" data-sidebartype="mini-sidebar"><i class="mdi mdi-menu font-24"></i></a></li>
                        <!-- ============================================================== -->
                        <!-- create new -->
                        <!-- ============================================================== -->
                    </ul>
                    <!-- ============================================================== -->
                    <!-- Right side toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav float-right">
                        <!-- ============================================================== -->
                        <!-- Comment -->
                        <!-- ============================================================== -->

                        <!-- ============================================================== -->
                        <!-- End Comment -->
                        <!-- ============================================================== -->
                        <!-- ============================================================== -->
                        <!-- Messages -->
                        <!-- ============================================================== -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle waves-effect waves-dark" href="" id="2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="mdi mdi-bell font-24"></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right mailbox animated bounceInDown" aria-labelledby="2">
                                <ul class="list-style-none">
                                    <li>
                                        <div class="">
                                             <!-- Message -->
                                            <a href="javascript:void(0)" class="link border-top">
                                                <div class="d-flex no-block align-items-center p-10">
                                                    <span class="btn btn-success btn-circle"><i class="ti-calendar"></i></span>
                                                    <div class="m-l-10">
                                                        <h5 class="m-b-0">Event today</h5> 
                                                        <span class="mail-desc">Just a reminder that event</span> 
                                                    </div>
                                                </div>
                                            </a>
                                            <!-- Message -->
                                            <a href="javascript:void(0)" class="link border-top">
                                                <div class="d-flex no-block align-items-center p-10">
                                                    <span class="btn btn-info btn-circle"><i class="ti-settings"></i></span>
                                                    <div class="m-l-10">
                                                        <h5 class="m-b-0">Settings</h5> 
                                                        <span class="mail-desc">You can customize this template</span> 
                                                    </div>
                                                </div>
                                            </a>
                                            <!-- Message -->
                                            <a href="javascript:void(0)" class="link border-top">
                                                <div class="d-flex no-block align-items-center p-10">
                                                    <span class="btn btn-primary btn-circle"><i class="ti-user"></i></span>
                                                    <div class="m-l-10">
                                                        <h5 class="m-b-0">Pavan kumar</h5> 
                                                        <span class="mail-desc">Just see the my admin!</span> 
                                                    </div>
                                                </div>
                                            </a>
                                            <!-- Message -->
                                            <a href="javascript:void(0)" class="link border-top">
                                                <div class="d-flex no-block align-items-center p-10">
                                                    <span class="btn btn-danger btn-circle"><i class="fa fa-link"></i></span>
                                                    <div class="m-l-10">
                                                        <h5 class="m-b-0">Luanch Admin</h5> 
                                                        <span class="mail-desc">Just see the my new admin!</span> 
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <!-- ============================================================== -->
                        <!-- End Messages -->
                        <!-- ============================================================== -->

                        <!-- ============================================================== -->
                        <!-- User profile and search -->
                        <!-- ============================================================== -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="${pageContext.request.contextPath}/resources/checkmateimg/checkmate_logo.png" alt="user" class="rounded-circle" width="31">
                            ${group.u_id}
                            </a>
                            <div class="dropdown-menu dropdown-menu-right user-dd animated">
                                <a class="dropdown-item" href="mypage"><i class="ti-user m-r-5 m-l-5"></i> 마이페이지</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="group"><i class="fas fa-chess m-r-5 m-l-5"></i> 그룹 선택</a>
                                <div class="dropdown-divider"></div>                                
                                <a class="dropdown-item" href="logout"><i class="fa fa-power-off m-r-5 m-l-5"></i> Logout</a>
                                <!-- 그룹관리 -->
                                <c:if test="${group.g_flag == 1}">
                                <div class="dropdown-divider"></div>                                
                                <a class="dropdown-item" data-toggle="modal" data-target="#ModalGroupLock"><i class="fa fa-lock m-r-5 m-l-5"></i> 그룹 폐쇄</a>
                                </c:if>
                                
                            </div>
                        </li>
                        <!-- ============================================================== -->
                        <!-- User profile and search -->
                        <!-- ============================================================== -->
                    </ul>
                </div>
            </nav>
        </header>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        
        
                 <div class="modal fade" id="ModalGroupLock" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalLabel" aria-hidden="true ">
					<div class="modal-dialog" role="document ">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">그룹 폐쇄</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true ">&times;</span>
								</button>
							</div>
							
							
							
                        <div class="modal-body">
                           <div class="row">
                              <div class="col-md-12" style="text-align: center;">
                                 <div class="control-label">그룹 폐쇄를 선택하시면 해당 그룹이 폐쇄됩니다.</div>
                                 <br>
                                 
                                 <div class="control-label">계속 하시겠습니까?</div>
                              </div>
                           </div>
                        </div>
                        <div class="modal-footer">
                           <button type="submit"
                              class="btn btn-danger waves-effect waves-light save-category" onclick="groupLock();">폐쇄</button>
                           <button type="button" class="btn btn-secondary waves-effect"
                              data-dismiss="modal">취소</button>
                        </div>
							
							
                            
                            
							<!-- <div class="modal-body">Here is the text coming you can put
								also image if you want…</div> -->
						</div>
					</div>
				</div>
        
        <script>
        function groupLock(){
            	location.href="grouplock";
            }
        </script>
        
</body>
</html>