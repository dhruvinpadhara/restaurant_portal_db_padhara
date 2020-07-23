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
                    <h4>Today order</h4>
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
		            			<th>Order_status</th>
		            			<th>Payment_Status</th>
		               		</tr>
                        </thead>
                          
                        <tbody>
                       				<c:if test="${not empty orderm}" >
                 						<c:forEach items="${orderm}" var="om" varStatus="count">
 												<!-- year -->
 												<c:if test="${om.odate.getYear() eq cdate.getYear() }">
	 												<!-- month -->
	 													<c:if test="${om.odate.getMonth() eq cdate.getMonth()}">
			 												<!-- date -->
			 												<c:if test="${om.odate.getDate() eq cdate.getDate()}">
					 						               		<!-- hour -->
					 						               			<%-- <c:if test="${om.otime.getHours() le cdate.getHours()}"> --%>
				 						               				<!-- minute -->
					 						               				<%-- <c:if test=" ${om.otime.getMinutes() le cdate.getMinutes()}"> --%>
		 				 						               				<!-- order child-->
		 				 						               					<tr>
		 				 						               						<td>${count.count }</td>
		 				 						               						<td>${om.uid.uname }</td>
								 						 							<td>	
								 						 								<c:forEach items="${om.ocid }" var="oc" varStatus="thecount">
								 						 									<c:if test="${om.oid eq oc.oid.oid }">
								 						 										${thecount.count }: ${oc.smid.name } ${oc.qty }<br>
								 						 									</c:if>
								 						 								</c:forEach>
								 						 							</td>
							 						 								<td>${om.odate }</td>
							 						 								<td>${om.otime }</td>
							 						 								<td>
							 						 									<c:if test="${om.ostatus eq 0 }">
				                   															<button class="btn btn-danger">current</button>
				                   														</c:if>
				                   														<c:if test="${om.ostatus eq 1 }">
																	                   		<button class="btn btn-success" >finish</button>
																	                   	</c:if>
							 						 								</td>
							 						 								<td>
							 						 									<c:forEach items="${om.paym }" var="pm" varStatus="thecount">
									 						 								<c:if test="${om.oid eq pm.oid.oid }">	
									 						 									<c:if test="${pm.status eq 0 }">
					                   																<button class="btn btn-danger">pending</button>
					                   															</c:if>
					                   															<c:if test="${pm.status eq 1 }">
																		                   			<button class="btn btn-success" >finish</button>
																		                   		</c:if>
																		                   	</c:if>
								 						 								</c:forEach>
							 						 								</td>
						 						 								</tr>              				
												               				<!-- order -->
		 										               			<%-- </c:if> --%>
		 										               			<!-- close if minute -->
											               			<%-- </c:if> --%>
		 									               			<!-- close if hour -->
				 					               			</c:if>
				 					               			<!-- date -->
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
