/**
 * 
 */

function pass(number){
	$('#upassword').val(number);
}

function activeuser(uid,status){
	window.location.href="insert?i=13&id="+uid+"&status="+status;
}

function blockuser(uid,status){
/*	alert("uid :"+uid+" status :"+status);*/
	window.location.href="insert?i=13&id="+uid+"&status="+status;
}

function deleteuser(id) {
	  swal({
	    title: 'Are you sure?',
	    text: 'Once deleted, you will not be able to recover this imaginary record!',
	    icon: 'warning',
	    buttons: true,
	    dangerMode: true,
	  })
	    .then((willDelete) => {
	      if (willDelete) {
	    	  window.location.href="insert?i=11&id="+id;
	        /*swal('Poof! Your imaginary file has been deleted!', {
	          icon: 'success',
	        });*/
	      } else {
	        swal('Your imaginary file is safe!');
	      }
	    });
}

function updateuser(id,uname,unumber,email,amd){
	/*alert(id+uname+unumber+email+amd);*/
	$('#user_id').val(id);
	$('#username').val(uname);
	$('#usernumber').val(unumber);
	$('#email').val(email);
	$('#Uregestration').modal('show');
}




function checkpass(){

}


function add_user(){
	var username=$('#username').val();
	var usernumber=$('#usernumber').val();
	var upassword=$('#upassword').val();
	var email=$('#email').val();
	var area_id=$('#area_id').val();
	
	
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
		 message: 'enter the particular number',
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
	
	if(area_id==''){
		iziToast.info({
			 title: 'select the area!',
			 message: 'select area',
			 position: 'topRight'
			});
		$('#area_id').focus();
		return false;
	}
		return true;
}