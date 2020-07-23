<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                     <th>User name</th>
                     <th>Time</th>
                     <th>date</th>
                   </tr>
                 </thead>
                 <tbody>
					<c:forEach items="${data}" var="d" varStatus="count">
						<tr>
							<td>${count.count}</td>
							<td>${d.eid.ename}</td>
							<td>${d.created_by_date }</td>
							<td>${d.cdate }</td>
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