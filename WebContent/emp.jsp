<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form class="needs-validation" autocomplete="off" action="insert" method="post">
		   	 <input type="hidden" name="i" value=8>
		   	 <input type="hidden" name="id" value="${empid.eid }">
		   	 <div class="row"> 	
		   	  	<div class="form-group col-md-4 float-left">
	                  <label>Select role name</label>
	                  <br>
	                  <select class="form-control select2" name="role" style="width:100% !important" required>
	                    <option>select...</option>
	                    <c:if test="${not empty role}">
		                   	<c:forEach items="${role}" var="d">
		                   		<option <c:if test="${d.role_id eq empid.rid.role_id }">selected="selected"</c:if> value="${d.role_id}">${d.role_name}</option>
		                   	</c:forEach>
		                </c:if>
	                  </select>
	          	</div>
		   	  	<div class="form-group col-md-4 float-left">
		          <label>Enter Name</label>
		          <input type="text" class="form-control" value="${empid.ename}" id="empname" name="ename" placeholder="enter name">
		            <div class="invalid-feedback">
		             	  Enter name
		           </div>
		         </div>
		         <div class="form-group col-md-4 float-left">
		          <label>Enter Email Address</label>
		          <input type="email" name="eemail" id="email_id" value="${empid.email}" class="form-control" placeholder="enter email id">
		            <div class="invalid-feedback">
		             	  Enter email-id
		           </div>
		         </div>

		      </div>
		      <div class="row">
			        <div class="form-group col-md-4 float-left">
			          <label>Enter Adress</label>
			          <textarea class="form-control" id="adress" name="eaddress" placeholder="enter address" >${empid.address}</textarea> 
			         </div>
		      		
		      		<div class="form-group col-md-4 float-left">
			          <label>Enter Mobile Number</label>
			          <input class="form-control" value="${empid.mobile_no}" placeholder="enter mobile number" id="enumber" name="enumber" required /> 
			         </div>
		      		
	         		<div class="col-md-4 float-left form-group">
	         		<label>gender:</label><br>
		       				<input type="radio" name="gender" value="Male">&nbsp;&nbsp;&nbsp;Male&nbsp;
		       				<input type="radio" name="gender" value="Female">&nbsp;&nbsp;Female&nbsp;
                	</div>
               </div>
               
       		<div class="row">
       			<div class="form-group col-md-4 float-left">
                  <label>Select State name</label>
                  <br>
                  <select class="form-control select2" name="state" id="state_id" onchange="check(this.value)"  style="width:100% !important" required>
                    <option>select...</option>
                    <c:if test="${not empty state}">
		                   	<c:forEach items="${state}" var="d">
		                   		<option <c:if test="${d.sid eq empid.sid.sid }">selected="selected"</c:if> value="${d.sid}" >${d.sname}</option>
		                   	</c:forEach>
		             </c:if>
		             
                  </select>
          		</div>
          		<div class="form-group col-md-4 float-left">
                  <label>Select City name</label>
                  <br>
                  <select class="form-control select2" onchange="darea(this.value)" id="city_id" name="city"  style="width:100% !important" required>
                    <option>select...</option>
                  </select>
          		</div>
          		<div class="form-group col-md-4 float-left">
                  <label>Select Area name</label>
                  <br>
                  <select class="form-control select2" name="area" id="area_id" style="width:100% !important" required>
                    <option>select...</option>
                  </select>
          		</div>
		      </div>
		      <div class="row">   
		         <div class="form-group float-left col-md-4">
		          <label>Enter Salary</label>
		          <input type="text" class="form-control" placeholder="enter salary" value="${empid.salary}" name="salary" id="esalary" name="statename">
		         </div>
		         <div class="form-group col-md-4 float-left">
		          <label>Enter Password</label>
		          <input type="text" class="form-control" name="epass" id="statename" value="${empid.password}" placeholder="enter password" name="statename">
		         </div>
	         	<div class="form-group col-md-4 float-left">
	                 <label>Birth date</label>
	                 <input type="date" name="edate" value="${empid.bdate}" class="form-control datepicker">	                
	              </div>
	            </div>
            <div class="">
               <button class="btn btn-success float-right" type="submit" onclick="return save()">Submit</button>
               <button class="btn btn-danger" type="reset">Reset</button>
             </div>
           </form>
<script type="text/javascript" src="js/pg_js/area.js"></script>
<script type="text/javascript" src="js/pg_js/emp.js"></script>