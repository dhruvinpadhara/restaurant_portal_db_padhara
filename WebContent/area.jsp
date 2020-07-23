<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<section class="section">
       <div class="section-body">
         <div class="row">
       <div class="col-12">
         <div class="card">
           <div class="card-header">
             <h4>Area table</h4>
           </div>
           <div class="card-body">
             <div class="table-responsive">
               <table class="table table-striped table-hover" id="tableExport" style="width:100%;">
                 <thead>
                   <tr>
                     <th>No</th>
                     <th>Area name</th>
                     <th>Area PinCode</th>
                     <th>City name</th>
                     <th>State name</th>
                     <th>Action</th>
                   </tr>
                 </thead>
                 <tbody>
                   <c:if test="${not empty data}" >
                 		<c:forEach items="${data}" var="d" varStatus="count">
		                   <tr>
			                   	<td>${count.count}</td>
			                   	<td>${d.aname}</td>
			                   	<td>${d.zipcode}</td>
			                   	<td>${d.cm.cname}</td>
			                   	<td>${d.sm.sname}</td>
			                   	<td><button class="btn btn-icon btn-primary" onclick="updateArea(${d.aid},'${d.aname}',${d.zipcode},${d.cm.cid},${d.sm.sid})"><i class="far fa-edit"></i></button>
			                   	<button class="btn btn-icon btn-danger" onclick="deleteArea(${d.aid})"><i class="fas fa-trash"></i></button></td>	
		                   </tr>
		                 </c:forEach>
	                 </c:if>
			     </tbody>
			     <tfoot>
			     	<tr>
			     		<td style="position: fixed;bottom: 20px;right:15px;z-index: 1"><input type="button" class="btn btn-danger" data-toggle="modal" data-target="#addArea" value="+"></td>
			     	</tr>
			     </tfoot>
               </table>
             </div>
           </div>
         </div>
       </div>
     </div>
   </div>
<!-- <div><input type="text" id="nnm"></div>
<div><input type="text" id="name"></div> -->
<div id="bb"></div>
 </section>
 <!--Insert form-->
<div class="modal fade" id="addArea" role="dialog" aria-labelledby="exampleModalLabel"
          aria-hidden="true">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
              <div class="modal-header">
                  <h5 class="modal-title" id="formModal">Area</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
			<form action="insert" method="post">
				<input type="hidden" name="id" id="area_id">
				<input type="hidden" name="i" value=7>
				<table>
					<thead></thead>
				</table>
				<div class="form-group">
					<label>Select State</label>
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
		         <div class="form-group">
					<label>Select city</label>
		                      <br>
		                      <select class="form-control select2" name="city" id="city_id" style="width:100% !important">
		                      	<option value="">select...</option>
				                	
				                	<%-- <c:if test="${not empty city}">      
				                      <c:forEach items="${city}" var="d">
				                        <option   <c:if test="${view.id.sid eq d.sid}">selected</c:if> value="${d.cid}" id="state_id" >${d.cname}</option>
				                      </c:forEach>
				                     </c:if> --%> 
		                      </select>
		         </div>
		         
	             <div class="form-group">				
                 <label>Enter Area Name</label>
                 <input type="text" name="aname"  id="area_name" class="form-control" placeholder="enter area name">
               </div>
               <div class="form-group">
                 <label>Enter Pincode</label>
                 <input type="text" name="pincode" id="pincode" class="form-control" placeholder="enter pincode">
               </div>
	             <div class="">
	               <button class="btn btn-success float-right" type="submit" onclick="return save_area()">Submit</button>
	               <button class="btn btn-danger" data-dismiss="modal">Cancel</button>
             	</div>
	         </form>                
              </div>
            </div>
          </div>
        </div>

 <!-- form end -->
<script src="js/pg_js/area.js"></script>
<script src="js/pg_js/location.js"></script>