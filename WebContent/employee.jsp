<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section class="section">
       <div class="section-body">
         <div class="row">
       <div class="col-12">
         <div class="card">
           <div class="card-header">
             <h4>Employee details</h4>
           </div>
           <div class="card-body">
             <div class="table-responsive">
               <table class="table table-striped table-hover" id="tableExport" style="width:100%;">
                 <thead>
                   <tr>
                     	<th>No</th>
						<th>Emp Role</th>
						<th>Name</th>
						<th>Email-Id</th>
						<th>Mobile_Number</th>
						<th>Salary</th>
						<th>Action</th>
                   </tr>
                 </thead>
                 <tbody>
                 	<c:if test="${not empty emp}">
		                 <c:forEach items="${emp}" var="s" varStatus="count">
		                   <tr>
			                   	<td>${count.count}</td>
			                   	<td>${s.rid.role_name}</td>
			                   	<td>${s.ename}</td>
			                   	<td>${s.email}</td>
			                   	<td>${s.mobile_no}</td>
			                   	<td>${s.salary}</td>
			                   	<td><button class="btn btn-icon btn-primary" type="button" onclick="updateemp(${s.eid})"><i class="far fa-edit"></i></button>
			                   	<button class="btn btn-icon btn-danger" onclick="deleteemployee(${s.eid})"><i class="fas fa-times"></i></button></td>	
		                   </tr>
		                 </c:forEach>
		             </c:if>
			     </tbody>
               </table>
             </div>
           </div>
         </div>
       </div>
     </div>
   </div>
 </section>
<div style="position: fixed;bottom: 20px;right:15px;z-index: 1" data-toggle="modal" data-target="#addState"><input type="button" class="btn btn-danger" value="+"></div>

<div class="modal fade" id="addState" tabindex="-1" role="dialog" aria-labelledby="formModal"
   aria-hidden="true">
   <div class="modal-dialog modal-lg" role="document">
     <div class="modal-content">
       <div class="modal-header">
         <h5 class="modal-title" id="formModal">Employee</h5>
         <button data-dismiss="modal" class="close" aria-label="Close">
           <span aria-hidden="true">&times;</span>
         </button>
       </div>
       <div class="modal-body">
         <form class="needs-validation" autocomplete="off" action="insert" method="post">
		   	 <input type="hidden" name="i" value=8>
		   	 <input type="hidden" name="id">
		   	 <div class="row"> 	
		   	  	<div class="form-group col-md-4">
                     <label>Select Role</label>
                     <br>
                     <select class="form-control select2" name="role" id="role_id" style="width:100% !important">
	                     <option value="">select..</option>
	                     <c:if test="${not empty role}">
	                      		<c:forEach items="${role}" var="d">
				                     
					                      <option value="${d.role_id }">${ d.role_name}</option>
				                     
				                  </c:forEach>
				           </c:if>
			           </select>
	            	</div>
		   	  	<div class="form-group col-md-4 float-left">
		          <label>Enter Name</label>
		          <input type="text" class="form-control" id="empname" name="ename" placeholder="enter name">
		         </div>
		         <div class="form-group col-md-4 float-left">
		          <label>Enter Email Address</label>
		          <input type="email" name="eemail" id="email_id" class="form-control"  placeholder="enter email id">
		         </div>

		      </div>
		      <div class="row">
			        <div class="form-group col-md-4 float-left">
			          <label>Enter Address</label>
			          <textarea class="form-control" id="adress" name="eaddress" placeholder="enter address"></textarea> 
			         </div>
		      		
		      		<div class="form-group col-md-4 float-left">
			          <label>Enter Mobile Number</label>
			          <input class="form-control" placeholder="enter mobile number" id="enumber" name="enumber"/> 
			         </div>
		      		
	         		<div class="col-md-4 float-left form-group">
	         		<label>gender:</label><br>
		       				<input type="radio" name="gender" checked="checked" value="Male">&nbsp;&nbsp;&nbsp;Male&nbsp;
		       				<input type="radio" name="gender" value="Female">&nbsp;&nbsp;Female&nbsp;
                	</div>
               </div>
       		<div class="row">
       			<div class="form-group col-md-4 float-left">
                  <label>Select State name</label>
                  <br>
                  <select class="form-control select2" onchange="check(this.value)" name="state" id="state_id" style="width:100% !important">
                    <option value="">select...</option>
                    <c:if test="${not empty state}">
		                   	<c:forEach items="${state}" var="d">
		                   		<option value="${d.sid}">${d.sname}</option>
		                   	</c:forEach>
		             </c:if>
                  </select>
          		</div>
          		<div class="form-group col-md-4 float-left">
                  <label>Select City name</label>
                  <br>
                  <select class="form-control select2" onchange="darea(this.value)" id="city_id" name="city"  style="width:100% !important">
                    <option value="">select...</option>
                  </select>
          		</div>
          		<div class="form-group col-md-4 float-left">
                  <label>Select Area name</label>
                  <br>
                  <select class="form-control select2" name="area" id="area_id" style="width:100% !important">
                    <option value="">select...</option>
                  </select>
          		</div>
		      </div>
		      <div class="row">   
		         <div class="form-group float-left col-md-4">
		          <label>Enter Salary</label>
		          <input type="text" class="form-control" placeholder="enter salary" name="salary" id="esalary"  name="statename">
		         </div>
		         <div class="form-group col-md-4 float-left">
		          <label>Enter Password</label>
		          <input type="text" class="form-control" name="epass" id="epass" placeholder="enter password">
		         </div>
		         <div class="form-group col-md-4 float-left">
		          <label>Enter Confirm  Password</label>
		          <input type="text" class="form-control" onkeyup="checkpass(this.value)" id="comfirmpass" placeholder="enter password" required autofocus>
		         </div>
	         	<div class="form-group col-md-4 float-left">
	                 <label>Birth date</label>
	                 <input type="date" name="edate" id="birth_date" class="form-control datepicker"> 
	              </div>
	            </div>
            <div class="">
               <button class="btn btn-success float-right" onclick="return save()" type="submit">Submit</button>
               <button class="btn btn-danger" data-dismiss="modal">Cancel</button>
             </div>
           </form>
       </div>
     </div>
   </div>
 </div>
 <!-- area JS -->
 <script type="text/javascript" src="js/pg_js/emp.js"></script>
 <script type="text/javascript" src="js/pg_js/area.js"></script>