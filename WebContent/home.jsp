<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<section class="row">
			<c:forEach items="${data }" var="d" varStatus="count">
		          
					            <div class="col-xl-2 col-lg-3" style="margin:20px">
					              <div class="card l-bg-green" id="table_color" onmouseover="color()">
					                <div class="card-statistic-3 abc">
					                  	<div class="card-icon card-icon-large"><i class="fa fa-award"></i></div>
					               		<div class="card-content">
							                    <h1 id="tab${count.count}" style="text-align: center;">${d.tname}</h1>
							                    <p><span>Table Sitting:</span><br>${d.tcapacity}<br></p>
										</div>
										<c:if test="${not empty orderm }">
											<c:forEach items="${orderm }" var="om">
											     <c:if test="${om.tid.tid eq d.tid and om.ostatus eq 0}"> 
											     <button type="button" class="btn btn-danger">waiting</button>					
												</c:if>
												
								      		</c:forEach> 
								      	</c:if>
					                </div>
					              </div>
					            </div>
					      
            </c:forEach>
</section>

        <style>
        	/* .center{
        		text-align: center;
        	}
        	.abc p{
        		opacity:0;
        	}
        	.abc: p{
        		text-align:center;
        		font-style:bold;
        		font-size:40px;
        		opacity:1;
        	}
        	.abc span{
        		font-size:20px;
        	}
        	.abc:hover h1{
        		display:none;
        	}
        	
        	 */
        	.center{
        		text-align: center;
        	}
        	.abc: p{
        		text-align:center;
        		font-style:bold;
        		font-size:40px;
        		opacity:1;
        	}
        	.abc span{
        		font-size:20px;
        	}
        	
    
        
        </style>
 <div class="modal fade" id="addTable" tabindex="-1" role="dialog" aria-labelledby="formModal"
   aria-hidden="true">
   <div class="modal-dialog modal-lg" role="document">
     <div class="modal-content">
       <div class="modal-header">
         <h5 class="modal-title" id="formModal">Booking Table</h5>
         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
           <span aria-hidden="true">&times;</span>
         </button>
       </div>
       <div class="modal-body">

         <form action="insert" method="post">
            <input type="hidden" name="i" value=17>
		   	 <input type="hidden" name="id" id="bid">
             <div class="card-body">
             	
               <div class="form-group">
					<label>Select User</label>
		                      <br>
		                      <select class="form-control select2" name="user" id="user_id" style="width:100% !important">
		                      	<option>select...</option>
		                      </select>
		         </div>
               <div class="form-group">
                 <label>Enter booking date</label>
                 <input type="date" name="bdate" class="form-control datepicker" id="capacity" />
               </div>
               <div class="form-group">
                 <label>Enter time</label>
                 <input type="time" name="btime" placeholder="enter description" class="form-control time-picker" id="table_desc" />
               </div>
             </div>
          	<input type="hidden" name="table" id="table_id">
             <div class="">
             		<button class="btn btn-success float-right" type="submit">Submit</button>
	               	<button class="btn btn-danger" data-dismiss="modal">Cancel</button>
             </div>
           </form>
       </div>
     </div>
   </div>
 </div>
  <script src="js/pg_js/home.js"></script>