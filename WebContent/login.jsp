
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">


<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>R K Restaurant</title>
  
   <!-- Toaster css -->
  <link rel="stylesheet" href="bundles/izitoast/css/iziToast.min.css">
  <!-- General CSS Files -->
  <link rel="stylesheet" href="css/app.min.css">
  <link rel="stylesheet" href="bundles/bootstrap-social/bootstrap-social.css">
  <!-- Template CSS -->
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/components.css">
  <link rel='shortcut icon' type='image/x-icon' href='img/RK_image.jpg'/>
</head>

<body  style="background-image: url('img/Gujarati.jpg'); background-repeat: no-repeat; background-attachment: fixed; height: 100%; width: 100%;">
  <div class="loader"></div>
  <div id="app">
    <section class="section">
      <div class="container mt-5">
        <div class="row">
          <div class="col-12 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
            <div class="card card-primary">
              <div style="margin-top: 20px; text-align: center;">
                <h4>Employee Login</h4>
              </div>
              <div class="card-body">
                <form method="POST" action="insert" autocomplete="off">
                  <input type="hidden" name="i" value=0>
                  <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email_id" name="email" tabindex="1" placeholder="enter email address">
                  </div>
                  <div class="form-group">
                    <div class="d-block">
                      <label for="password" class="control-label">Password</label>
                    </div>
                    <input id="passwd" type="password" class="form-control" name="password" tabindex="2" placeholder="enter password">
                    <div class="invalid-feedback">
                      please fill in your password
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <button type="submit" onclick="return save()" class="btn btn-primary btn-lg btn-block" tabindex="4">
                      Login
                    </button>
                  </div>
                  <div class="">
                      <br>&nbsp;
  					 <span class="float-left red">           
                 	<%
					if(session.getAttribute("msg")!=null)
					{
						//out.print(session.getAttribute("user"));
						out.print(session.getAttribute("msg"));
						session.removeAttribute("msg");
					}
                 	if(session.getAttribute("empname")!=null){
                 		session.removeAttribute("empname");
                 		session.removeAttribute("empid");
                 		session.removeAttribute("role");
                 	}
                 	if(session.getAttribute("empemail")!=null){
                 		session.removeAttribute("empemail");
                 	}
				%>
				</span>
 					<a href="file?i=25" class="text-small float-left">
                          Forgot Password
                     </a> 
                        <!-- <a href="file?i=19" class="text-small float-right">
                          User login
                        </a> -->
                      </div> 
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
  <!-- General JS Scripts -->
  <script src="js/app.min.js"></script>
   <script src="js/pg_js/login.js"></script>
  <!-- Template JS File -->
  <script src="js/scripts.js"></script>
	<!-- toaster  -->
	<script src="bundles/izitoast/js/iziToast.min.js"></script>
  <!-- Page Specific JS File -->
  <script src="js/page/toastr.js"></script>
	
</body>


</html>