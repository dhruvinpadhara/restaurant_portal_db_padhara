<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section class="section">
       <div class="section-body">
         <div class="row">
       <div class="col-12">
         <div class="card">
           <div class="card-header">
             <h4>Menu table</h4>
           </div>
           <div class="card-body">
             <div class="table-responsive">
               <table class="table table-striped table-hover" id="tableExport" style="width:100%;">
                 <thead>
                   <tr>
                     <th>No</th>
                     <th>Menu Name</th>
                     <th>Menu Image</th>
                     <th>Menu description</th>
                     <th>Action</th>
                   </tr>
                 </thead>
                 <tbody>
                 <c:forEach items="${data}" var="d" varStatus="cn">
	                  <tr>               
	                   	<td>${cn.count}</td>
	                   	<td>${d.mname }</td>
	                   	<td><figure class="avatar mr-2 avatar-xl"><img src='<c:url value="uploads/${d.mimage }"/>'/></figure></td>
	                   	<td>${d.mdesc}</td>
	                   	
	                   	<td><button class="btn btn-icon btn-primary" onclick="updatemenu(${d.mid},'${d.mname}','${d.mdesc}','${d.mimage }')"><i class="far fa-edit"></i></button>
	                   	<button class="btn btn-icon btn-danger" onclick="deleteMenu(${d.mid})"><i class="fas fa-times"></i></button></td>	
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
<div style="position: fixed;bottom: 20px;right:15px;z-index: 1"><input type="button" class="btn btn-danger" data-toggle="modal" data-target="#addMenu" value="+"></div>

 <!--Insert form-->
 <div class="modal fade" id="addMenu" tabindex="-1" role="dialog" aria-labelledby="formModal"
   aria-hidden="true">
   <div class="modal-dialog modal-lg" role="document">
     <div class="modal-content">
       <div class="modal-header">
         <h5 class="modal-title">Menu table</h5>
         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
           <span aria-hidden="true">&times;</span>
         </button>
       </div>
       <div class="modal-body">
         <!--  -->
         <form action="menuControl" enctype="multipart/form-data" method="post">
            <!-- <form action="insert" method="post"> -->
            <!-- <input type="hidden" name="i" value=4> -->
            <input type="hidden" name="id" id="menu_id">
             <div class="card-body">
               <div class="form-group">
                 <label>Enter Menu Name</label>
                 <input type="text" name="mname" id="menu_name" class="form-control" placeholder="enter menu name">
               </div>
                <div class="form-group">
                 <label>Enter Menu description</label>
                 <input type="text" class="form-control" name="menudesc" id="menu_desc" placeholder="enter menu description">
               </div>
                <div class=custom-file-container data-upload-id=myFirstImage>
               		<label>Upload (Single File) <a href=javascript:void(0) class=custom-file-container__image-clear title="Clear Image">&times;</a></label>
               		 <label class=custom-file-container__custom-file>
	               		 <input type=file name="file" class=custom-file-container__custom-file__custom-file-input id=customFile accept=image/* aria-label="Choose File"> 
	               		 <input type=hidden name=MAX_FILE_SIZE value=10485760> 
	               		 <span class=custom-file-container__custom-file__custom-file-control></span>
               		 </label>
            	<div class=custom-file-container__image-preview></div>
        		</div>
                		
               
             </div>
             <div class="">
	               <button class="btn btn-success float-right" onclick="return savemenu()" type="submit">Submit</button>
	               <button class="btn btn-success center" type="reset">Reset</button>
	               <button class="btn btn-danger" data-dismiss="modal">Cancel</button>
             </div>
           </form>
         
       </div>
     </div>
   </div>
 </div>
 
 
 <!-- form end -->
<script src="js/jquery-3.2.1.min.js"></script>
<script src=js/vendor.js> </script> 
<script src="js/pg_js/menu.js"></script>
 

 