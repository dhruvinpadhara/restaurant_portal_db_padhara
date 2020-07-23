<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div style="margin: 20px">
<section class="section">
       <div class="section-body">
         <div class="row">
       <div class="col-12">
         <div class="card">
           <div><h4 style="text-align: center; font-size: 40px" class="text-uppercase">Menu table</h4></div>
           <div class="card-body">
             <div class="table-responsive">
             
             	<!-- check menu list not null -->
             
             	<form action="insert" method="post">
             	<!-- cart mate -->
             	<input type="hidden" name="i" value=20> 
             	
             	
             	
             	             	<!-- direct order mate -->
             	<!-- <input type="hidden" name="i" value=123>   -->
             	
             	<c:if test="${not empty menu}" >
             		<!-- looping for menu list -->
             		
                 	<c:forEach items="${menu}" var="m" varStatus="count">
                 		<!-- Menu name  -->
                 		
                 		<%-- <c:if test="${not empty submenu}" >
		                 		<c:forEach items="${submenu}" var="sm" varStatus="count">
		                 			<c:if test="${m.mid eq sm.mid.mid }"> --%>
                 		
                 						<h1 class="text-capitalize">${m.mname } items</h1>
                 		
                 					<%-- </c:if>
                 				</c:forEach>
                 		</c:if> --%>
                 		
		               <table class="table table-striped table-hover text-capitalize" id="tableExport" style="width:100%;">
		                 <thead>
		                   <tr>
		                     <th>items Name</th>
		                     <th>Price</th>
		                     <th>Image</th>
		                     <th>Quantity</th>
		                     <th>select</th>
		                   </tr>
		                 </thead>
		                 <tbody>
		                
		                 	<!-- show data for menu items -->
		                   <c:if test="${not empty submenu}" >
		                 		<c:forEach items="${submenu}" var="sm" varStatus="count">
		                			
		                 				<!-- check condition and show data for submenu -->
						                <c:if test="${m.mid eq sm.mid.mid}">
						                   <tr>
							                   	<td>${sm.name}</td>
							                   	<td>${sm.price}</td>
							                   	<td><figure class="avatar mr-2 avatar-xl"><img src='<c:url value="uploads/${sm.image }"/>'/></figure></td>
							                   	<td>
							                   		<div class="col-md-6 float-left">
							                   			<input type="number" id="qty${count.count}" name="order" onchange="item(${count.count})" class="form-control">
													</div>
												</td> 
												<td><input type="checkbox" name="items" id="mitem${count.count }" value='${sm.smid }'></td>	
						                   </tr>
						                 </c:if>
						               
				                 </c:forEach>
				                 
				                 
			                 </c:if>
					     </tbody>
			           </table> 
	           		</c:forEach>
	           </c:if>
	           <input type="hidden" name="dete" id="cdate">
	           <input class="btn btn-success" type="submit" value="ORDER CART" onclick="save()">
	           <!-- <input class="btn btn-success" type="button" value="CLOSE ORDER" onclick="bill()"> -->
	           <%-- <input class="btn btn-danger" type="button" onclick="close_order(${sessionScope.userid})" value="ORDER_CLOSE"> --%>
             </form>
             </div>
           </div>
         </div>
       </div>
     </div>
   </div>
   </section>
   </div>
   <script src="js/pg_js/user_menu.js"></script>