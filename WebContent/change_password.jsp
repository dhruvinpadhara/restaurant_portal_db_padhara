<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Restaurant web portal</title>
  <!-- General CSS Files -->
    <link rel="stylesheet" href="bundles/izitoast/css/iziToast.min.css">
  <link rel="stylesheet" href="css/app.min.css">
  <!-- Template CSS -->
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/components.css">
  <!-- Custom style CSS -->
  <link rel="stylesheet" href="css/custom.css">
  <link rel='shortcut icon' type='image/x-icon' href='img/RK_image.jpg'/>
</head>

<body style="background-image: url('img/Gujarati.jpg'); width: 100%; height: 100%; ">
  <div class="loader"></div>
  <div id="app">
    <section class="section">
      <div class="container mt-5">
        <div class="row">
          <div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
            <div class="card card-primary">
              <div class="card-header">
                <h4>Reset Password</h4>
              </div>
              <div class="card-body">
                <form method="post" action="insert">
                <c:if test="${sessionScope.userid ne null }">
                	<input type="hidden" name="i" value=27>
                </c:if>
                <c:if test="${sessionScope.empid ne null }">
                	<input type="hidden" name="i" value=28>
                </c:if>
                  <div class="form-group">
                    <label for="password">Old Password</label>
                    <input id="cpass" type="password" class="form-control pwstrength" placeholder="pl.enter old password" name="oldpassword" tabindex="2">
                  </div>
                  <div class="form-group">
                    <label for="password">New Password</label>
                    <input id="epass" type="password" class="form-control pwstrength" name="newpassword" tabindex="2" placeholder="pl.enter new password">
                  </div>
                  <div class="form-group">
                    <label for="password-confirm">Confirm Password</label>
                    <input id="comfirmpass" type="password" placeholder="pl.enter confirm password" class="form-control" tabindex="2">
                  </div>
                  <div class="form-group">
                    <button type="submit" onclick="return change_pass()" class="btn btn-primary btn-lg btn-block" tabindex="4">
                      Reset Password
                    </button>
                  </div>
                  <div><c:if test="${param.p ne null }">${param.p }</c:if></div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
  <!-- General JS Scripts -->
  <script src="js/pg_js/login.js"></script>
  <script src="js/app.min.js"></script>
  <!-- JS Libraies -->
  	<script src="bundles/izitoast/js/iziToast.min.js"></script>
  <!-- Page Specific JS File -->
  <script src="js/page/toastr.js"></script>
  <!-- Page Specific JS File -->
  <!-- Template JS File -->
  <script src="js/scripts.js"></script>

</body>
<script>

</script>
</html>