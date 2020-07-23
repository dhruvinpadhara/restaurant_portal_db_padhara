/**
 *
 * You can write your JS code here, DO NOT touch the default style file
 * because it will make it harder for you to update.
 * 
 */

"use strict";

function status(id){
	window.location.href="insert?i=14&id="+id;
}


function updateTable(tid,tname,tcapacity,description){
	$('#tid').val(tid);
	$('#table_name').val(tname);
	$('#capacity').val(tcapacity);
	$('#table_desc').val(description);
	$('#addTable').modal('show');
}

function deleteTable(tid){
	  swal({
		    title: 'Are you sure?',
		    text: 'Once deleted, you will not be able to recover this imaginary file!',
		    icon: 'warning',
		    buttons: true,
		    dangerMode: true,
		  })
		    .then((willDelete) => {
		      if (willDelete) {
		    		window.location.href="insert?i=9&id="+tid;
		        /*swal('Poof! Your imaginary file has been deleted!', {
		          icon: 'success',
		        });*/
		      } else {
		        swal('Your imaginary file is safe!');
		      }
		    });
}

//data table JS 
function log(id,name) {
		$.ajax({
			url:'insert',
			method:'POST',
			data:{'id':id,'i':29,'name':name},
			success:function(data){
				 
			}
		});
}


