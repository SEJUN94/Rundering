<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page trimDirectiveWhitespaces="true" %>


        <aside class="main-sidebar sidebar-dark-primary elevation-4" id="sidebar">
            <!-- Brand Logo -->
            <a href="<%=request.getContextPath() %>/admin/main.do" class="brand-link">
                <img src="<%=request.getContextPath() %>/resources/image/Favicon6.svg" alt="Rundering Logo"
                    class="brand-image img-circle elevation-3" style="opacity: .8">
                <span class="brand-text"><strong>Rundering</strong></span>
            </a>

            <!-- Sidebar -->
            <div class="sidebar">
                <!-- Sidebar Menu -->
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column subMenuList" data-widget="treeview" role="menu" style="font-size: 1.18rem;">
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-bars"></i>
                                <p>
                                    세탁 관리
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="<%=request.getContextPath() %>/admin/laundryorder.do" class="nav-link">
                                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;세탁 주문 관리</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="<%=request.getContextPath() %>/admin/laundryitems.do" class="nav-link">
                                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;세탁 품목 관리</p>
                                    </a>
                                </li>
                            </ul>
                        </li>   
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-bars"></i>
                                <p>
                                    지점 관리
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="<%=request.getContextPath() %>/admin/point/information.do" class="nav-link">
                                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;지점 전체 조회</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="<%=request.getContextPath() %>/admin/point/quota.do" class="nav-link">
                                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;지점 세탁 현황</p>
                                    </a>
                                </li>
                                <li class="nav-item">

                                    <a href="<%=request.getContextPath() %>/admin/laundryamount.do" class="nav-link">
                                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;지점 세탁량</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                          <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-bars"></i>
                                <p>
                                    발주 관리
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="<%=request.getContextPath() %>/admin/branchorder.do" class="nav-link">
                                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;지점 발주 관리</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="<%=request.getContextPath() %>/admin/ordergoods/list.do" class="nav-link">
                                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;발주 물품 관리</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-bars"></i>
                                <p>
                                    회원 관리
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="<%=request.getContextPath() %>/admin/customer/list.do" class="nav-link">
                                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원 목록</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="<%=request.getContextPath() %>/admin/customer/dormant.do" class="nav-link">
                                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;휴면계정 관리</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                     <a href="<%=request.getContextPath() %>/admin/customer/secession.do" class="nav-link">
                                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;탈퇴회원 관리</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link"> 
                                <i class="nav-icon fas fa-bars"></i>
                                <p>
                                    회사 게시판 관리
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="<%=request.getContextPath() %>/admin/board/noticelist.do" class="nav-link">
                                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공지사항</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="<%=request.getContextPath() %>/admin/board/suggest.do" class="nav-link">
                                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;건의사항</p>
                                    </a>
                                </li>
                            </ul>
                        </li><li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-bars"></i>
                                <p>
                                    고객 홈페이지 관리
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="<%=request.getContextPath() %>/admin/question/frequently.do" class="nav-link">
                                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;자주묻는질문</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="<%=request.getContextPath() %>/admin/question/list.do" class="nav-link">
                                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;문의답변</p>
                                    </a>
                                </li>
                            </ul>
                        </li>

                    </ul>
                </nav>
                <!-- /.sidebar-menu -->

            </div>
            <!-- /.sidebar -->
        </aside>