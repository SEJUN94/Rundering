<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ page trimDirectiveWhitespaces="true" %>


		<aside class="main-sidebar sidebar-dark-primary elevation-4" id="sidebar">
			<!-- Brand Logo -->
			<a href="<%=request.getContextPath() %>/branch/main.do" class="brand-link">
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
                                    <a href="<%=request.getContextPath() %>/branch/laundry/situatuionlist.do" class="nav-link">
                                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;세탁 현황</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="<%=request.getContextPath() %>/branch/laundry/storeslist.do" class="nav-link">
                                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;세탁 품목 조회</p>
                                    </a>
                                </li>
                            </ul>
                        </li>   
                         <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-bars"></i>
                                <p>
                           		         세탁용품 관리
                           		     <i class="right fas fa-angle-left"></i>
                                </p>
                                 
                            </a>
                            <ul class="nav nav-treeview">
                            	<li class="nav-item">
                                    <a href="#" class="nav-link">
                                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;세탁용품 관리</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="<%=request.getContextPath() %>/branch/iteamorder/regist.do" class="nav-link">
                                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;세탁용품 발주</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="<%=request.getContextPath() %>/branch/iteamorder/list.do" class="nav-link">
                                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;발주 내역</p>
                                    </a>
                                </li>
                            </ul>
                          
                        </li>   
                         <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-bars"></i>
                                <p>
                           		         세탁비품 관리
                           		     <i class="right fas fa-angle-left"></i>
                                </p>
                                 
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="#" class="nav-link">
                                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;세탁비품 관리</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                   <a href="<%=request.getContextPath()%>/branch/asrequest/list.do" class="nav-link">
                             	 	  <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비품 AS요청</p>
									</a>
                                </li>
                            </ul>
                          
                        </li>   
                        	<li class="nav-item"><a
						href="<%=request.getContextPath()%>/branch/board/noticelist.do"
						class="nav-link">
						  <i class="nav-icon fas fa-bars"></i>
							<p>공지사항</p>
					</a>
					</li>
					<li class="nav-item"><a
						href="<%=request.getContextPath()%>/branch/board/suggestlist.do"
						class="nav-link">
						  <i class="nav-icon fas fa-bars"></i>
							<p>본사 건의</p>
					</a>
					</li>
                        <li class="nav-item">
                                    <a href="<%=request.getContextPath() %>/branch/financial/saleslist.do" class="nav-link">
                                    <i class="nav-icon fas fa-bars"></i>
                                        <p>매출 조회</p>
                                    </a>
                                </li>
                          
                           <li class="nav-item">
                            <a href="<%=request.getContextPath() %>/branch/member/list.do" class="nav-link">
                                <i class="nav-icon fas fa-bars"></i>
                                <p>
                                    회원 조회
                                </p>
                            </a>
                        </li>   
                       
					
					</ul>
				</nav>
				<!-- /.sidebar-menu -->

			</div>
			<!-- /.sidebar -->
		</aside>