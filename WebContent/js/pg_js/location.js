/**
 * 
 */

function deleteArea(id)
{
	swal({
	    title: 'Are you sure?',
	    text: 'Once deleted, you will not be able to recover this imaginary file!',
	    icon: 'warning',
	    buttons: true,
	    dangerMode: true,
	  })
	    .then((willDelete) => {
	      if (willDelete) {
	    	  window.location.href="insert?i=5&id="+id;
	        /*swal('Poof! Your imaginary file has been deleted!', {
	          icon: 'success',
	        });*/
	      } else {
	        swal('Your record cant deleted!');
	      }
	    });	
}


  function updateArea(id,name,code,cid,sid) {
	  $('#area_id').val(id);
	  $('#area_name').val(name);
	  $('#pincode').val(code);
	  $('#state_id').val(cid);
	  $('#city_id').val(sid);
	  $('#addArea').modal('show');
}

  function save_city(){
	  var state_id=$('#state_id').val();
	  var city_name=$('#city_name').val();
  
	  if(state_id==''){
			iziToast.info({
			    title: 'pl select state name!',
			    message: '',
			    position: 'topRight'
			  });
			$('#state_id').focus();
			return false;
		}

		if(city_name==''){
			iziToast.info({
			    title: 'pl enter city name!',
			    message: '',
			    position: 'topRight'
			  });
			$('#city_name').focus();
			return false;
		}

			var reg =  /^[A-Za-z]+$/;
			//^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

			if (reg.test(city_name) == false) 
			{
			iziToast.info({
			    title: 'pl enter correct name!',
			    message: '',
			    position: 'topRight'
			  });
			$('#city_name').focus();
			return false;
		}
		
		return true;
	  
  }
  
  function save_area(){
	  var state_id=$('#state_id').val();
	  var area_name=$('#area_name').val();
	  var pincode=$('#pincode').val();
	  
	  if(state_id==''){
			iziToast.info({
			    title: 'pl select state name!',
			    message: '',
			    position: 'topRight'
			  });
			$('#state_id').focus();
			return false;
		}
	  if(area_name==''){
			iziToast.info({
			    title: 'pl select area name!',
			    message: '',
			    position: 'topRight'
			  });
			$('#area_name').focus();
			return false;
		}
	  var reg = /\d{6}/;
		
			//var address = document.getElementById[email].value;
			if (reg.test(pincode) == false) 
			{
			iziToast.info({
			    title: 'pl enter correct pincode!',
			    message: '',
			    position: 'topRight'
			  });
			$('#pincode').focus();
			return false;
		}

	  
	  return true;
  }
  
  function save_state(){
	  var sname=$('#sname').val();
		if(sname==''){
			iziToast.info({
			    title: 'pl enter state name!',
			    message: '',
			    position: 'topRight'
			  });
			$('#sname').focus();
			return false;
		}
		var reg = /^[A-Za-z]+$/;
		//^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

			//var address = document.getElementById[email].value;
			if (reg.test(sname) == false) 
			{
			iziToast.info({
			    title: 'pl enter correct name!',
			    message: '',
			    position: 'topRight'
			  });
			$('#sname').focus();
			return false;
		}
		return true;
  }
  
//delete state
  function deletestate(id) {
  	if(confirm("are sure")){
  	 window.location.href="insert?i=1&id="+id;
  	}
  }

  function deletestate1(id) {
  		  swal({
  		    title: 'Are you sure?',
  		    text: 'Once deleted, you will not be able to recover this imaginary file!',
  		    icon: 'warning',
  		    buttons: true,
  		    dangerMode: true,
  		  })
  		    .then((willDelete) => {
  		      if (willDelete) {
  		    	  window.location.href="insert?i=1&id="+id;
  		        /*swal('Poof! Your imaginary file has been deleted!', {
  		          icon: 'success',
  		        });*/
  		      } else {
  		        swal('Your record cant deleted!');
  		      }
  		    });
  }

  //update State
  function updatestate(id,sname){
  		$('#stateid').val(id);
  		$('#sname').val(sname);
  		$('#addState').modal('show');
  	 //window.location.href="file?i=2&id="+id;
  }

  
  

//update city 
function updateCity(id,cname,sname){
		//alert(id+""+cname+""+sname);
		$('#city_id').val(id);
		$('#city_name').val(cname);
		$('#state_id').val(sname);
		$('#state_id').attr('selected','selected');
		$('#addCity').modal('show');
	 //window.location.href="file?i=2&id="+id;
}


//delete city
function deletecity(id) {
	swal({
		    title: 'Are you sure?',
		    text: 'Once deleted, you will not be able to recover this imaginary file!',
		    icon: 'warning',
		    buttons: true,
		    dangerMode: true,
		  })
		    .then((willDelete) => {
		      if (willDelete) {
		    	  window.location.href="insert?i=4&id="+id;
		        /*swal('Poof! Your imaginary file has been deleted!', {
		          icon: 'success',
		        });*/
		      } else {
		        swal('Your record cant deleted!');
		      }
		    });
}
