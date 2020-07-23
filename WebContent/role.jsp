<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<section class="section">
       <div class="section-body">
         <div class="row">
       <div class="col-12">
         <div class="card">
           <div class="card-header">
             <h4 align="center">Role table</h4>
           </div>
           <div class="card-body">
             <div class="table-responsive">
               <table class="table table-striped table-hover" id="tableExport" style="width:100%;">
                 <thead>
                   <tr>
                     <th>No</th>
                     <th>Role Name</th>
                     <th>Role description</th>
                     <th>Action</th>
                   </tr>
                 </thead>
                 <tbody>            
                 <c:forEach items="${data}" var="d" varStatus="count">    
                   <tr>
	                   	<td>${count.count}</td>
	                   	<td>${d.role_name}</td>
	                   	<td>${d.role_desc}</td>
	                   	<td><button class="btn btn-icon btn-primary" onclick="updateRole(${d.role_id},'${d.role_name}','${d.role_desc}')"><i class="far fa-edit"></i></button>
	                   	<button class="btn btn-icon btn-danger" onclick="deleteRole(${d.role_id})"><i class="fas fa-times"></i></button></td>
                   </tr>
                   </c:forEach>
			     </tbody>
	           </table>
             </div>
           </div>
         </div>
       </div>
     </div>
   </div>
 </section>
<div style="position: fixed;bottom: 20px;right:15px;z-index: 1"><input type="button" class="btn btn-danger" data-toggle="modal" data-target="#addRole" value="+"></div>
<!--Insert form-->
 <div class="modal fade" id="addRole" tabindex="-1" role="dialog" aria-labelledby="formModal"
   aria-hidden="true">
   <div class="modal-dialog" role="document">
     <div class="modal-content">
       <div class="modal-header">
         <h5 class="modal-title" id="formModal">Role</h5>
           <a><span data-dismiss="modal" aria-hidden="true">&times;</span>
         </a>
       </div>
       <div class="modal-body">
         
         <form class="needs-validation" action="insert" autocomplete="off" method="post">
         		<input type="hidden" name="i" value=2>
         		<input type="hidden" name="id" id="role_id">
               <div class="form-group">
                 <label>Enter Role</label> 
                 <input type="text" name="name" placeholder="enter role" class="form-control" id="role_name">
                 <div class="invalid-feedback">
                   Enter role
                 </div>
               </div>
               <div class="form-group">
                 <label>Enter Role description</label> 
                 <input type="text" name="desc" placeholder="enter role description" class="form-control" id="role_desc" required>
                 <div class="invalid-feedback">
                   Enter desc
                 </div>
               </div>
             <div class="">
               <button class="btn btn-success float-right" onclick="return saverole()" type="submit">Submit</button>
               <button class="btn btn-danger" data-dismiss="modal">Cancel</button>
             </div>
           </form>
       </div>
     </div>
   </div>
 </div>
 <!-- form end -->
 <script type="text/javascript" src="js/pg_js/emp.js"></script>
  

 