<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<head>
  <title>Restaurant web portal ${param.title}</title>
  <link rel="stylesheet" href="css/app.min.css">
 <!-- Template CSS -->
 <link rel="stylesheet" href="css/style.css">
 <link rel="stylesheet" href="css/components.css">
 <link rel='shortcut icon' type='image/x-icon' href='img/RK_image.jpg'/>
  <!-- Custom style CSS -->
</head>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<%--  <%response.setIntHeader("Refresh", 5); %> --%> 
	<jsp:useBean id="cdate" class="java.util.Date"></jsp:useBean>
	
    <div class="row">
              <div class="col-12">
                <div class="card">
                  <div class="card-header">
                    <h4>Current Month : ${cdate.getMonth()+1 }</h4>
                  </div>
                  
                  <div class="card-body">
                    <div class="table-responsive">
                      <table class="table table-striped table-hover text-capitalize" id="tableExport">
                        <thead>
							<tr>
								<th>No</th>
								<th>Customer name</th>
								<th>items and qty</th>
		            			<th>Date</th>
		            			<th>Time</th>
		            			<th>Item | Quantity</th>
		            			<th>payment | type</th>
		               		</tr>
                        </thead>
                          
                        <tbody>
                       				<c:if test="${not empty orderm}" >
                 						<c:forEach items="${orderm}" var="om" varStatus="count">
 												<!-- year -->
 												<c:if test="${om.odate.getYear() eq cdate.getYear() }">
	 												<!-- month -->
	 													<c:if test="${om.odate.getMonth() eq cdate.getMonth()}">
		 				 						               <!-- show data from payment table -->
										                   <c:forEach items="${om.paym}" var="py">
										                   		<!-- check payment can be finished -->
											                   <c:if test="${om.oid eq py.oid.oid and py.status eq 1 }">
												                   <tr>
													                   	<td>${count.count}</td>    	
													                   	<td>${om.uid.uname}</td>
													                   	<td>${om.tid.tname }</td>
													                   	<td>${om.odate }</td>
													                   	<td>${om.otime }</td>
													                   	<td>
													                   		<!-- order child table data -->
													                   		<c:forEach items="${om.ocid }" var="oc">
													                   			${oc.smid.name } ${oc.qty } <br>
													                   		</c:forEach>
													                   	</td>
													                   	<td>
													                   		<c:if test="${om.oid eq py.oid.oid}">
													                   			${py.grand_total } | ${py.pay_type }
													                   		</c:if>
													                   	</td>
												                   </tr>
											                   </c:if>
										                   </c:forEach> 
				 					               		</c:if>
				 					               		<!-- month -->
	 					               			</c:if>
	 					               			<!-- year -->
					               			</c:forEach>
					               	</c:if>	
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>

  <script src="js/jquery-3.2.1.min.js"></script>
    <!-- General JS Scripts -->
  <script src="js/app.min.js"></script>
  
  <!-- Template JS File -->
  <script src="js/scripts.js"></script>
  
  <!-- Custom JS File -->
  <script src="js/custom.js"></script>
