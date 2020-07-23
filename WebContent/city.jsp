<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section class="section">
       <div class="section-body">
         <div class="row">
       <div class="col-12">
         <div class="card">
           <div class="card-header">
             <h4>City table</h4>
           </div>
           <div class="card-body">
             <div class="table-responsive">
               <table class="table table-striped table-hover" id="tableExport" style="width:100%;">
                 <thead>
                   <tr>
                     <th>No</th>
                     <th>City name</th>
                     <th>State name</th>
                     <th>Action</th>
                   </tr>
                 </thead>
                 <tbody>
                 	<c:if test="${not empty view}" >
                 		<c:forEach items="${view}" var="d" varStatus="count">
		                   <tr>
			                   	<td>${count.count}</td>
			                   	<td>${d.cname}</td>
			                   	<td>${d.id.sname}</td>
			                   	<td><button class="btn btn-icon btn-primary" onclick="updateCity(${d.cid},'${d.cname}','${d.id.sid}')"><i class="far fa-edit"></i></button>
			                   	<button class="btn btn-icon btn-danger" onclick="deletecity(${d.cid})"><i class="fas fa-trash"></i></button></td>	
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
<div style="position: fixed;bottom: 20px;right:15px;z-index: 1"><input type="button" class="btn btn-danger" data-toggle="modal" data-target="#addCity" value="+"></div>
 
 
 <div class="modal fade" id="addCity" role="dialog" aria-labelledby="exampleModalLabel"
          aria-hidden="true">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
              <div class="modal-header">
                  <h5 class="modal-title" id="formModal">City</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
				<form action="insert" method="post" autocomplete="off">
					<input type="hidden" name="i" value=5> 
					<input type="hidden" name="id" id="city_id">
	               <div class="form-group">
	                      <label>Select State</label>
	                      <br>
	                      <select class="form-control select2" name="state" id="state_id" style="width:100% !important" required>
	                      	<option value="">select...</option>
			                	<c:if test="${not empty data}">      
			                      <c:forEach items="${data}" var="d">
			                        <option  <%--  <c:if test="${view.id.sid eq d.sid}">selected</c:if>  --%>value="${d.sid}" id="state_id" >${d.sname}</option>
			                      </c:forEach>
			                     </c:if>
	                      </select>
	                </div>
	               <div class="form-group">
	                 <label>Enter City Name</label>
	                 <input type="text" class="form-control" placeholder="enter city name" name="name" id="city_name">
	               </div>

	            <div class="">
	               <button class="btn btn-success float-right" type="submit" onclick="return save_city()">Submit</button>
	               <button class="btn btn-danger" data-dismiss="modal">Cancel</button>
             	</div>
	           	</form>                
              </div>
            </div>
          </div>
        </div>
 <!--End form-->
  
<script src="js/pg_js/location.js"></script>
 