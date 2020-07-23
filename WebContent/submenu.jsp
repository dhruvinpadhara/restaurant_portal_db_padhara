<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style><style>
  .pd{
		overflow: hidden;
		/* overflow:scroll; */
		/* overflow:auto; */
		/* overflow:visible; */
		padding: 20px;
	}
	.pd .db{
		transition: all 0.6s ease-in;
		overflow: hidden;
	}
	.pd:hover .db{
		transform: scale(2,2);
	}
  </style></style>
<section class="section">
       <div class="section-body">
         <div class="row">
       <div class="col-12">
         <div class="card">
           <div class="card-header">
             <h4>Sub-menu details</h4>
           </div>
           <div class="card-body">
             <div class="table-responsive">
               <table class="table table-striped table-hover" id="tableExport" style="width:100%;">
                 <thead>
                   <tr>
                     <th>No</th>
                     <th>Menu name</th>
                     <th>items Name</th>
                     <th>Price</th>
                     <th>Description</th>
                     <th>Image</th>
                     <th>Action</th>
                   </tr>
                 </thead>
                 <tbody>
                  <c:if test="${not empty smenu}">
                  		<c:forEach items="${smenu}" var="sm" varStatus="count">
		                  <tr>
		                   	<td>${count.count}</td>
		                   	<td>${sm.mid.mname}</td>
		                   	<td>${sm.name}</td>
		                   	<td>${sm.price}</td>
		                   	<td>${sm.smdesc }</td>
		                   	<td><div class="pd"><figure class="avatar mr-2 avatar-xl md"><img src='<c:url value="uploads/${sm.image }"/>'/></figure></div></td>
		                   	<td><button class="btn btn-icon btn-primary" onclick="updatesubmenu(${sm.smid},'${sm.mid.mname}','${sm.name}',${sm.price},'${sm.smdesc}')"><i class="far fa-edit"></i></button>
		                   	<button class="btn btn-icon btn-danger" onclick="deletesm(${sm.smid})"><i class="fas fa-times"></i></button></td>	
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
 
 <div style="position: fixed;bottom: 20px;right:15px;z-index: 1" data-toggle="modal" data-target="#addSubmenu"><input type="button" class="btn btn-danger" value="+"></div>
 <!-- form end -->
  <div class="modal fade" id="addSubmenu" tabindex="-1" role="dialog" aria-labelledby="formModal"
   aria-hidden="true">
   <div class="modal-dialog modal-lg" role="document">
     <div class="modal-content">
       <div class="modal-header">
       <h5 class="modal-title" id="formModal">Sub-menu Form</h5>
         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
           <span aria-hidden="true">&times;</span>
         </button>
       </div>
       <div class="modal-body">
         <form action="submenuControl" enctype="multipart/form-data" method="post">
         <!-- <form class="needs-validation" autocomplete="off" action="insert" method="post"> -->
         <!-- <input type="hidden" name="i" value=9> -->
         <input type="hidden" name="id" id="smid">	
             		<div class="row">
	             		<div class="form-group col-md-6 float-left">
		                     <label>Select Menu name</label>
		                     <br>
		                     <select class="form-control select2" id="menuid" name="mid"  style="width:100% !important">
			                      <option value="">select...</option>
			                      <c:if test="${not empty menu}">      
					                      <c:forEach items="${menu}" var="d">
					                        <option  <%--  <c:if test="${view.id.sid eq d.sid}">selected</c:if>  --%>value="${d.mid}" id="state_id" >${d.mname}</option>
					                      </c:forEach>
									</c:if>
		                     </select>
		            	</div>
		            	<div class="form-group col-md-6 float-left">
			                 <label>Enter Sub-menu name</label>
			                 <input type="text" name="name" id="smname" placeholder="enter items name" class="form-control">
		                </div>
	               	</div>
	                 <div class="form-group">
		                 <label>Enter Price name</label>
		                 <input type="text" name="price" id="smprice" placeholder="enter price" class="form-control">
	                 </div>
	                 <div class="form-group">
		                 <label>Enter Description</label>
		                 <input type="text" name="desc" id="smdesc" placeholder="enter items description" class="form-control">
	                 </div>
	              
	                 <div class=demo-upload-container role=main>
				        <div class=custom-file-container data-upload-id=myFirstImage>
				            <label>Upload menu image
				             <a href=javascript:void(0) class=custom-file-container__image-clear title="Clear Image">&times;</a>
				            </label> 
				            <label class=custom-file-container__custom-file style="background-color:#dbc7c7; !important">
				                <input type=file name="file" class="file-input" id="customFile" accept=image/*>			                
				                 <input type=hidden  value=10485760>
				                  <span class=custom-file-container__custom-file__custom-file-control></span>
				              </label>
				            <div class=custom-file-container__image-preview></div>
				        </div>
				     </div>
             <div class="">
               <button class="btn btn-success float-right" type="submit" onclick="return save_submenu()">Submit</button>
               <button class="btn btn-danger" data-dismiss="modal">Cancel</button>
             </div>
           </form>
       </div>
     </div>
   </div>
 </div>
 <script src="js/pg_js/menu.js"></script>