<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                     <th>Table name</th>
                     <th>Number of Sitting</th>
                     <th>Table description</th>
                     <th>Action</th>
                   </tr>
                 </thead>
                 <tbody>
                   <c:if test="${not empty data}" >
                 		<c:forEach items="${data}" var="d" varStatus="count">
		                   <tr>
			                   	<td>${count.count}</td>
			                   	<td>${d.tname}</td>
			                	<td>${d.tcapacity}</td>
			                	<td>${d.description }</td>
			                   	<td><button class="btn btn-icon btn-primary" onclick="updateTable(${d.tid},'${d.tname}',${d.tcapacity},'${d.description }')"><i class="far fa-edit"></i></button>
			                   	<button class="btn btn-icon btn-danger" onclick="deleteTable(${d.tid})"><i class="fas fa-trash"></i></button></td>	
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
 
 <div style="position: fixed;bottom: 20px;right:15px;z-index: 1"><input type="button" class="btn btn-danger" data-toggle="modal" data-target="#addTable" value="+"></div>
 
 <!--Insert form-->
 <div class="modal fade" id="addTable" tabindex="-1" role="dialog" aria-labelledby="formModal"
   aria-hidden="true">
   <div class="modal-dialog" role="document">
     <div class="modal-content">
       <div class="modal-header">
         <h5 class="modal-title" id="formModal">Table</h5>
         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
           <span aria-hidden="true">&times;</span>
         </button>
       </div>
       <div class="modal-body">
         
         
         <form action="insert" method="post">
            <input type="hidden" name="i" value="12">
		   	 <input type="hidden" name="id" id="tid">
             <div class="">
               <div class="form-group">
                 <label>Enter Name of Table</label>
                 <input name="tname" placeholder="enter table name" class="form-control" id="table_name" />
                 <div class="invalid-feedback">
                   Enter Sitting
                 </div>
               </div>
               <div class="form-group">
                 <label>Enter Number of sitting</label>
                 <input name="tcapacity" class="form-control" id="capacity" />
                 <div class="invalid-feedback">
                   Enter Sitting
                 </div>
               </div>
               <div class="form-group">
                 <label>Enter table description</label>
                 <input name="description" placeholder="enter description" class="form-control" id="table_desc" />
                 <div class="invalid-feedback">
                   Enter Sitting
                 </div>
               </div>
             </div>
             <div class="">
             	<button class="btn btn-success float-right" type="submit">Submit</button>
               <button class="btn btn-danger" type="reset">Reset</button>
             </div>
           </form>
         
       </div>
     </div>
   </div>
 </div>
 <!-- form end -->
 

 