
/**
 * 
 */
/*
window.onload=function()
{
	
      table = $('#sample_1').DataTable({
            dom: "Bflr<'table-responsive't><'row'<'col-md-5 col-12'i><'col-md-7 col-12'p>>",
            "bProcessing": true,
            buttons: [
            	 'copy', 'csv', 'excel', 'pdf', 'print', 'columnsToggle'
            ],
            
                ajax : "file?i=123",
            	columns : [ {
            		"area" : "aid"
            	},{
            		"area" : "aname"
            	},{
            		"area" : "zipcode"
            	},{
            		"area" : "sm.sid"
            	},{
            		"area" : "cm.sid"
            	} ],
            	columnDefs : [
            			{
            				"targets" : -1,
            				"data" : null,
            				"defaultContent" :'<div class="dropdown"> <button class="btn btn-primary dropdown-toggle" type="button" id="about-us" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Action </button> <div class="dropdown-menu" aria-labelledby="about-us"> <a class="dropdown-item" id="role_delete" data-target="#Role" >DELETE</a> </div>'}, {
            				"searchable" : false
            			}

            	],
            	"order" : [ [ 0, "desc" ] ],
            });
 }
*/
//state data from dropdown

function check(id) {
	
	$('#city_id').html("");
		$.ajax({
			url:'file',
			method:'POST',
			data:{'id':id,'i':1},
			success:function(data){
				 
				var prod=$.parseJSON(data);
				for (var i = 0; i < prod.length; i++) {
					var sd = $('<option/>');
					sd.attr('value',prod[i].cid).text(prod[i].cname);
					$('#city_id').append(sd);	
				}	
			}
		});
}
function darea(id) {
	/*alert(id);*/
	$('#area_id').html("");
		$.ajax({
			url:'file',
			method:'POST',
			data:{'id':id,'i':2},
			success:function(data){
				 
				var prod=$.parseJSON(data);
				for (var i = 0; i < prod.length; i++) {
					var sd = $('<option/>');
					sd.attr('value',prod[i].aid).text(prod[i].aname);
					$('#area_id').append(sd);	
				}		
			}
		});
}