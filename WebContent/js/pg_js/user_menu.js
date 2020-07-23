/**
 * 
 */

function item(id){
	
	//number of qty find 
	var qty=$('#qty'+id).val();
	//menu item
	var menu_item=$('#mitem'+id).val();
	 
	var tot=menu_item+","+qty;
	
	var arr=tot.split(",");
	for (var i = 0; i <= arr.length; i++) {
		var first=arr[0];
		var last=arr[arr.length - 1];
		var sum=first+","+last;
		$('#mitem'+id).val(sum);
		//alert(sum);
	}
}

function bill() {
	window.location.href="file?i=21";
}
function save() {
	var today = new Date();
	var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
	var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
	var dateTime = date+' '+time;

	$('#cdate').val(dateTime);
}

function close_order(id){
	window.location.href="file?i=21&userid="+id;
}
