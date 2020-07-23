/**
 * 
 */
function updateemp(id) {
	window.location.href="file?i=13&id="+id;
}
 
function deleteemployee(id){
	swal({
	    title: 'Are you sure?',
	    text: 'Once deleted, you will not be able to recover this imaginary file!',
	    icon: 'warning',
	    buttons: true,
	    dangerMode: true,
	  })
	    .then((willDelete) => {
	      if (willDelete) {
	    	  window.location.href="insert?i=7&id="+id;
	        /*swal('Poof! Your imaginary file has been deleted!', {
	          icon: 'success',
	        });*/
	      } else {
	        swal('Your record cant deleted!');
	      }
	    });
	//window.location.href="insert?i=7&id="+id;
}

function saverole(){
	var rname=$('#role_name').val();
	var rdesc=$('#role_desc').val();
	if(rname==''){
		iziToast.info({
		    title: 'pl enter role!',
		    message: '',
		    position: 'topRight'
		  });
		$('#role_name').focus();
		  return false;
	}
/*		var reg = /^[A-Za-z_A-Za-z]$/;
		var ref= /^\w$/
*/
		//var address = document.getElementById[email].value;
		/*if (reg.test(rname) == true || ref.test(rname)==false) 
			{
				iziToast.info({
				 title: 'pl. enter valid role name!',
				 message: '',
				 position: 'topRight'
				});
			$('#role_name').focus();
			return false;
			}*/
		if(rdesc==''){
			iziToast.info({
			    title: 'pl enter desc!',
			    message: '',
			    position: 'topRight'
			  });
			  $('#role_desc').focus();
			  return false;
		}
		/*var regx1 = /^[A-Za-z]+$/;
		if (regx1.test(rdesc) == false){
				iziToast.info({
				 title: 'pl. enter valid desc!',
				 message: '',
				 position: 'topRight'
			});
			$('#role_desc').focus();
			return false;
		}*/
	return true;
}

//Update role
function updateRole(id,rname,rdesc) {
	$('#role_id').val(id);
	$('#role_name').val(rname);
	$('#role_desc').val(rdesc);
	$('#addRole').modal('show');
}
//delete role
function deleteRole(id)
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
	    	  window.location.href="insert?i=2&id="+id;
	        /*swal('Poof! Your imaginary file has been deleted!', {
	          icon: 'success',
	        });*/
	      } else {
	        swal('Your record cant deleted!');
	      }
	    });

}

//alert("adf");


function save(){

	
	var role=$('#role_id').val();
	var empname=$('#empname').val();
	var email=$('#email_id').val();
	var adress=$('#adress').val();
	var enumber=$('#enumber').val();
	var state=$('#state_id').val();
	var area=$('#area_id').val();
	var date=$('#birth_date').val();
	
	var esalary=$('#esalary').val();
	
	var upassword=$('#epass').val();
	var confirmpass=$('#comfirmpass').val();

	
	var bdate=new Date(date);
	var dt=new Date();
	var cdate=dt.getDate();
	var sdate=bdate.getDate();
	//alert(bdate+" "+dt+" cdate:"+cdate+" selec date"+sdate);
	//birth date
	
	
	//var cknumber=parseInt(enumber);
	//role
	if(role == ''){
		  iziToast.info({
		    title: 'Pl. select the role!',
		    message: 'sdfsf',
		    position: 'topRight'
		  });
		  $('#role_id').focus();
		  return false;
	}
	
	if(empname == ''){
		  iziToast.info({
		    title: 'Pl. enter the emp name!',
		    message: 'sdfsf',
		    position: 'topRight'
		  });
		  $('#empname').focus();
		  return false;
	}
	
	if(email == ''){
		  iziToast.info({
		    title: 'Pl. enter the email_id!',
		    message: 'sdfsf',
		    position: 'topRight'
		  });
		  $('#email_id').focus();
		  return false;
	}
		
    	var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
    				//^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

        //var address = document.getElementById[email].value;
        if (reg.test(email) == false) 
        {
        	 iziToast.info({
     		    title: 'invalid email_id!',
     		    message: 'enter the particular email',
     		    position: 'topRight'
     		  });
        	 $('#email_id').focus();
            return false;
        }
		
        if(adress==''){
        	iziToast.info({
        		title:'pl.enter the adress',
        		message:'',
        		position:'topRight'
        	});
        	$('#adress').focus();
        	return false;
        }
		
        //eumber
    	if(enumber == ''){
  		  iziToast.info({
  		    title: 'pl.enter mobile number!',
  		    message: '',
  		    position: 'topRight'
  		  });
  		  $('#enumber').focus();
  		  return false;
    	}
    	

    	var mnum=/^[0]?[789]\d{9}$/;
    	if(mnum.test(enumber) == false){
    		iziToast.info({
    		 title: 'invalid mobile number!',
    		 message: 'enter the particular number',
    		 position: 'topRight'
    		});
    	$('#enumber').focus();
    	return false;
    	}
    	
    	//state
    	if(state == ''){
    		  iziToast.info({
    		    title: 'Pl. select the state!',
    		    message: 'sdfsf',
    		    position: 'topRight'
    		  });
    		  $('#state_id').focus();
    		  return false;
    	}
    	//area
    	if(area == ''){
    		iziToast.info({
    		    title: 'pl.enter area number!',
    		    message: '',
    		    position: 'topRight'
    		  });
    		$('#area_id').focus();
    		  return false;
    	}
    	
    	if(upassword==''){
    		iziToast.info({
    		    title: 'pl.enter the password!',
    		    message: '',
    		    position: 'topRight'
    		  });
    		$('#epass').focus();
    		return false;
    	}
    	
    	if (confirmpass==''){
    		iziToast.info({
    		    title: 'pl.enter confirm password!',
    		    message: '',
    		    position: 'topRight'
    		  });
    		$('#comfirmpass').focus();
    		return false;
    	}
    	
    	if(upassword!=confirmpass){
    		iziToast.info({
    		    title: 'pl.enter same password!',
    		    message: '',
    		    position: 'topRight'
    		  });
    		$('#comfirmpass').focus();
    		return false;
    	}   	
    	if(cdate == sdate){
    		
    		iziToast.info({
    		    title: 'pl select birth date!',
    		    message: '',
    		    position: 'topRight'
    		  });
    		  return false;
    	}
    	if(bdate < dt){
    		
    	}
    	else{
    		iziToast.info({
    		    title: 'pl invalid date!',
    		    message: '',
    		    position: 'topRight'
    		  });
    		  return false;
    	}
	return true;
}

