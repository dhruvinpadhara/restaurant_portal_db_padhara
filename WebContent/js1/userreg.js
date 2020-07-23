function user_validate(){
	var username=$('#username').val();
	var usernumber=$('#usernumber').val();
	var email=$('#email').val();
	var area_id=$('#area_id').val();
	var upassword=$('#upassword').val();
	var confirmpass=$('#comfirmpass').val();

	if(username==''){
			iziToast.info({
			 title: 'enter name!',
			 message: 'enter the uname name',
			 position: 'topRight'
			});
		$('#username').focus();
		return false;
	}
		
	if(usernumber==''){
			iziToast.info({
			 title: 'enter number!',
			 message: 'enter the number',
			 position: 'topRight'
			});
		$('#usernumber').focus();
		return false;
		}
	
	var mnum=/^[0]?[789]\d{9}$/;
	if(mnum.test(usernumber) == false){
		iziToast.info({
		 title: 'invalid mobile number!',
		 message: 'enter the particular email',
		 position: 'topRight'
		});
	$('#usernumber').focus();
	return false;
	}
	
	if(email == ''){
			iziToast.info({
			 title: 'enter email_id!',
			 message: 'enter the particular email',
			 position: 'topRight'
			});
		$('#email').focus();
		return false;
		}
	
	var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
	if(reg.test(email) == false){
			iziToast.info({
			 title: 'invalid email_id!',
			 message: 'enter the particular email',
			 position: 'topRight'
			});
		$('#email').focus();
		return false;
		}
	
	if(upassword==''){
		iziToast.info({
		    title: 'pl.enter the password!',
		    message: '',
		    position: 'topRight'
		  });
		$('#upassword').focus();
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
		return false;
	}

	
	if(area_id==''){
		iziToast.info({
			 title: 'invalid email_id!',
			 message: 'select area',
			 position: 'topRight'
			});
		$('#area_id').focus();
		return false;
	}
	return true;
}