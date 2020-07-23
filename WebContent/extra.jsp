<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<table id="example">
		<tr>
			<th>no</th>
			<th>city name</th>
			<th>state name</th>
		</tr>
	</table>
</body>
<script src="js/jquery-3.2.1.min.js"></script>
<script>
  window.onload=function(){
    $('#example').DataTable( {
        ajax: "insert?i=15",
        columns: [
            { "cid": "cid" },
            { "cname": "cname" },
            { "id": "id" }
        ]
    } );
}  
   /* window.onload=function(){
	 	$.ajax({
			url:'insert',
			method:'get',
			data:{'i':15},
			success:function(data){
				 
				var prod=$.parseJSON(data);
				 for (var i = 0; i < prod.length; i++) {
					 doument.write(prod[i])
					/* var sd = $('<option/>');
					sd.attr('value',prod[i].cid).text(prod[i].cname);
					$('#city_id').append(sd); */	
				} 	
			}
		});	 
 } */
  
 </script>
</html>