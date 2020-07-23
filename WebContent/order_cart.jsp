<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<% int no=0; %>
<div style="margin: 20px">
<section class="section">
       <div class="section-body">
         <div class="row">
       <div class="col-12">
         <div class="card">
           <div class="card-header">
             <h4 align="center">Order cart</h4>
           </div>
           <div class="card-body">
             <div class="table-responsive">
               <table class="table table-striped" style="width:100%;">
                 <thead>
                   <tr>
                   	 <th>No</th>
                     <th>Items Name</th>
                     <th>Value</th>
                     <th>Qty</th>
                     <th>Total</th>
                   </tr>
                 </thead>
                 <tbody>         
                 <c:if test="${ocart ne null}">   
	                 <c:forEach items="${ocart}" var="d" varStatus="count">    
	                   <tr>
		                   	<td>${count.count}</td>
		                   	<td>${d.smid.name}</td>
		                   	<td>${d.smid.price}</td>
		                   	<td>${d.qty}</td>
		                   	<td id="tot${count.count }">${d.smid.price * d.qty}</td>
		                   	<input type="hidden" id="max" value=<%=no++ %>>
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
 <form action="insert" method="post">
 	<!-- <input type="hidden" name="i" value=27> -->
 	<input type="hidden" name="i" value=3>
 		<div class="row">
		<div class="col-md-6"><input type="submit" value="Order" class="btn btn-danger"></div>
		<div class="col-md-6 float-left"><input type="button" class="btn btn-success" onclick="bill()" value="Close Order"></div>
		</div>
		<br>

		<div><input type="button" class="btn btn-success" value="subtot" onclick="gtot(<%=no %>)">&nbsp;&nbsp;&nbsp;<span id="sub_total"></span></div>
		<br>
		<br>
</form>

</div>
<script>
function gtot(id){
	var tot=0;
	for (var i = 1; i <= id; i++) {
		tot=parseInt(tot)+parseInt($('#tot'+i).html());
	}
	var subtot=$('#sub_total').html(tot.toFixed(2));
}
function bill(){
	window.location.href="file?i=21";
}
</script>