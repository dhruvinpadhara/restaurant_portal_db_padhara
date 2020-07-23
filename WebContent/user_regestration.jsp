<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section class="section">
       <div class="section-body">
         <div class="row">
       <div class="col-12">
         <div class="card">
           <div class="card-header">
             <h4>User Registration table</h4>
           </div>
           <div class="card-body">
             <div class="table-responsive">
               <table class="table table-striped table-hover" id="tableExport" style="width:100%;">
                 <thead>
                   <tr>
                     <th>NO</th>
                     <th>Name</th>
                     <th>Number</th>
                     <th>Email</th>
                     <th>Area</th>
                     <th>Action</th>
                   </tr>
                 </thead>
                 <tbody>
                 	 <c:if test="${not empty data}" >
                 		<c:forEach items="${data}" var="d" varStatus="count">
		                   <tr>
			                   	<td>${count.count}</td>
			                   	<td>${d.uname}</td>
			                   	<td>${d.unumber}</td>
			                   	<td>${d.email}</td>
			                   	<td>${d.am.aname}</td>
			                   	<td>
			                   		<c:if test="${d.status eq 0 }">
				                   		<button class="btn btn-success" onclick="activeuser(${d.uid},${d.status })">active</button>
				                   	</c:if>
				                   	<c:if test="${d.status eq 1 }">
				                   		<button class="btn btn-danger" onclick="blockuser(${d.uid},${d.status })">block</button>
				                   	</c:if>
				                   	<button class="btn btn-icon btn-primary" onclick="updateuser(${d.uid},'${d.uname}',${d.unumber},'${d.email}','${d.am.aname}')"><i class="far fa-edit"></i></button>
				                   	<button class="btn btn-icon btn-danger" onclick="deleteuser(${d.uid}) "><i class="fas fa-trash"></i></button>
			                   	</td>	
		                   </tr><%-- //updateUser(${d.uid},'${d.uname}',${d.unumber},'${d.email}') --%>
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
<div style="position: fixed;bottom: 20px;right:15px;z-index: 1"><input type="button" class="btn btn-danger" data-toggle="modal" data-target="#Uregestration" value="+"></div>
 
 
 <div class="modal fade" id="Uregestration" role="dialog" aria-labelledby="exampleModalLabel"
          aria-hidden="true">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
              <div class="modal-header">
                  <h5 class="modal-title" id="formModal">User</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
				<form action="insert" method="post" autocomplete="off">
					<input type="hidden" name="i" value=16> 
					<input type="hidden" name="id" id="user_id">
	               <div class="form-group">
	                 <label>Enter Name</label>
	                 <input type="text" class="form-control" name="uname" id="username" placeholder="enter name">
	                 <div class="invalid-feedback">
	                   Enter City
	                 </div>
	               </div>
	               <div class="form-group">
	                 <label>Enter Number</label>
	                 <input type="text" class="form-control" onkeyup="pass(this.value)" name="unumber" id="usernumber" placeholder="enter mobile number">
	               </div>
	               <div class="form-group">
	                 <label>Enter Email Address</label>
	                 <input type="text" class="form-control" name="uemail" id="email" placeholder="enter email address">
	               </div>
	               
	               <input type="hidden" name="upass" id="upassword">
	               <div class="row">
       			<div class="form-group col-md-12 float-left">
                  <label>Select Area name</label>
                  <br>
                  <select class="form-control select2" name="uarea" id="area_id" style="width:100% !important">
                    <option value="">select...</option>
                    <c:if test="${not empty area}">
		                   	<c:forEach items="${area}" var="d">
		                   		<option value="${d.aid}">${d.aname}</option>
		                   	</c:forEach>
		             </c:if>
                  </select>
          		</div>
		      </div>
	            <div class="">
	               <button class="btn btn-success float-right" onclick="return add_user()" type="submit">Submit</button>
	               <button class="btn btn-danger" data-dismiss="modal">Cancel</button>
             	</div>
	           	</form>                
              </div>
            </div>
          </div>
        </div>
 <!--End form-->
<script src="js/pg_js/area.js"></script> 
<script src="js/pg_js/userreg.js"></script>
 