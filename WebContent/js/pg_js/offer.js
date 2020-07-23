/**
 * 
 */
 function info(){
	//alert("adf");
	var oname=$('#ofrname').val();
	var odiscount=$('#odiscount').val();
	
	var sdate=$('#startdate').val();
	var edate=$('#enddate').val();
	var sd=new Date(sdate);
	var ed=new Date(edate);
	
	
	var cd=new Date();
	sddate=sd.getDate();
	cddate=cd.getDate();
	//alert(cd);
	//alert("sdate+"+sd+"edate:"+ed+"currentdate:"+cd);
	if(oname == ''){
		  iziToast.info({
		    title: 'Pl. enter a value!',
		    message: 'sdfsf',
		    position: 'topRight'
		  });
		  return false;
	}
	
	if(odiscount==''){
		iziToast.info({
			    title: 'Pl.enter your name!',
			    message: 'iziToast toastr',
			    position: 'topRight'
		});
		return false;
	}
	
	if(cdate == sdate){
		iziToast.info({
		    title: 'Pl select the end date!',
		    message: 'iziToast toastr',
		    position: 'topRight'
		});
		return false;
	}
	
	if(ed < sd){
		iziToast.info({
		    title: 'select the greater of start date',
		    message: 'iziToast toastr',
		    position: 'topRight'
		});
		return false;
	}
	if(sdate < cdate){
		iziToast.info({
		    title: 'starting date is not before the current date!',
		    message: 'iziToast toastr',
		    position: 'topRight'
		});
		return false;
	}
	
	return true;
	
}

 //offer apply
 //menu checkbox
 function menu_dc(id) {
		
		$('#submenu').html("");
			$.ajax({
				url:'file',
				method:'POST',
				data:{'id':id,'i':3},
				success:function(data){
					 
					var prod=$.parseJSON(data);
					for (var i = 0; i < prod.length; i++) {
						var sd = $('<input type="checkbox"/>');
						sd.attr('value',prod[i].smid);
						sd.attr('name',"smname");
						var menu = $('<label/>');
						menu.html(prod[i].name);
						$('#submenu').append(sd);	
						$('#submenu').append(menu);
						$('#submenu').append('<br/>');
					}	
				}
			});
	}

function save(){
	var offer=$('#offer_id').val();
	var oapply=$('#oapply').val();
	var menu=$('#menu_id').val();
	
	
	if(offer==''){
		iziToast.info({
		    title: 'Pl select the offer!',
		    message: '',
		    position: 'topRight'
		});
		return false;
	}
	
	if(oapply=='offer past'){
		iziToast.info({
		    title: 'offer is past away!',
		    message: 'please select other offer',
		    position: 'topRight'
		});
		return false;
	}
	
	if(oapply=='offer infuture'){
		iziToast.info({
		    title: 'offer is infuture away!',
		    message: 'please select other offer',
		    position: 'topRight'
		});
		return false;
	}
	
	if(menu==''){
		iziToast.info({
		    title: 'Pl select the menu!',
		    message: '',
		    position: 'topRight'
		});
		return false;
	}

	return true;
}


//offer validation
function ckeck_offer(id){
	$('#oapply').html('');
	$.ajax({
		url:'file',
		method:'POST',
		data:{'id':id,'i':4},
		success:function(data){
			 var date=new Date();
			var prod=$.parseJSON(data);
			for (var i = 0; i < prod.length; i++) {
				var sdate=new Date(prod[i].sdate);
				var edate=new Date(prod[i].edate);
				if(sdate <= date && edate > date){
					$('#oapply').val("offer apply");
					//alert(prod[i].oid+" "+prod[i].oname+" "+prod[i].sdate+" "+prod[i].edate+" "+prod[i].odiscount);	
				}
				else if(sdate < date && edate < date){
					$('#oapply').val('offer past');
				}
				else if(sdate > date && edate > date){
					$('#oapply').val('offer infuture');
				}
			}	
		}
	});
}
//update offer
function updateOffer(oid,oname,sdate,edate,odiscount) {
	$('#oid').val(oid);
	$('#ofrname').val(oname);
	$('#startdate').val(sdate);
	$('#enddate').val(edate);
	$('#odiscount').val(odiscount);
	$('#addOffer').modal('show');
}



function deleteOffer(oid){
	  swal({
		    title: 'Are you sure?',
		    text: 'Once deleted, you will not be able to recover this imaginary file!',
		    icon: 'warning',
		    buttons: true,
		    dangerMode: true,
		  })
		    .then((willDelete) => {
		      if (willDelete) {
		    	  window.location.href="insert?i=10&id="+oid;
		        /*swal('Poof! Your imaginary file has been deleted!', {
		          icon: 'success',
		        });*/
		      } else {
		        swal('Your imaginary file is safe!');
		      }
		    });
}

window.onload=function(){
	/* function makem(){ */
		for (var i = 1; i <= 100; i++) {
			var sd = $('<option/>').attr('value',i).text(i+"%");
			$('#odiscount').append(sd);	
	 	}	 
	/*}*/
		
		/// coupon code
				{
			   var result           = '';
			   var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
			  //var characte	rs       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
			   var charactersLength = characters.length;
			   for ( var i = 0; i < 8; i++ ) {
			      result += characters.charAt(Math.floor(Math.random() * charactersLength));
			   }
			   
			   	$('#ofrname').val(result);
			}
				
				
	//			
		{
			$.ajax({
				url:'file',
				method:'POST',
				data:{'i':5},
				success:function(data){
					 var date=new Date();
					var prod=$.parseJSON(data);
					for (var i = 0; i < prod.length; i++) {
						var sdate=new Date(prod[i].sdate);
						var edate=new Date(prod[i].edate);
						if(sdate <= date && edate > date){
							var sd = $('<option/>');
							sd.attr('value',prod[i].oid).text(prod[i].oname);
							$('#offer_id').append(sd);	
						}//end else
						if(sdate > date && edate > date){
							var sd = $('<option/>');
							sd.attr('value',prod[i].oid).text(prod[i].oname);
							$('#offer_id').append(sd);	
						}//end else
					}//end for loop	
				}//end function
			});//end ajax
		}
}
/*if(sdate <= date && edate > date && sdate > date && edate > date)*/