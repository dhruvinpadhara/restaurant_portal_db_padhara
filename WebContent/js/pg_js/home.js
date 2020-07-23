
function table(id){
	$('#table_id').val(id);
}
// 0 pending 1 manas 2 dispach


function check(){
	var bconfirm=$('#tabbookred').val();
	var  tb=$('#tabbook').val()
	if(tb==0){
		$('#table_color').addClass('l-bg-blue');
	}
	else if(bconfirm==1){
		$('#table_color').addClass('l-bg-red');
	}
	else{
		$('#table_color').addClass('l-bg-green');
	}
}


/*(function(){
	var ab=$('#book').val();
	$('#table_color').addClass("l-bg-green");
})*/

window.onload=function(){
	/*alert(id);*/
	
	
/*	$('#user_id').html("");
	$.ajax({
		url:'file',
		method:'POST',
		data:{'i':6},
		success:function(data){
			 
			var prod=$.parseJSON(data);
			for (var i = 0; i < prod.length; i++) {
				var sd = $('<option/>');
				sd.attr('value',prod[i].uid).text(prod[i].uname);
				$('#user_id').append(sd);	
			}		
		}
	});*/
}
