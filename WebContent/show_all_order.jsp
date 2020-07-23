<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<section class="section">
       <div class="section-body">
         <div class="row">
       <div class="col-12">
         <div class="card">
           <div class="card-header">
             <h4>Order History</h4>
           </div>
           <div class="card-body">
             <div class="table-responsive">
               <table class="table table-striped table-hover" id="tableExport" style="width:100%;">
                 <thead>
                   <tr>
                     <th>No</th>
                     <th>User_name</th>
                     <th>Table no</th>
                     <th>Order_Date</th>
                     <th>Order_time</th>
                     <th>Order Details</th>
                     <th>Amount | payment type</th>
                   </tr>
                 </thead>
                 <tbody class="text-capitalize">
                 	   <!-- check order list can be empty or not -->
			                 <c:if test="${not empty orderm}" >
		                 		<!-- show data from order table -->
		                 		<c:forEach items="${orderm}" var="d" varStatus="count">
				                   
				                   <!-- show data from payment table -->
				                   <c:forEach items="${d.paym}" var="py">
				                   		<!-- check payment can be finished -->
					                   <c:if test="${d.oid eq py.oid.oid and py.status eq 1 }">
						                   <tr>
							                   	<td>${count.count}</td>    	
							                   	<td>${d.uid.uname}</td>
							                   	<td>${d.tid.tname }</td>
							                   	<td>${d.odate }</td>
							                   	<td>${d.otime }</td>
							                   	<td>
							                   		<!-- order child table data -->
							                   		<c:forEach items="${d.ocid }" var="oc">
							                   			${oc.smid.name } ${oc.qty } <br>
							                   		</c:forEach>
							                   	</td>
							                   	<td>
							                   		<c:if test="${d.oid eq py.oid.oid}">
							                   			${py.grand_total } | ${py.pay_type }
							                   		</c:if>
							                   	</td>
						                   </tr>
					                   </c:if>
				                   </c:forEach>
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

  
<script src="js/pg_js/location.js"></script>
 