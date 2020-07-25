<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<body>
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <aside class="left-sidebar" data-sidebarbg="skin5">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav" class="p-t-30">
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="main" aria-expanded="false"><i class="mdi mdi-view-dashboard"></i><span class="hide-menu">Dashboard</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="information" aria-expanded="false"><i class="mdi mdi-boombox"></i><span class="hide-menu">공지사항</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="homeworklist" aria-expanded="false"><i class="mdi mdi-owl"></i><span class="hide-menu">숙제</span></a></li>
                        
                        <!-- 출결관리 사이드 시작-->
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="attend" aria-expanded="false"><i class="mdi mdi-emoticon"></i><span class="hide-menu">출석</span></a></li>
                        <!-- 출결관리 끝 -->
                        
                        <!-- 그룹관리 -->
<%--                         <c:if test="${group.g_flag == 1}">
                        	<li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="management" aria-expanded="false"><i class="mdi mdi-wrench"></i><span class="hide-menu">그룹 관리</span></a></li>
                        </c:if> --%>
                        
                        
                    </ul>
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->

</body>
</html>