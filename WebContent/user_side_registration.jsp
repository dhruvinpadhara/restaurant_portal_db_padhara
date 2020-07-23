<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
      <!-- General CSS Files -->
 <head>
 <!-- Toaster css -->
  <link rel="stylesheet" href="bundles/izitoast/css/iziToast.min.css">
  <!-- General CSS Files -->
   <!-- Searchable Dropdown -->
  <link rel="stylesheet" href="bundles/select2/dist/css/select2.min.css">
  <link rel="stylesheet" href="bundles/jquery-selectric/selectric.css">
  <link rel="stylesheet" href="css/app.min.css">
 		<link rel="stylesheet" href="css/style.css">
 		<link rel="stylesheet" href="css/components.css">
 </head>
 <div class="mh-100 col-md-12">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container-fluid px-0">
				<div class="row d-flex no-gutters">
		          <div class="col-md-6 order-md-last ftco-animate makereservation p-4 p-md-5 pt-5">
		          	<div class="py-md-5">
			          	<div class="heading-section ftco-animate mb-5">
				            <h2 class="mb-4">Registration</h2>
				          </div>
				          <form action="insert" method="post" autocomplete="off">
							<input type="hidden" name="i" value=16> 
							<input type="hidden" name="default" value=1>
							<input type="hidden" name="id" id="user_id">
			               <div class="form-group">
			                 <label>Enter Name</label>
			                 <input type="text" class="form-control" name="uname" id="username" placeholder="enter name">
			               </div>
			               <div class="form-group">
			                 <label>Enter Number</label>
			                 <input type="text" class="form-control" placeholder="enter mobile number" name="unumber" id="usernumber">
			               </div>
			               <div class="form-group">
			                 <label>Enter Email Address</label>
			                 <input type="text" class="form-control" placeholder="enter email address" name="uemail" id="email">
			               </div>
			               <div class="form-group">
					          <label>Enter Password</label>
					          <input type="text" class="form-control" name="upass" id="upassword" placeholder="enter password">
					       </div>
				           <div class="form-group">
					          <label>Enter Confirm  Password</label>
					          <input type="text" class="form-control" id="comfirmpass" placeholder="enter password">
				            </div>
			       			<div class="form-group">
			                  <label>Select Area name</label>
			                  <br>
			                  <select class="form-control select2" name="uarea" id="area_id" style="width:100% !important">
			                    <option value="">select...</option>
			                    <c:if test="${not empty state}">
					                   <c:forEach items="${state}" var="d">
					                   		<option value="${d.aid}">${d.aname}</option>
					                   </c:forEach>
					             </c:if>
			                  </select>
			          		</div>
			            <div class="">
			               <button class="btn btn-success float-right" onclick="return user_validate()" type="submit">Submit</button>
			               <button class="btn btn-primary" type="reset">Reset</button>
		             	</div>
			           	</form>
			          </div>
		          </div>
          		<div class="col-md-6 d-flex align-items-stretch pb-5 pb-md-0">
					<div class="col-md-12" style="background-image: url(images/breakfast-5.jpg);">
					</div>
				</div>
        	</div>
			</div>
		</section>
</div>

<!-- General JS Scripts -->
  <script src="js/app.min.js"></script>

<script src="js1/userreg.js"></script>
<script src="js1/jquery-3.2.1.min.js"></script>
<!-- toaster  -->
	<script src="bundles/izitoast/js/iziToast.min.js"></script>
  <!-- Page Specific JS File -->
  <script src="js/page/toastr.js"></script>
 <!-- searchable dropdown -->
  <script src="bundles/select2/dist/js/select2.full.min.js"></script>
  <script src="bundles/jquery-selectric/jquery.selectric.min.js"></script> 