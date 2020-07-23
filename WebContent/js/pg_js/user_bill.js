/**
 * 
 */
function gtot(id){
		var tot=0;
		for (var i = 1; i <= id; i++) {
			tot=parseInt(tot)+parseInt($('#tot'+i).html());
		}
		$('#stotal').val(tot.toFixed(2));
		
		var subtot=$('#sub_total').html(tot.toFixed(2));
		var gst=parseInt(tot)*5/100;
		$('#gst').html(parseFloat(gst));
		var subtotal=parseInt(tot)+parseFloat(gst);
		$('#grand_total').html(subtotal.toFixed(2));
		
		$('#sgst').val(gst);
		var gtot=parseFloat(tot)+((parseInt(gst)*parseFloat(tot))/100);
		
		$('#sgrand_total').val(gtot);
		$('#sgrand_total').val(subtotal.toFixed(2));
		
	}
	
	function printform(){
		var d=document.getElementById("bill_form");
		window.print(d);
	}
	
	function save(){
		var payment_type=$('#payment_type').val();
		if(payment_type==""){
			$('#invalid').html("Pl.select the payment type");
			return false;
		}
		return true;
	}