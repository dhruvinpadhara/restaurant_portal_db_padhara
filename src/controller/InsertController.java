package controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.objectweb.asm.attrs.Annotation;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

import dao.dao;
import dao.daoimpl;
import model.Registration_model;
import model.Area_model;

import model.City_model;
import model.Employee_model;
import model.Login_log;
import model.Book_model;
import model.Menu_model;
import model.Order_cart_model;
import model.Order_child_model;
import model.Order_master_model;
import model.Payment_model;
import model.Paytm_model;
import model.Role_model;
import model.State_model;
import model.Submenu_model;
import model.Table_model;
import model.Transaction_log;

public class InsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertController() {
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 	
    	
    	dao d=new daoimpl();
    	int y=0;
    	PrintWriter pw=response.getWriter();
    	byte i=Byte.parseByte(request.getParameter("i"));
    	switch (i) {
		case 1:
			int id=Integer.parseInt(request.getParameter("id"));
			y=d.updatedata("State_model","sid", id);
			if(y>0){
				response.sendRedirect("file?i=2");
			}
			else{
				pw.write("<h1>some problem for your tansation</h1>");
				System.out.println("not deleted");
				//response.sendRedirect("file?i=2");
			}
			break;
		
		case 2:
			id=Integer.parseInt(request.getParameter("id"));
			y=d.updatedata("Role_model","role_id", id);
			if(y>0){
				response.sendRedirect("file?i=8");
			}
			else{
				System.out.println("not deleted");
			}
			break;
		case 4:
			id=Integer.parseInt(request.getParameter("id"));
			y=d.updatedata("City_model"," cid", id);
			if(y>0){
				response.sendRedirect("file?i=3");
			}
			else{
				System.out.println("not deleted");
			}
			break;
		case 5:
			id=Integer.parseInt(request.getParameter("id"));
			y=d.updatedata("Area_model"," aid", id);
			if(y>0){
				response.sendRedirect("file?i=4");
			}
			else{
				System.out.println("not deleted");
			}
			break;
		case 6:
			id=Integer.parseInt(request.getParameter("id"));
			y=d.updatedata("Submenu_model","smid", id);
			if(y>0){
				response.sendRedirect("file?i=6");
			}
			else{
				System.out.println("not deleted");
			}
			break;
		case 7:
			id=Integer.parseInt(request.getParameter("id"));
			y=d.updatedata("Employee_model", "eid", id);
			if(y>0){
				response.sendRedirect("file?i=11");
			}
			else{
				System.out.println("not deleted");
			}
			break;
		case 8:
			id=Integer.parseInt(request.getParameter("id"));
			y=d.updatedata("Menu_model", "mid", id);
			if(y>0){
				response.sendRedirect("file?i=5");
			}
			else{
				System.out.println("not deleted");
			}
			break;
		case 9:
			id=Integer.parseInt(request.getParameter("id"));
			y=d.updatedata("Table_model", "tid", id);
			if(y>0){
				response.sendRedirect("file?i=7");
			}
			else{
				System.out.println("not deleted");
			}
			break;
		
		case 11:
			id=Integer.parseInt(request.getParameter("id"));
			y=d.updatedata("Registration_model", "uid", id);
			if(y>0){
				response.sendRedirect("file?i=14");
			}
			else{
				System.out.println("not deleted");
			}
			break;
		case 12:
			id=Integer.parseInt(request.getParameter("id"));
			Registration_model reg_m=new Registration_model(id);
			y=d.del(reg_m);
			//y=d.updatedata("Employee_model", "eid", id);
			if(y>0){
				response.sendRedirect("file?i=20");
			}
			else{
				System.out.println("not deleted");
			}
			break;
		case 13:
			id=Integer.parseInt(request.getParameter("id"));
			byte status=Byte.parseByte(request.getParameter("status"));
			
			if(status==0){
				status=1;
			}
			else{
				status=0;
			}
			y=d.updatestatus("Registration_model",status,"uid", id);
			if(y>0){
				response.sendRedirect("file?i=14");
			}
			else{
				System.out.println("not deleted");
			}
			break;
		case 14:
			id=Integer.parseInt(request.getParameter("id"));
			status=1;
			
			Order_child_model om=d.getData(new Order_child_model(), id);
			Date dt=new Date();
			int sm=om.getSmid().getSmid();
			int oid=om.getOid().getOid();
			int qty=om.getQty();
			Submenu_model smm=new Submenu_model(sm);
			Order_master_model omm=new Order_master_model(oid);	
			Order_child_model ocm=new Order_child_model(id, smm, omm, qty, status, dt);
			y=d.Update(ocm);
			if(y>0){
				response.sendRedirect("file?i=20");
			}
			else{
				System.out.println("not deleted");
			}
			break;
		case 15:
			List ls121=d.view("City_model");
			
			GsonBuilder b1 = new GsonBuilder();
			b1.registerTypeAdapterFactory(HibernateProxyTypeAdapter.FACTORY);
			
			Gson gson1 = b1.create();
		    PrintWriter pw1=response.getWriter();
			String d2 = gson1.toJson(ls121);
			pw1.print(d2);
			break;
		default:
			break;
		}
    }
	


       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
		int y=0;
		int z=0;
		dao d=new daoimpl();
		byte i=Byte.parseByte(request.getParameter("i"));
		HttpSession db=request.getSession(); 
		switch (i) {
		case 0:
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			Employee_model em1=new Employee_model(email, password);
			
			List ld=d.check_log("Employee_model",em1);
			
			switch ((Byte)ld.get(0)) {
			case 0:
				System.out.println("wrong username");
				db.setAttribute("msg","wrong user name");
				response.sendRedirect("file?i=0");
				break;
			case 1:
				System.out.println("wrong password");
				db.setAttribute("msg","wrong password");
				response.sendRedirect("file?i=0");
				break;
			case 2:
				System.out.println("user and password");
				db.setAttribute("msg","user and password success");
				response.sendRedirect("file?i=0");
				break;
			case 3:
				Employee_model l=(Employee_model) ld.get(1);
				System.out.println(l.getEid());
				System.out.println(l.getEname());
				System.out.println(l.getRid().getRole_name());
				//System.out.println("success");
				db.setAttribute("empname", l.getEname());
				db.setAttribute("empid",l.getEid());
				db.setAttribute("role", l.getRid().getRole_name());
				int empid=(Integer)db.getAttribute("empid");
				Date dt=new Date();
				Employee_model emp_log=new Employee_model(empid);
				Login_log llog=new Login_log(emp_log,dt);
				y=d.insert(llog);
				if(y>0){
					response.sendRedirect("file?i=1");	
				}
				else{
					System.out.println("some problem");
				}
				break;
			}
			
			break;
		case 1:
			String idd=request.getParameter("sid");
			String sname=request.getParameter("statename");
			int id=0; 
			if(!idd.isEmpty()){
				id=Integer.parseInt(request.getParameter("sid"));
			}
			State_model s=new State_model(id,sname);
			if(!idd.isEmpty()){
				y=d.Update(s);
			}
			else{
				y=d.insert(s);
			}
			if(y>0){
				response.sendRedirect("file?i=2");
			}
			else{
				System.out.println("data cant inserted");
			}
			break;

		case 2:
			idd=request.getParameter("id");
			String rolename=request.getParameter("name");
			String desc=request.getParameter("desc");
			id=0; 
			if(!idd.isEmpty()){
				id=Integer.parseInt(request.getParameter("id"));
			}
			Role_model rm=new Role_model(id,rolename,desc);
			if(!idd.isEmpty()){
				y=d.Update(rm);
			}
			else{
				y=d.insert(rm);
			}
			if(y>0){
				response.sendRedirect("file?i=8");
			}
			else{
				System.out.println("data cant inserted");
			}
			break;
		case 3:
			int userid=(Integer)db.getAttribute("userid");
			int tid=10;
			Table_model tabm=new Table_model(tid);
			
			Date odate=new Date();
			//set reg model
			Registration_model reg_model=new Registration_model(userid);
			
			//set data from order master 
			Order_master_model omm=new Order_master_model(odate, odate, reg_model, tabm);
			
			//delete data from order cart table	
			List<Order_cart_model> ocadd=d.getid_active_flag("Order_cart_model", "uid", userid);
			
			//add data from table
			List<Order_cart_model> oadd=d.getid_active_flag("Order_cart_model", "uid", userid);
			
			int updflag;
			for (int j = 0; j < ocadd.size(); j++) {
				System.out.println("cart id:"+ocadd.get(j).getCart_id());
				updflag=d.update_flag_id("Order_cart_model", "uid", userid);
				if(updflag>0){
					System.out.println("update thyu");
				}
				else{
					System.out.println("update nai thyu");
				}
			}
						
			//find last order from user
			List<Order_master_model> order_m=d.getid("Order_master_model", "uid", userid);
			request.setAttribute("orderm", order_m);
			int ostatus=0;
			int oid=0;
			for (int j = 0; j < order_m.size(); j++) {
				ostatus=order_m.get(j).getOstatus();
				oid=order_m.get(j).getOid();
				System.out.println("under"+oid);
			}
			System.out.println("last"+oid);
			
			//close find last order
			
			
			
			List<Order_child_model> occheck=d.getid("Order_child_model","oid",oid);
			boolean flag1=false;
			
			for (int j = 0; j < occheck.size(); j++) {
				if(flag1==false){
					//check userid and order status can be waiting and change
					if(occheck.get(j).getOid().getOid()==oid &&occheck.get(j).getOid().getOstatus()==0){
						flag1=true;
					}
				}
			}
			
			if(flag1==true){
				omm=new Order_master_model(oid);
				y=1;
			}
			else{
				y=d.insert(omm);
			}
			
			if(y>0)
			{
				for (int j = 0; j < oadd.size(); j++) {
					
					int smid=oadd.get(j).getSmid().getSmid();
					int qty=oadd.get(j).getQty();
					String uname=oadd.get(j).getUid().getUname();
					System.out.println(uname);
					System.out.println("tot items");
					System.out.println("submenu id:"+smid+"quantity:"+qty);
					Submenu_model sub=new Submenu_model(smid);
					Order_child_model ocm=new Order_child_model(sub, omm, qty);
					z=d.insert(ocm);
				}
				if(z>0){
					//return menu page
					response.sendRedirect("file?i=17");
				}
				else{
					System.out.println("some problem in order child table");
				}
			}
			else{
				System.out.println("some problem on master table");
			}
			break;
		case 4:
			
			idd=request.getParameter("id");
			String mname=request.getParameter("mname");
			String image=request.getParameter("file");
			desc=request.getParameter("mdesc");
			id=0;
			System.out.println(mname+" "+image+" "+desc);
			System.out.println(idd+mname+image+desc);
			if(!idd.isEmpty()){
				id=Integer.parseInt(request.getParameter("id"));
			}
			Menu_model mm=new Menu_model(id,mname,desc,image);
			if(!idd.isEmpty()){
				y=d.Update(mm);
			}
			else{
				y=d.insert(mm);
			}
			if(y>0){
				response.sendRedirect("file?i=5");
			}
			else{
				System.out.println("data cant inserted");
			}
			break;
		case 5:
			idd=request.getParameter("id");
			String cname=request.getParameter("name");
			int state=Integer.parseInt(request.getParameter("state"));
			id=0;
			State_model sm=new State_model(state);
			if(!idd.isEmpty()){
				id=Integer.parseInt(request.getParameter("id"));
			}
			City_model cm=new City_model(id,cname,sm);
			if(!idd.isEmpty()){
				y=d.Update(cm);
			}
			else{
				y=d.insert(cm);
			}
			if(y>0){
				response.sendRedirect("file?i=3");
			}
			else{
				System.out.println("data cant inserted");
			}
			break;
		case 7:
			idd=request.getParameter("id");
			state=Integer.parseInt(request.getParameter("state"));
			int city=Integer.parseInt(request.getParameter("city"));
			String aname=request.getParameter("aname");
			int zipcode=Integer.parseInt(request.getParameter("pincode")); 
			int aid=0;
			sm=new State_model(state);
			cm=new City_model(city);
			if(!idd.isEmpty()){
				aid=Integer.parseInt(request.getParameter("id"));
			}
			Area_model am=new Area_model(aid,aname, zipcode, sm, cm);
			if(!idd.isEmpty()){
				y=d.Update(am);
			}
			else{
				y=d.insert(am);
			}
			if(y>0){
				response.sendRedirect("file?i=4");
			}
			else{
				System.out.println("data cant inserted");
			}
			break;
		case 8:
			
			idd=request.getParameter("id");
			state=Integer.parseInt(request.getParameter("state"));
			city=Integer.parseInt(request.getParameter("city"));
			int area=Integer.parseInt(request.getParameter("area"));
			int role=Integer.parseInt(request.getParameter("role"));
			String ename=request.getParameter("ename");
			String email1=request.getParameter("eemail");
			String address=request.getParameter("eaddress");
			String gender=request.getParameter("gender");
			long number=Long.parseLong(request.getParameter("enumber"));
			double salary=Double.parseDouble(request.getParameter("salary"));
			String pass=request.getParameter("epass");
			String date=request.getParameter("edate");
			
			//String string = "2011-03-22";
			   Date bdate = new SimpleDateFormat("yyyy-MM-dd").parse(date);
			   int dt=bdate.getDate();
			   
			   System.out.println(dt);
			

			System.out.println(bdate);
			
			System.out.println(idd+","+state+","+city+","+ename+","+email1+","+address+","+gender+","+salary+","+pass);
			
			rm=new Role_model(role);
			sm=new State_model(state);
			am=new Area_model(area);
			cm=new City_model(city);
			int eid=0;
			if(!idd.isEmpty()){
				eid=Integer.parseInt(request.getParameter("id"));
			}
			Employee_model em=new Employee_model(eid, ename, email1, address, number, gender, salary, pass, bdate, rm, sm, cm, am);
			if(!idd.isEmpty()){
				y=d.Update(em);
			}
			else{
				y=d.insert(em);
			}
			if(y>0){
				response.sendRedirect("file?i=11");
			}
			else{
				System.out.println("data cant inserted");
			}		
			break;
		case 12:
			
			idd=request.getParameter("id");
			String tname=request.getParameter("tname");
			byte tcapacity=Byte.parseByte(request.getParameter("tcapacity"));
			desc=request.getParameter("description");
			id=0; 
			if(!idd.isEmpty()){
				id=Integer.parseInt(request.getParameter("id"));
			}
			Table_model tm=new Table_model(id,tname, tcapacity, desc);
			if(!idd.isEmpty()){
				y=d.Update(tm);
			}
			else{
				y=d.insert(tm);
			}
			if(y>0){
				response.sendRedirect("file?i=7");
			}
			else{
				System.out.println("data cant inserted");
			}
			break;
		case 16: //User insert
			idd=request.getParameter("id");
			String uname=request.getParameter("uname");
			number=Long.parseLong(request.getParameter("unumber"));
			pass=request.getParameter("upass");
			email=request.getParameter("uemail");
			area=Integer.parseInt(request.getParameter("uarea"));
			id=0; 
			if(!idd.isEmpty()){
				id=Integer.parseInt(request.getParameter("id"));
			}
			am=new Area_model(area);
			Registration_model rgsm=new Registration_model(id, uname, number, email, pass, am);
			if(!idd.isEmpty()){
				y=d.Update(rgsm);
			}
			else{
				y=d.insert(rgsm);
			}
			//use extra keyword
			if(request.getParameter("default")!=null){
				response.sendRedirect("file?i=19");
			}
			else if(y>0){
				response.sendRedirect("file?i=14");
			}
			else{
				System.out.println("data cant inserted");
			}
			break;
		case 17:  //Booking insert`
			
			idd=request.getParameter("id");
			int user=Integer.parseInt(request.getParameter("user"));
			String sdate=request.getParameter("bdate");
			String btime=request.getParameter("btime");
			int table=Integer.parseInt(request.getParameter("table"));
			id=0; 
			
			System.out.println(id+"user:"+user+" sdate:"+sdate+" btime:"+btime+" table:"+table);
			
			SimpleDateFormat sd=new SimpleDateFormat("yyyy-MM-dd");
			Date date1=sd.parse(sdate);
			DateFormat dateFormat = new SimpleDateFormat("hh:mm");
			Date time = dateFormat.parse(btime);
			System.out.println("time"+dateFormat.format(time));
			

			if(!idd.isEmpty()){
				id=Integer.parseInt(request.getParameter("id"));
			}
			Registration_model reg_m=new Registration_model(user);
			tm=new Table_model(table);
			
			byte status=1;
			Book_model bm=new Book_model(id, date1, time, tm, reg_m, status);
			if(!idd.isEmpty()){
				y=d.Update(bm);
			}
			else{
				y=d.insert(bm);
			}
			if(y>0){
				response.sendRedirect("file?i=1");
			}
			else{
				System.out.println("data cant inserted");
			}
			break;
		case 18:
			//check login for user
			String uemail=request.getParameter("uemail");
			String upassword=request.getParameter("upassword");
			System.out.println("email "+uemail+" password "+upassword);
			Registration_model checklog=new Registration_model(uemail, upassword);
			
			List ulogin=d.check_user_log("Registration_model",checklog);
			
			switch ((Byte)ulogin.get(0)) {
			case 0:
				System.out.println("wrong username");
				db.setAttribute("msg","wrong user name");
				response.sendRedirect("file?i=19");
				break;
			case 1:
				System.out.println("wrong password");
				db.setAttribute("msg","wrong password");
				response.sendRedirect("file?i=19");
				break;
			case 2:
				System.out.println("user and password");
				db.setAttribute("msg","user and password success but you are hire by admin");
				response.sendRedirect("file?i=19");
				break;
			case 3:
				Registration_model l=(Registration_model) ulogin.get(1);
				System.out.println(l.getUid());
				System.out.println(l.getUname());
				//System.out.println("success");
				db.setAttribute("msg", "success");
				db.setAttribute("username", l.getUname());
				db.setAttribute("userid",l.getUid());
				response.sendRedirect("file?i=15");
				break;
			default:
					break;
			}
			break;
			//order cart insert and update
			case 20:
				int ocid=0;
				int oqty=0;
				int subqty=0;
				
				userid=(Integer)db.getAttribute("userid");
				String items[]=request.getParameterValues("items");
				String ocdate=request.getParameter("dete");
				DateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date cdate = dateFormat2.parse(ocdate);
				System.out.println(" :"+cdate);
				   
				reg_model=new Registration_model(userid);
				
				int tableid=10;
				Table_model tablem=new Table_model(tableid);
			
				List<Order_cart_model> occart=d.getid_active_flag("Order_cart_model", "uid", userid);
				
				for (int k = 0; k < occart.size(); k++) {
					System.out.println("submenu name:"+occart.get(k).getSmid().getName()+" qty:"+occart.get(k).getQty());
				}
				
				for (int j = 0; j < items.length; j++) {
					String tot[]=items[j].split(",");
					int menu_id=Integer.parseInt(tot[0]);
					int qty=Integer.parseInt(tot[1]);
					System.out.println(menu_id+" qty:"+qty);
					
					boolean eflag=false;	
					
					if(!occart.isEmpty()){
						System.out.println("-----start-----");
						for (int k = 0; k < occart.size(); k++) {
							if(eflag==false){
								if(occart.get(k).getSmid().getSmid()==menu_id){
									ocid=occart.get(k).getCart_id();
									oqty=occart.get(k).getQty();
									System.out.println("old quantity"+oqty);
									subqty=oqty+qty;
									//y=d.updatecartdata(model_name, fname, data, field_name, menu_id)
									System.out.println("smname:"+occart.get(k).getSmid().getName()+" subqty:"+subqty);
									eflag=true;
								}
							}
						}
					}
					
					
					//System.out.println("last");
					Submenu_model sub=new Submenu_model(menu_id);
					
					Order_cart_model ocm=new Order_cart_model(reg_model, sub, qty, cdate, tablem);
					if(eflag){
						System.out.println("update");
						y=d.updatecartdata("Order_cart_model", "qty", subqty, "cart_id", ocid);
					}
					else{
						System.out.println("insert");
						y=d.insert(ocm);
					}
				}
				if(y>0){
					response.sendRedirect("file?i=18");
				}
				else{
					response.sendRedirect("error.jsp");
				}
				break;
			case 22:
				//payment insert
				int uid=(Integer)db.getAttribute("userid");
				int orderid=Integer.parseInt(request.getParameter("oid"));
				float total=Float.parseFloat(request.getParameter("total"));
				float gst=Float.parseFloat(request.getParameter("gst"));
				float grandtotal=Float.parseFloat(request.getParameter("grandtotal"));
				String paytype=request.getParameter("ptype");
				//offer master model object
				omm=new Order_master_model(orderid);
				Registration_model regm=new Registration_model(uid);
				Payment_model pm=new Payment_model(omm, total, gst, grandtotal, paytype, regm);
				
				y=d.insert(pm);
				if(y>0){
					//redirect to payment mode
					response.sendRedirect("file?i=22");
				}
				else{
					System.out.println("data cant inserted");
				}
				
				break;
			case 23:
				//paytm transaction insert
				uid=(Integer)db.getAttribute("userid");
				reg_m=new Registration_model(uid);
				int ordid=(Integer)db.getAttribute("order_id");
				
				Order_master_model omst=new Order_master_model(ordid);
				
				long BANKTXNID=Long.parseLong(request.getParameter("BANKTXNID"));
				String ORDERID=request.getParameter("ORDERID");
				float TXNAMOUNT=Float.parseFloat(request.getParameter("TXNAMOUNT"));
				String TXNDATE=request.getParameter("TXNDATE");
				
				dateFormat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date dat=dateFormat2.parse(TXNDATE);
				
				String TXNID=request.getParameter("TXNID");
				System.out.println(BANKTXNID+" "+ ORDERID +" "+ TXNAMOUNT+" "+ dat+" "+ TXNID +" ");
				/*Paytm_model paymodel=new Paytm_model(BANKTXNID, ORDERID, TXNAMOUNT, dat, TXNID, reg_m);*/
				Paytm_model paytm=new Paytm_model(BANKTXNID, ORDERID, TXNAMOUNT, dat, TXNID, omst, reg_m);
				y=d.insert(paytm);
				if(y>0){
					response.sendRedirect("file?i=28");
				}
				else{
					PrintWriter pw=response.getWriter();
					pw.write("not success insert record");
				}
				break;
			case 25:
				//find email
				String aemail=request.getParameter("aemail");
				System.out.println("para"+aemail);
				List<Registration_model> log=d.getfind("Registration_model", "email", aemail);
				List<Employee_model> log1=d.getfind("Employee_model","email",aemail);
				String UEmail="";
				String AEmail="";
				boolean uflag=false;
				boolean eflag=false;
				
				//check email for user
				if(!log.isEmpty()){
					if(log.get(0).getEmail().equals(aemail)){
						UEmail=aemail;
						System.out.println("user"+aemail);
						uflag=true;
					}
				}
				
				//check email for employee
				if(!log1.isEmpty()){
					if(log1.get(0).getEmail().equals(aemail)){
						AEmail=aemail;
						System.out.println("employee"+AEmail);
						eflag=true;
					}
				}
				
				if(uflag){
					db.setAttribute("useremail", UEmail);
					response.sendRedirect("file?i=26");
				}
				else if(eflag){
					db.setAttribute("empemail", AEmail);
					response.sendRedirect("file?i=26");
				}
				else{
					response.sendRedirect("file?i=25");
				}
				break;
			case 26:
				String user1=request.getParameter("user");
				System.out.println(user1);
				if(user1.equalsIgnoreCase("user")){
					String useremail=(String) db.getAttribute("useremail");
					String passwd=request.getParameter("password");
					System.out.println(useremail+" "+passwd);
					y=d.forgotpass("Registration_model", "pass", passwd , "email", useremail);
				}
				if(user1.equalsIgnoreCase("emp")){
					String empemail=(String) db.getAttribute("empemail");
					String passwd=request.getParameter("password");
					System.out.println(empemail+" "+passwd);
					y=d.forgotpass("Employee_model", "password", passwd , "email", empemail);
				}
				
				
				if(y>0){
					if(user1.equalsIgnoreCase("emp")){
						response.sendRedirect("file?i=0");	
					}
					else{
						response.sendRedirect("file?i=19");	
					}
				}
				else{
					response.sendRedirect("file?i=25");
				}
				break;
				
			case 27:
				// change password user
				int user_id=(Integer)db.getAttribute("userid");
				String oldpass=request.getParameter("oldpassword");
				String newpass=request.getParameter("newpassword");
				List<Registration_model> check_user=d.getid("Registration_model","uid", user_id);
				if(check_user.get(0).getUid()==user_id && check_user.get(0).getPass().equals(oldpass)){
					String user_email=check_user.get(0).getEmail();
					y=d.updatepass("Registration_model", "pass", newpass, "email", user_email, "uid", user_id);
				}
				if(y>0){
					response.sendRedirect("file?i=19");
				}
				else{
					response.sendRedirect("file?i=33&p=pl.enter correct old password");
				}
				break;
				
			case 28:
				//change password employee
				int emp_id=(Integer)db.getAttribute("empid");
				String oldpassword=request.getParameter("oldpassword");
				String newpassword=request.getParameter("newpassword");
				List<Employee_model> emp_user=d.getid("Employee_model","eid", emp_id);
				boolean clflag=false;
				
				
				System.out.println(emp_user.get(0).getEname());
				if(emp_user.get(0).getEid()==emp_id && emp_user.get(0).getPassword().equals(oldpassword)){
					String user_email=emp_user.get(0).getEmail();
					y=d.updatepass("Employee_model", "password", newpassword, "email", user_email, "eid", emp_id);
				}
				if(y>0){
					response.sendRedirect("file?i=0");
				}
				else{
					response.sendRedirect("file?i=33&p=pl.enter correct old password");
				}
				break;
			case 29:
				int empid=Integer.parseInt(request.getParameter("id"));
				String name=request.getParameter("name");
				
				Employee_model emp_log=new Employee_model(empid);
				
				Transaction_log tlog=new Transaction_log(name, emp_log);
				
				y=d.insert(tlog);
				break;
		default:
			break;
		}
		}
		catch(Exception e){
			e.printStackTrace();
			PrintWriter pw=response.getWriter();
			pw.write("some problem for code");
			response.sendRedirect("error.jsp");
		}
	}//close post

}

 