<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<script src="js/jquery-3.4.1.min.js"></script>
<section class="section">
       <div class="section-body">
         <div class="row">
       <div class="col-12">
         <div class="card">
           <div class="card-header">
             <h4>Feeback table</h4>
           </div>
           <div class="card-body">
             <div class="table-responsive">
               
					${sessionScope.order_id }                 
               <c:remove var="order_id" scope="session"/>
               <form action="">
               		<label></label>
               </form>
               
               ${sessionScope.order_id }
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
         <h5 class="modal-title" id="formModal">Feedback</h5>
         <button data-dismiss="modal" class="close" aria-label="Close">
           <span aria-hidden="true">&times;</span>
         </button>
       </div>
       <div class="modal-body">
         <form class="needs-validation" id="adfeed" autocomplete="off" action="insert" method="post">
         	<input type="hidden" name="i" value=1> 
         	<input type="hidden" id="fid" name="fid">
               <div class="form-group">
	               <label>Enter Feedback Description</label>
	               <input type="text" class="form-control" id="fdesc" required name="fdesc">
	                 <div class="invalid-feedback">
                   	  Enter Feedback
                 	</div>
               </div>
               
            <div class="">
               <button id="submit" type="submit" class="btn btn-success float-right">Submit</button>
               <button class="btn btn-danger" data-dismiss="modal">Cancel</button>
             </div>
           </form>
       </div>
     </div>
   </div>
 </div>
 
