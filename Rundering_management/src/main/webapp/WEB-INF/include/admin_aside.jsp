<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                           <c:if test="${not empty mainMenuList }">
               <c:forEach items="${mainMenuList }" var="mainMenu">
               
                  <li class="nav-item">
                            <a href="javascript:goPage('<%=request.getContextPath()%>${mainMenu.menuUrl}','${mainMenu.menuCode}');" class="nav-link">
                                <i class="nav-icon fas fa-bars"></i>
                                <p> 
                                         ${mainMenu.menuName}
                                     <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <c:if test="${not empty subMenuList}">
                               <c:forEach items="${subMenuList}" var="subMenu">
                                  <c:if test="${mainMenu.menuCode eq subMenu.upperMenuCode}" >
                                     <ul class="nav nav-treeview">
                                     
                                         <li class="nav-item">
                                             <a href="javascript:goPage('<%=request.getContextPath()%>${subMenu.menuUrl}','${subMenu.menuCode}');" class="nav-link">
                                                 <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${subMenu.menuName}</p>
                                             </a>
                                         </li>
                                         
                                     </ul>
                                  </c:if>
                               </c:forEach>
                            </c:if>
                        </li> 
                        
               </c:forEach>
            </c:if>
                    </ul>
                </nav>
                <!-- /.sidebar-menu -->

            </div>
            <!-- /.sidebar -->
        </aside>