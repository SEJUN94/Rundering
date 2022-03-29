<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ page trimDirectiveWhitespaces="true" %>


		<aside class="main-sidebar sidebar-dark-primary elevation-4" id="sidebar">
			<!-- Brand Logo -->
			<a href="<%=request.getContextPath() %>/main.do" class="brand-link">
				<img src="<%=request.getContextPath() %>/resources/image/Favicon6.svg" alt="Rundering Logo"
					class="brand-image img-circle elevation-3" style="opacity: .8">
				<span class="brand-text font-weight-light"><strong>Rundering</strong></span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">


				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column subMenuList" data-widget="treeview" role="menu">
						<li class="nav-item menu-is-opening menu-open"><a href="#" class="nav-link"> <i
									class="nav-icon fas fa-file"></i>
								<p>
									메인메뉴 <i class="fas fa-angle-left right"></i>
								</p>
							</a>
							<ul class="nav nav-treeview" style="display: block;">
								<li class="nav-item"><a href="../mailbox/mailbox.html" class="nav-link"> <i
											class="far fa-circle nav-icon"></i>
										<p>서브메뉴1</p>
									</a></li>
								<li class="nav-item"><a href="../mailbox/compose.html" class="nav-link"> <i
											class="far fa-circle nav-icon"></i>
										<p>서브메뉴2</p>
									</a></li>
								<li class="nav-item"><a href="../mailbox/read-mail.html" class="nav-link"> <i
											class="far fa-circle nav-icon"></i>
										<p>서브메뉴3</p>
									</a></li>
							</ul>
						</li>
					</ul>
				</nav>
				<!-- /.sidebar-menu -->

			</div>
			<!-- /.sidebar -->
		</aside>