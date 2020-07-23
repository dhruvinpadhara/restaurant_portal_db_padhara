<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<%
response.addHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.addHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<head>
  <title>Restaurant web portal | ${param.title}</title>
  <!-- Toaster css -->
  <link rel="stylesheet" href="bundles/izitoast/css/iziToast.min.css">
  <!-- General CSS Files -->
  <link rel="stylesheet" href="css/app.min.css">
	
	<!-- data table css -->
	
 	<link rel="stylesheet" href="bundles/datatables/datatables.min.css">
  	<link rel="stylesheet" href="bundles/datatables/DataTables-1.10.16/css/dataTables.bootstrap4.min.css">
 
 <!-- file with image -->
   <link rel="stylesheet" href="bundles/dropzonejs/dropzone.css">
 
 <!-- date and time picker -->
 <link rel="stylesheet" href="bundles/bootstrap-daterangepicker/daterangepicker.css">
 <link rel="stylesheet" href="bundles/bootstrap-timepicker/css/bootstrap-timepicker.min.css">
 <!-- Searchable Dropdown -->
  <link rel="stylesheet" href="bundles/select2/dist/css/select2.min.css">
  <link rel="stylesheet" href="bundles/jquery-selectric/selectric.css">
 <!-- modal css -->
  <link rel="stylesheet" href="bundles/prism/prism.css">
 
 <!-- file upload css -->
 <link rel="stylesheet" href="css/main.css">
 <!-- Template CSS -->
 <link rel="stylesheet" href="css/style.css">
 <link rel="stylesheet" href="css/components.css">
 <link rel='shortcut icon' type='image/x-icon' href='img/RK_image.jpg'/>
  <!-- Custom style CSS -->
