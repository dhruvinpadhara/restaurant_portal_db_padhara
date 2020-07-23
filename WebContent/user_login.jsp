<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">


<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>R K Restaurant</title>
  <!-- General CSS Files -->
  
     <!-- Toaster css -->
  <link rel="stylesheet" href="bundles/izitoast/css/iziToast.min.css">
  <link rel="stylesheet" href="css/app.min.css">
  <link rel="stylesheet" href="bundles/bootstrap-social/bootstrap-social.css">
  <!-- Template CSS -->
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/components.css">
  <link rel='shortcut icon' type='image/x-icon' href='img/RK_image.jpg'/>
</head>

<body style="background-image: url('img/Gujarati.jpg'); background-repeat: no-repeat; background-attachment: fixed; height: 100%; width: 100%;" >
  <div class="loader"></div>
  <div id="app">
    <section class="section">
            <div class="container mt-5">
        <div class="row">
          <div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
            <div class="card card-primary">
              <div style="margin-top: 20px; text-align: center;">
                <h4>User Login</h4>
              </div>
              <div class="card-body">
                <form method="POST" action="insert">
                  <input type="hidden" name="i" value=18>
                  <div class="form-group">
                    <label for="email">Email</label>
                    <input type="text" class="form-control" name="uemail" id="email_id" placeholder="enter email address">
                    <div class="invalid-feedback">
                      Please fill in your email
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="d-block">
                      <label for="password" class="control-label">Password</label>
                    </div>
                    <input type="password" class="form-control" name="upassword" id="passwd" placeholder="enter password" >
                  </div>
                  
                  <div class="form-group">
                    <button type="submit" onclick="return save()" class="btn btn-primary btn-lg btn-block" >
                      Login
                    </button>
                  </div>
                      &nbsp;
  					 <span style="color: red;">           
		                 <%
		                 
		                 if(session.getAttribute("username")!=null){
							session.removeAttribute("username");
							session.removeAttribute("userid");
		                 }
							
		                 if(session.getAttribute("msg")!=null)
						{
							//out.print(session.getAttribute("user"));
							out.print(session.getAttribute("msg"));
							session.removeAttribute("msg");
						}
							
		                 if(session.getAttribute("useremail")!=null){
		                 	session.removeAttribute("useremail");
		                 }
						%>
					</span>
					<br><br>
					<div>
						<a href="file?i=25" class="text-small float-left">
                          Forgot Password
                     	</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="file?i=16" class="text-small float-right">
                          Sign Up?
                        </a>
                         <!-- <a href="file?i=0" class="text-small float-right">
                          admin login
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

  	<!-- toaster  -->
	<script src="bundles/izitoast/js/iziToast.min.js"></script>
  <!-- Page Specific JS File -->
  <script src="js/page/toastr.js"></script>

  <!-- Template JS File -->
  <script src="js/scripts.js"></script>
</body>
</html>