window.onload=function(){
	$('#email_id').focus();
	$('#cpass').focus();
}	
function save(){
	
	var email=$('#email_id').val();
	var passwd=$('#passwd').val();
	if(email == ''){
		  iziToast.info({
		    title: 'Pl. enter the email_id!',
		    message: '',
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
     		    title: 'invalid email address!',
     		    message: 'enter the particular email',
     		    position: 'topRight'
     		  });
        	 $('#email_id').focus();
            return false;
        }
        if(passwd == ''){
  		  iziToast.info({
  		    title: 'Pl. enter the password!',
  		    message: '',
  		    position: 'topRight'
  		  });
  		  $('#passwd').focus();
  		  return false;
  		}
       return true;
}
function change_pass(){
	var changepassword=$('#cpass').val();
	var upassword=$('#epass').val();
	var confirmpass=$('#comfirmpass').val();

	if(changepassword==''){
		iziToast.info({
		    title: 'pl.enter the old password!',
		    message: '',
		    position: 'topRight'
		  });
		$('#cpass').focus();
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
	return true;
}