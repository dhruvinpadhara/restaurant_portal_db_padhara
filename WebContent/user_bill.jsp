<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<jsp:useBean id="cdate" class="java.util.Date"></jsp:useBean>

  <html>
  <head>
    <title>Restaurant</title>
    <link rel="stylesheet" href="css1/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css1/animate.css">
    
    <link rel="stylesheet" href="css1/owl.theme.default.min.css">
    <link rel="stylesheet" href="css1/magnific-popup.css">
    <link rel="stylesheet" href="css1/aos.css">
	
    <link rel="stylesheet" href="css1/flaticon.css">
    <link rel="stylesheet" href="css1/icomoon.css">
    <link rel="stylesheet" href="css1/style.css">
  	<link rel="stylesheet" href="css/app.min.css">
  
  </head>
 <div id="bill_form">
 <form action="insert" method="post">
 	<input type="hidden" name="i" value=22>
   <section class="section container">
          <div class="section-body">
            <div class="invoice" style="margin:20px">
              <div class="invoice-print">
                <div class="row">
                  <div class="col-lg-12">
                    <div class="invoice-title">
                      <h2 style="text-align: center;"><img src="img/RK_image.jpg"> <br>Invoice</h2>
                    </div>
                    <hr>
<%--                     <c:forEach items="${orderm }" var="om">
                    	<c:if test="${om.odate.getDate() eq cdate.getDate()}">
                    		<h1>hello</h1>
                    	</c:if>
                    </c:forEach> --%>
                    <div class="row">
                      <div class="col-md-6">
                        <address>
                          <strong>Billed To:</strong><br>
                          ${sessionScope.username }
                        </address>
                      </div>
                    </div>
                  </div>
                </div>
					                
                	
		                <div class="row mt-4">
		                  <div class="col-md-12">
		                    <div class="section-title">Order Summary</div>
		                    <div class="table-responsive">
		                      <table class="table table-striped table-hover table-md">
		                        <tr>
		                          <th data-width="40">No.</th>
		                          <th>Item</th>
		                          <th class="text-center">Price</th>
		                          <th class="text-center">Quantity</th>
		                          <th class="text-right">Totals(In Rupees)</th>
                        		</tr>
                        		<% int no=0; %>
                        		
	 	                         <c:if test="${not empty bill}">
		        	                <c:forEach items="${bill}" var="d" varStatus="count">
				                        <tr>
				                          <td>${count.count }</td>
				                          <td>${d.smid.name}</td>
				                          <td class="text-center" id="price${count.count }">${d.smid.price }&nbsp;Rs.</td>
				                          <td class="text-center" id="qty${count.count }">${d.qty }</td>
				                          <td class="text-right" id="tot${count.count }">${d.qty * d.smid.price}</td>
				                        <td><input type="hidden" id="max" value=<%=no++ %>></td>
				                        	<td><input type="hidden" name="oid" value=${d.oid.oid }></td>
				                        </tr>
				                	</c:forEach>
		            			</c:if> 
		                      </table>
		                      <input type="button" class="btn btn-success" value="total" onclick="gtot(<%=no%>)">
		                    </div>
		                    <div class="row mt-4">
		                      <div class="col-lg-8">
		                        
		                      </div>
		                      <div class="col-lg-4 text-right" style="font-weight: bold;">
		                        <div class="invoice-detail-item">
		                          <div class="invoice-detail-name">Subtotal</div>
		                          <div class="invoice-detail-value" id="sub_total"></div>
		                        </div>
		                        <div class="invoice-detail-item">
		                          <div class="invoice-detail-name">GST</div>
		                          <div class="invoice-detail-value"><span id="gst"></span></div>
		                        </div>
		                        <hr class="mt-2 mb-2">
		                        <div class="invoice-detail-item">
		                          <div class="invoice-detail-name">Total</div>
		                          <div class="invoice-detail-value invoice-detail-value-lg" id="grand_total"></div>
		                        </div>
		                      </div>
		                    </div>
		                  </div>
		                </div>
		            
              </div>
              <hr>
              <div class="col-md-4">
              		<label>Select payment type</label>	
	              <select name="ptype" id="payment_type" class="form-control">
	              		<option value="">------------------select------------------</option>
	              		<option value="Paytm">PayTm</option>
	              		<option value="Cash">Cash</option>
	              </select>
	              <div>
	              		<span id="invalid" style="color: red;"></span>
	              </div>
              </div>
              <br>
              <br>
              <div class="text-md-right">
                <div class="float-lg-left mb-lg-0 mb-3">
                  <button class="btn btn-primary btn-icon icon-left" type="submit" onclick="return save()"><i class="fas fa-credit-card"></i> Process
                    Payment</button>
                </div>
                <button class="btn btn-warning btn-icon icon-left" type="button" onclick="printform()"><i class="fas fa-print"></i> Print</button>
              </div>
            </div>
          </div>
        </section>
		 
        <input type="hidden" name="total" id="stotal">
        <input type="hidden" name="gst" id="sgst">
        <input type="hidden" name="grandtotal" id="sgrand_total">
 	</form>
 </div>
<script src="js/jquery-3.2.1.min.js"></script>

  <!-- Custom JS File -->
  <script src="js/custom.js"></script>
  
  <script src="js/pg_js/user_bill.js"></script>

  <script src="js1/jquery.min.js"></script>
  <script src="js1/jquery-migrate-3.0.1.min.js"></script>
  <script src="js1/popper.min.js"></script>
  <script src="js1/bootstrap.min.js"></script>
  <script src="js1/jquery.easing.1.3.js"></script>
  <script src="js1/jquery.waypoints.min.js"></script>
  <script src="js1/main.js"></script>
  </body>
  </html>