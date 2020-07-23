/**
 * 
 */

//delete Privilege
function deleteprivilege(id) {
	 if(confirm("are you sure"))
	 {
	 window.location.href="insert?i=3&id="+id;
	 }
}

//update Priviledge
function updateprivilege(id,pname){
		$('#Privilegeid').val(id);
		$('#Privilegename').val(pname);
		$('#addPrivilege').modal('show');
	 //window.location.href="file?i=2&id="+id;
}

//add row for Privilege components
var ss = 1;
function addprvi() {
	var add = document.getElementById('add');
	var a = ['<td><input type="text" class="form-control" name="cname" placeholder="Component name" required></td>'
		,'<td><input type="text" placeholder="Component link" class="form-control" name="clink" required></td>',
		'<td><button class="btn btn-icon btn-danger" onclick="removeprvi(',ss,')">Delete</button></td>'].join('');
	var s = document.createElement('tr');
	s.innerHTML = a;
	s.id = 'papa'+ss;
	ss++;
	add.appendChild(s);
}

//delete for Privilege components
function removeprvi(ass) {
	var add = document.getElementById('add');
	var tt =  document.getElementById('papa'+ass);
	add.removeChild(tt);
}