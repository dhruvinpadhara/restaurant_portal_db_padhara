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

  <%response.setIntHeader("Refresh", 60); %>  
	<jsp:useBean id="cdate" class="java.util.Date"></jsp:useBean>
    <div class="row">
              <div class="col-12">
                <div class="card">
                  <div class="card-header">
                    <h4>Kitchen Screen</h4>
                  </div>
                  <div class="card-body">
                    <div class="table-responsive">
                      <table class="table table-striped table-hover" id="save-stage" style="width:100%;">
                        <thead>
							<tr>
								<th>No</th>
								<th>Order_id</th>
								<th>Table no</th>
								<th>items</th>
		            			<th>Qty</th>
		            			<th>time</th>
		            			<th>action</th>
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
<%-- 			 												<c:if test="${om.odate.getDate() eq cdate.getDate()}">
					 						               		<!-- hour -->
					 						               			<c:if test="${om.otime.getHours() le cdate.getHours()}"> --%>
					 						               					<!-- order -->
						 						               				<c:if test="${not empty orderc}" >
											                 						<c:forEach items="${orderc}" var="oc" varStatus="count">
											                 							<c:if test="${om.oid eq oc.oid.oid }">
															             					<tr>
															             						<td>${count.count }</td>
															             						<td>${om.oid }</td>
															             						<td>${om.tid.tname }</td> 
															             						<td>${oc.smid.name }</td>
															             						<td>${oc.qty }</td>
															             						<td>${om.otime}</td>
															             						<td><input type="button" class="btn btn-success" value="Waiting" onclick="status(${oc.ocid })"></td>
														               						</tr>
														               					</c:if>
													               					</c:forEach>
												               				</c:if>
												               				<!-- order -->
<%-- 											               			</c:if>
		 									               			<!-- Hours -->
				 					               			</c:if> --%>
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
