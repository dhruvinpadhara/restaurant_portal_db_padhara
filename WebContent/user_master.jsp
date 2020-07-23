<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Restaurant</title>
    
	<link rel="stylesheet" href="css/app.min.css">
    <link rel="stylesheet" href="css1/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css1/animate.css">
    

  <!-- Custom style CSS for use menu -->
  <link rel="stylesheet" href="css/custom.css">      

  <link rel="stylesheet" href="bundles/izitoast/css/iziToast.min.css">    
    
    <link rel="stylesheet" href="css1/owl.carousel.min.css">
    <link rel="stylesheet" href="css1/owl.theme.default.min.css">
    <link rel="stylesheet" href="css1/magnific-popup.css">

	 <link rel="stylesheet" href="css/style.css">
	 <link rel="stylesheet" href="css/components.css">
	
    <link rel="stylesheet" href="css1/aos.css">

    <link rel="stylesheet" href="css1/ionicons.min.css">
	
	<link rel='shortcut icon' type='image/x-icon' href='img/RK_image.jpg'>
    
    <link rel="stylesheet" href="css1/flaticon.css">
    <link rel="stylesheet" href="css1/icomoon.css">
    <link rel="stylesheet" href="css1/style.css">
  
  </head>
  
  <body>
  
	   <nav style="margin-top: 0% !important;" class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="#">Restaurant</a>
	      
		
	      <div class="collapse navbar-collapse menu" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	        	<li class="nav-item active"><a href="file?i=15" class="nav-link">Home</a></li>
	        	<li class="nav-item"><a href="#" class="nav-link">About</a></li>
	        	<li class="nav-item"><a href="file?i=17" class="nav-link">Menu</a></li>
	          	<li class="nav-item position-relative list"><a href="file?i=17" class="nav-link">Order</a>
	          		<ul class="position-absolute list-unstyled">
	          			<li class="float-left"><a href="file?i=35" class="nav-link">&nbsp;Order</a></li>
		          		<li class="float-left"><a href="file?i=18" class="nav-link"><i class="fas fa-cart-plus"></i>&nbsp;Order cart</a></li>	
	          		</ul>
	          	</li>
	          	<li class="nav-item position-relative list"><a href="file?i=17" class="nav-link"><i class="fas fa-user"></i>&nbsp;${sessionScope.username }&nbsp;</a>
	          		<ul class="position-absolute list-unstyled">
	          			<li class="float-left"><a class="nav-link" href="file?i=33">Change password</a></li>
		          		<li class="float-left"><a class="nav-link" href="file?i=19"><i class="fas fa-sign-out-alt"></i>&nbsp;Logout</a></li>
	          		</ul>
	          	</li>
	        </ul>
	      </div>
	    </div>
	  </nav>  
	    
	  
    <!-- END nav -->
    			<%-- <c:if test="${sessionScope.username ne null }">
	              <div class="user-name">${sessionScope.username}</div>
	              <div class="user-role">${sessionScope.userid}</div>
	            </c:if> --%>
	             
	            <c:if test="${sessionScope.username eq null }">
	            	<jsp:forward page="file?i=19"></jsp:forward>
	            </c:if> 
    <section class="home-slider owl-carousel js-fullheight">
      <div class="slider-item js-fullheight" style="background-image: url(img/punjabi2.jpg);">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row slider-text js-fullheight justify-content-center align-items-center" data-scrollax-parent="true">

            <div class="col-md-12 col-sm-12 text-center ftco-animate">
            	<span class="subheading">Restaurant</span>
              <h1 class="mb-4">Best Restaurant</h1>
            </div>

          </div>
        </div>
      </div>

      <div class="slider-item js-fullheight" style="background-image: url(img/Gujarati.jpg);">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row slider-text js-fullheight justify-content-center align-items-center" data-scrollax-parent="true">

            <div class="col-md-12 col-sm-12 text-center ftco-animate">
            	<span class="subheading">Restaurant</span>
              <h1 class="mb-4">Nutritious &amp; Tasty</h1>
            </div>

          </div>
        </div>
      </div>

      
      <div class="slider-item js-fullheight" style="background-image: url(img/punjabi.jpg);">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

            <div class="col-md-12 col-sm-12 text-center ftco-animate">
            	<span class="subheading">Restaurant</span>
              <h1 class="mb-4">Delicious Specialties</h1>
            </div>

          </div>
        </div>
      </div>
    </section>

	<c:if test="${param.m ne null }">
		<c:import url="${param.m }.jsp"></c:import>
	</c:if>

		        
	 <footer class="ftco-footer ftco-bg-dark ftco-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-6 col-lg-6">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Rk restaurant</h2>
              <p>Far far away, behind the word mountains</p>
            </div>
          </div>
          <div class="col-md-6 col-lg-6">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Open Hours</h2>
              <ul class="list-unstyled open-hours">
                <li class="d-flex"><span>Monday</span><span>10:00 - 23:00</span></li>
                <li class="d-flex"><span>Tuesday</span><span>10:00 - 23:00</span></li>
                <li class="d-flex"><span>Wednesday</span><span>10:00 - 23:00</span></li>
                <li class="d-flex"><span>Thursday</span><span>10:00 - 23:00</span></li>
                <li class="d-flex"><span>Friday</span><span>10:00 - 23:00</span></li>
                <li class="d-flex"><span>Saturday</span><span>10:00 - 23:00</span></li>
                <li class="d-flex"><span>Sunday</span><span> 10:00 - 23:00</span></li>
              </ul>
            </div>
          </div>
        </div>
        <div class="row">

        </div>
      </div>
    </footer>  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


	
  <script src="js1/jquery.min.js"></script>
  <script src="js1/jquery-migrate-3.0.1.min.js"></script>
  <script src="js1/popper.min.js"></script>
  <script src="js1/bootstrap.min.js"></script>
  <script src="js1/jquery.easing.1.3.js"></script>
  <script src="js1/jquery.waypoints.min.js"></script>
  <script src="js1/jquery.stellar.min.js"></script>
  <script src="js1/owl.carousel.min.js"></script>
  <script src="js1/jquery.magnific-popup.min.js"></script>
  <script src="js1/aos.js"></script>
  <script src="js1/jquery.animateNumber.min.js"></script>
 
  <script src="js1/scrollax.min.js"></script>
  <script src="js1/main.js"></script>
    
  </body>
</html>