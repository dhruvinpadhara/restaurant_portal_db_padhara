<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
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
							<table class="table table-striped table-hover table-md">
		                        <tr>
		                          <th data-width="40">No.</th>
		                          <th>Item</th>
		                          <th class="text-center">Price</th>
		                          <th class="text-center">Quantity</th>
		                          <th class="text-right">Totals(In Rupees)</th>
                        		</tr>
                        		
	 	                         <c:if test="${not empty bill}">
		        	                <c:forEach items="${bill}" var="d" varStatus="count">
					                    <c:if test="${d.oid.ostatus eq 0 }">
					                        <tr>
					                          <td>${count.count }</td>
					                          <td>${d.smid.name}</td>
					                          <td class="text-center" id="price${count.count }">${d.smid.price }&nbsp;Rs.</td>
					                          <td class="text-center" id="qty${count.count }">${d.qty }</td>
					                          <td class="text-right" id="tot${count.count }">${d.qty * d.smid.price}</td>
					                        	<td><input type="hidden" id="max" value=<%=no++ %>></td>
					                        	<td><input type="hidden" name="oid" value=${d.oid.oid }></td>
					                        </tr>
					                       </c:if>
				                	</c:forEach>
		            			</c:if> 
		                      </table>
		                      <%-- <input type="button" class="btn btn-success" value="total" onclick="gtot(<%=no%>)"> --%>
		                    </div>
		                    </div>
           </div>
         </div>
       </div>
     </div>
   </div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-success" value="subtot" onclick="gtot(<%=no %>)">&nbsp;&nbsp;&nbsp;<span id="sub_total"></span></div>

<br>
<script>
function gtot(id){
	var tot=0;
	for (var i = 1; i <= id; i++) {
		tot=parseInt(tot)+parseInt($('#tot'+i).html());
	}
	var subtot=$('#sub_total').html(tot.toFixed(2));
}

</script>