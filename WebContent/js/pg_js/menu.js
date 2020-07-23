/**
 * $(document).ready(function(){
        var url = $('img').attr('src');
        console.log(url);
        $('input:file').val(url);
});
 */

//update menu
function updatemenu(mid,mname,mdesc,mimage){
	$('#menu_id').val(mid);
	$('#menu_name').val(mname);
	$('#menu_desc').val(mdesc);
//	$('input:file').val(mimage);
	$('#addMenu').modal('show');
}
//menu
function deleteMenu(mid){
	swal({
	    title: 'Are you sure?',
	    text: 'Once deleted, you will not be able to recover this imaginary file!',
	    icon: 'warning',
	    buttons: true,
	    dangerMode: true,
	  })
	    .then((willDelete) => {
	      if (willDelete) {
	    	  window.location.href="insert?i=8&id="+mid;
	        /*swal('Poof! Your imaginary file has been deleted!', {
	          icon: 'success',
	        });*/
	      } else {
	        swal('Your record cant deleted!');
	      }
	    });
	//window.location.href="insert?i=8&id="+mid;
}

//update subMenu
function updatesubmenu(sid,mname,name,price,desc){
	$('#smid').val(sid);
	$('#menuid').val(mname);
	$('#smname').val(name);
	$('#smprice').val(price);
	$('#smdesc').val(desc);
	$('#addSubmenu').modal('show');
}

//submenu delete
function deletesm(id) {
	swal({
	    title: 'Are you sure?',
	    text: 'Once deleted, you will not be able to recover this imaginary file!',
	    icon: 'warning',
	    buttons: true,
	    dangerMode: true,
	  })
	    .then((willDelete) => {
	      if (willDelete) {
	    	  window.location.href="insert?i=6&id="+id;
	        /*swal('Poof! Your imaginary file has been deleted!', {
	          icon: 'success',
	        });*/
	      } else {
	        swal('Your record cant deleted!');
	      }
	    });
	//window.location.href="insert?i=6&id="+id;
}

function clear_menu(){
	$('#menu_form').get(0).reset();
}

function savemenu(){
	var mname=$('#menu_name').val();
	var mdesc=$('#menu_desc').val();
	if(mname==''){
		  iziToast.info({
			    title: 'enter menu name!',
			    message: '',
			    position: 'topRight'
			  });
			  $('#menu_name').focus();
			  return false;
	}
	if(mdesc==''){
		  iziToast.info({
			    title: 'enter menu descriptiom!',
			    message: '',
			    position: 'topRight'
			  });
			  $('#menu_desc').focus();
			  return false;
	}
	return true;
}

function save_submenu(){
	var menuid=$('#menuid').val();
	var smname=$('#smname').val();
	var smprice=$('#smprice').val();
	var smdesc=$('#smdesc').val();
	var customFile=$('#customFile').val();
	if(menuid==''){
		  iziToast.info({
			    title: 'select menu name!',
			    message: '',
			    position: 'topRight'
			  });
			  $('#menuid').focus();
			  return false;
	}
	if(smname==''){
		  iziToast.info({
			    title: 'enter sub menu name !',
			    message: '',
			    position: 'topRight'
			  });
			  $('#smname').focus();
			  return false;
	}
	var reg = /\d/;
	if(reg.test(smprice)==false){
		  iziToast.info({
			    title: 'enter menu price name!',
			    message: '',
			    position: 'topRight'
			  });
			  $('#smprice').focus();
			  return false;
	}
	if(smdesc==''){
		  iziToast.info({
			    title: 'enter sub menu descriptiom!',
			    message: '',
			    position: 'topRight'
			  });
			  $('#smdesc').focus();
			  return false;
	}
}