</head>
<body>
  <div class="loader"></div>
  <div id="app">
    <div class="main-wrapper main-wrapper-1">
      <div class="navbar-bg"></div>
      <nav class="navbar navbar-expand-lg main-navbar">
        <div class="form-inline mr-auto">
          <ul class="navbar-nav mr-3">
            <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg
									collapse-btn"> <i data-feather="align-justify"></i></a></li>
            <li>
            </li>
          </ul>
        </div>
        <ul class="navbar-nav navbar-right">
          <li class="dropdown dropdown-list-toggle">
          	<a href="#" data-toggle="dropdown" class="nav-link nav-link-lg message-toggle">
          		<i data-feather="mail"></i>
              	<!-- 	<span class="badge headerBadge1">1 </span> -->
            </a>
            <div class="dropdown-menu dropdown-list dropdown-menu-right pullDown">
              <div class="dropdown-list-content dropdown-list-message">
                  <a href="#" class="dropdown-item"> 
	                  	<span class="dropdown-item-avatar text-white">
	                  	  	<img alt="image" src="img/users/user-3.png" class="rounded-circle">
	                  	</span>
	                   <span class="dropdown-item-desc"> <span class="message-user">Jalpa Joshi</span> 
		                   <span class="time messege-text">Please do as specify.Let me know if you have any query.</span> 
		                   <span class="time">1 Days Ago</span>
                  		</span>
                	</a> 
              </div>
              <div class="dropdown-footer text-center">
                	<a href="#">View All <i class="fas fa-chevron-right"></i></a>
              </div>
            </div>
          </li>
          <li class="dropdown dropdown-list-toggle">
          		<a href="#" data-toggle="dropdown" class="nav-link notification-toggle nav-link-lg">
          			<i data-feather="bell"></i>
              		<!-- <span class="badge headerBadge2">3 </span> -->
              	</a>
            	<div class="dropdown-menu dropdown-list dropdown-menu-right pullDown">
		              <div class="dropdown-header">
		                Notifications
		                <div class="float-right">
		                  <a href="#">Mark All As Read</a>
		                </div>
		              </div>
		              <div class="dropdown-list-content dropdown-list-icons">
		                <a href="#" class="dropdown-item dropdown-item-unread"> <span
		                    class="dropdown-item-icon bg-primary text-white"> <i class="fas
														fa-code"></i>
		                  </span> <span class="dropdown-item-desc"> Template update is
		                    available now! <span class="time">2 Min
		                      Ago</span>
		                  </span>
		                </a>
		              </div>
		              <div class="dropdown-footer text-center">
		                <a href="#">View All <i class="fas fa-chevron-right"></i></a>
		              </div>
            	</div>
          </li>
          <li class="dropdown">
          		<a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user"> 
          			<img alt="image" src="img/RK_image.jpg" class="user-img-radious-style">
          			 <span class="d-sm-none d-lg-inline-block"></span>
          		</a>
            	<div class="dropdown-menu dropdown-menu-right pullDown"> 
              	<div class="dropdown-divider"></div>
              		<a href="file?i=33" class="dropdown-item has-icon"> 
	              		<i class="fas fa-key"></i>
	                	Change password
	          		</a>
              		<a href="file?i=0" class="dropdown-item has-icon text-danger"> 
	              		<i class="fas fa-sign-out-alt"></i>
	                	Logout
	          		</a>
            	</div>
          </li>
        </ul>
      </nav>
      
      <div class="main-sidebar sidebar-style-2">
        <aside id="sidebar-wrapper">
          <div class="sidebar-brand">
            <a href="#">
            	<span class="logo-name">R K Restaurant</span>
            </a>
          </div>
          <div class="sidebar-user">
            <div class="sidebar-user-picture">
              <img alt="image" src="img/RK_image.jpg">
            </div>
            <div class="sidebar-user-details">
            	<c:if test="${sessionScope.empname ne null }">
	              <div class="user-name">${sessionScope.empname}</div>
	              <div class="user-role"><b>${sessionScope.role}</b></div>
	            </c:if>
	            
	             <c:if test="${sessionScope.empname eq null }">
	            	<jsp:forward page="file?i=0"></jsp:forward>
	            </c:if>   
            </div>
          </div>
          
          <!-- Main Side bar -->
          <ul class="sidebar-menu">
            <li class="menu-header"></li>
            
            <li class="dropdown">
              <a href="#" class="nav-link has-dropdown"><i data-feather="monitor"></i><span>Dashboard</span></a>
              <ul class="dropdown-menu">
                <li><a class="nav-link" href="file?i=1" onclick="log(${sessionScope.empid},'home page')">home page</a></li>
                <li><a class="nav-link" href="file?i=14" onclick="log(${sessionScope.empid},'User registration')">User registration</a></li>
              </ul>
            </li>
            
            <c:if test="${sessionScope.role == 'Admin' }">
		            <li class="dropdown">
		              <a class="nav-link has-dropdown"><i class="fa fa-list"></i><span>Employee</span></a>
		              <ul class="dropdown-menu">
		                <li><a class="nav-link" href="file?i=8" onclick="log(${sessionScope.empid},'Role')">Role</a></li>
		                <li><a class="nav-link" href="file?i=11" onclick="log(${sessionScope.empid},'Employee')">Employee</a></li>
		              </ul>
		            </li>
		    </c:if>
            
            <li class="dropdown">
              <a class="nav-link has-dropdown"><i class="material-icons">location_on</i><span>location</span></a>
              <ul class="dropdown-menu">
                <li><a class="nav-link" href="file?i=2" onclick="log(${sessionScope.empid},'State')">State</a></li>
                <li><a class="nav-link" href="file?i=3" onclick="log(${sessionScope.empid},'City')">City</a></li>
                <li><a class="nav-link" href="file?i=4" onclick="log(${sessionScope.empid},'Area')">Area</a></li>
              </ul>
            </li>
            
            <li class="dropdown">
              <a class="nav-link has-dropdown"><i class="material-icons">restaurant_menu</i><span>Menu</span></a>
              <ul class="dropdown-menu">
                <li><a class="nav-link" href="file?i=5" onclick="log(${sessionScope.empid},'Menu')">Menu</a></li>
                <li><a class="nav-link" href="file?i=6" onclick="log(${sessionScope.empid},'Sub-menu')">Sub-menu</a></li>
              </ul>
            </li>
            
            <li class="dropdown">
              <a href="file?i=20" onclick="log(${sessionScope.empid},'kitchen')"><i class="material-icons">kitchen</i><span>Kitchen Screen</span></a>
            </li>
            
			<li class="dropdown">
              <a class="nav-link has-dropdown"><i data-feather="grid"></i><span>Table</span></a>
              <ul class="dropdown-menu">
                <li><a class="fa" href="file?i=7" onclick="log(${sessionScope.empid},'Table')">Table</a></li>
              </ul>
            </li>
            
            <c:if test="${sessionScope.role == 'Admin' }">
	            <li class="dropdown">
	              <a class="nav-link has-dropdown"><i data-feather="grid"></i><span>Log</span></a>
	              <ul class="dropdown-menu">
	                <li><a class="fa" href="file?i=34" onclick="log(${sessionScope.empid},'Login_user')">Login_user</a></li>
	                <li><a class="fa" href="file?i=36" onclick="log(${sessionScope.empid},'Transaction_page')">Transaction_page</a></li>
	              </ul>
	            </li>  
            </c:if>
            
            <c:if test="${sessionScope.role == 'Admin' }">
	            <li class="dropdown">
	              <a class="nav-link has-dropdown"><i data-feather="grid"></i><span>Report</span></a>
	              <ul class="dropdown-menu">
	              	<li><a class="nav-link" href="file?i=24" onclick="log(${sessionScope.empid},'Today's Order')">Today's Order</a></li>
	              	<li><a class="nav-link" href="file?i=30" onclick="log(${sessionScope.empid},'Current Month Order')">Current Month Order</a></li>
	              	<li><a class="nav-link" href="file?i=32" onclick="log(${sessionScope.empid},'Current Year Order')">Current Year Order</a></li>
	                <li><a class="nav-link" href="file?i=29" onclick="log(${sessionScope.empid},'Order history')">Order history</a></li>
	              </ul>
	            </li>
			</c:if>
          
          </ul>
        </aside>
      </div>
      
      <!-- close Side bar -->
      
      <!-- Main Content -->
      <div class="main-content">
        	<c:if test="${param.p ne null }">
        	  <c:import url="${param.p }.jsp"></c:import>
         	</c:if>
        
		<!-- close Main content -->
			<div class="settingSidebar">
          
        	</div>
      </div>
      <!-- Footer -->
      <footer class="main-footer">
        <div class="footer-left">
          Copyright &copy; 2019 
        </div>
        <div class="footer-right">
        </div>
      </footer>
  	</div>
