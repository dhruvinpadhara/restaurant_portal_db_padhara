<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>R K Restaurant</title>
  <!-- General CSS Files -->
  <link rel="stylesheet" href="css/app.min.css">
  <!-- Template CSS -->
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/components.css">
  <!-- Custom style CSS -->
  <link rel="stylesheet" href="css/custom.css">
    <!-- Toaster css -->
  <link rel="stylesheet" href="bundles/izitoast/css/iziToast.min.css">
  
    <link rel='shortcut icon' type='image/x-icon' href='img/RK_image.jpg'/>
</head>

<body>
  <div class="loader"></div>
  <div id="app">
    <section class="section">
      <div class="container mt-5">
        <div class="row">
          <div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
            <div class="card card-primary">
              <div class="card-header">
                <h4>Forgot Password</h4>
              </div>
              <div class="card-body">
                <form method="POST" action="insert">
                <input type="hidden" name="i" value=26>
                	<c:if test="${sessionScope.useremail ne null}">
                	${sessionScope.useremail}
                		<input type="hidden" name="user" value="user">
                	</c:if>
                	<c:if test="${sessionScope.empemail ne null}">
                	${sessionScope.empemail}
                		<input type="hidden" name="user" value="emp">
                	</c:if>
                  <div class="form-group">
                    <label for="email">Enter New Password</label>
                    <input type="text" class="form-control" name="password" id="oldpass" placeholder="enter password" tabindex="1" required>
                  </div>
                
                <div class="form-group">
                    <label for="email">Enter Confirm Password</label>
                    <input type="text" class="form-control" id="newpass" placeholder="enter new password" tabindex="1" required>
                  </div>
                
                  <div class="form-group">
                    <button type="submit" onclick="return check()" class="btn btn-primary btn-lg btn-block" tabindex="4">
                      Forgot Password
                    </button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
  
  	<!-- toaster  -->
	<script src="bundles/izitoast/js/iziToast.min.js"></script>
  
  <!-- General JS Scripts -->
  <script src="js/app.min.js"></script>
  <!-- JS Libraies -->
  <!-- Page Specific JS File -->
  <!-- Template JS File -->
  <script src="js/scripts.js"></script>
  <!-- Custom JS File -->
  <script src="js/custom.js"></script>
</body>

<script>
	window.onload=function(){
		$('#oldpass').focus();
	}
  function check(){
	  upassword=$('#oldpass').val();
	  confirmpass=$('#newpass').val();
	  
	  if(upassword==''){
	  		iziToast.info({
	  		    title: 'pl.enter password!',
	  		    message: '',
	  		    position: 'topRight'
	  		  });
	  		$('#oldpass').focus();
	  		return false;
	  		}
	  if(confirmpass==''){
	  		iziToast.info({
	  		    title: 'pl.enter new password!',
	  		    message: '',
	  		    position: 'topRight'
	  		  });
	  		$('#newpass').focus();
	  		return false;
	  		}
	  
	  if(upassword!=confirmpass){
  		iziToast.info({
  		    title: 'pl.enter same password!',
  		    message: '',
  		    position: 'topRight'
  		  });
  		$('#newpass').focus();
  		return false;
  		}
	  return true;
  }
  </script>

</html>