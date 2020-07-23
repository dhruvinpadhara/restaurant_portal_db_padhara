<script src="js/jquery-3.4.1.min.js"></script>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section class="section">
       <div class="section-body">
         <div class="row">
       <div class="col-12">
         <div class="card">
           <div class="card-header">
             <h4>State table</h4>
           </div>
           <div class="card-body">
             <div class="table-responsive">
               <table class="table table-striped table-hover" id="tableExport" style="width:100%;">
                 <thead>
                   <tr>
                     <th>No</th>
                     <th>State name</th>
                     <th>Action</th>
                   </tr>
                 </thead>
                 <tbody>
					<c:forEach items="${data}" var="d" varStatus="count">
						<tr>
							<td>${count.count}</td>
							<td>${d.sname}</td>
							<td><button class="btn btn-icon btn-primary" onclick="updatestate(${d.sid},'${d.sname}')"><i class="far fa-edit"></i></button>
	         		          	<button class="btn btn-icon btn-danger" id="swal-6"  onclick="deletestate1(${d.sid})"><i class="fas fa-trash"></i></button></td>
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
<!--  <div class="card-body text-center">
                    <div class="mb-2">Confirmation</div>
                    <button class="btn btn-primary" id="swal-6">Launch</button>
                  </div> -->
 <div style="position: fixed;bottom: 20px;right:15px;z-index:1"><input type="button" class="btn btn-danger" data-toggle="modal" data-target="#addState" value="+"></div>
<script src="js/state.js"></script>

 <div class="modal fade" id="addState" tabindex="-1" role="dialog" aria-labelledby="formModal"
   aria-hidden="true">
   <div class="modal-dialog" role="document">
     <div class="modal-content">
       <div class="modal-header">
         <h5 class="modal-title" id="formModal">State</h5>
         <button data-dismiss="modal" class="close" aria-label="Close">
           <span aria-hidden="true">&times;</span>
         </button>
       </div>
       <div class="modal-body">
         <form id="adstate" autocomplete="off" action="insert" method="post">
         	<input type="hidden" name="i" value=1> 
         	<input type="hidden" id="stateid" name="sid">
               <div class="form-group">
	               <label>Enter State Name</label>
	               <input type="text" class="form-control" id="sname" name="statename" placeholder="enter state name">
               </div>
            <div class="">
               <button type="submit" class="btn btn-success float-right" onclick="return save_state()">Submit</button>
               <button class="btn btn-danger" type="reset" data-dismiss="modal">Cancel</button>
             </div>
           </form>
       </div>
     </div>
   </div>
 </div>
 <script src="js/pg_js/location.js"></script>

 