</div>
  
  <script src="js/app.min.js"></script>

	<!-- file Upload control; -->
	<script src=js/vendor.js> </script> 
     <script src=js/main.1.js> </script>
	
	<!-- Modal JS -->
	<script src="bundles/prism/prism.js"></script>
	
	<!-- toaster  -->
	<script src="bundles/izitoast/js/iziToast.min.js"></script>
  	<!-- Page Specific JS File -->
 	 <script src="js/page/toastr.js"></script>
	
	
	
	<!-- column visibility -->
	<script src="js/buttons.colVis.min.js"></script>
  
  <script src="bundles/datatables/datatables.min.js"></script>
  <script src="bundles/datatables/DataTables-1.10.16/js/dataTables.bootstrap4.min.js"></script>
  <script src="bundles/datatables/export-tdables/dataTables.buttons.min.js"></script>
  <script src="bundles/datatables/export-tables/buttons.flash.min.js"></script>
  <script src="bundles/datatables/export-tables/jszip.min.js"></script>
  <script src="bundles/datatables/export-tables/pdfmake.min.js"></script>
  <script src="bundles/datatables/export-tables/vfs_fonts.js"></script>
  <script src="bundles/datatables/export-tables/buttons.print.min.js"></script>
  
  <!-- calling this -->
  <script src="js/page/datatables.js"></script>

<!-- date picker -->
<script src="bundles/bootstrap-daterangepicker/daterangepicker.js"></script>	
<script src="bundles/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>

 
 <!-- searchable dropdown -->
  <script src="bundles/select2/dist/js/select2.full.min.js"></script>
  <script src="bundles/jquery-selectric/jquery.selectric.min.js"></script>
 
 
  <!-- Page Specific JS File -->
  
    <script src="bundles/sweetalert/sweetalert.min.js"></script>
  <script src="js/page/sweetalert.js"></script>
  
  <!-- Template JS File -->
  <script src="js/scripts.js"></script>
  
  <!-- Custom JS File -->
  <script src="js/custom.js"></script>
</body>
</html>