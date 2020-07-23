package controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import dao.dao;
import dao.daoimpl;
import model.Area_model;
import model.City_model;
import model.Employee_model;
import model.Order_cart_model;
import model.Order_master_model;
import model.Payment_model;
import model.Transaction_log;

public class Filecontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Filecontroller() {
        super();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	dao d=new daoimpl();
    	byte i=Byte.parseByte(request.getParameter("i"));
    	switch (i) {
		case 1:
			int id=Integer.parseInt(request.getParameter("id"));
			System.out.println(id);
			List<City_model> ls1=d.getid("City_model","id", id);
			
			GsonBuilder b = new GsonBuilder();
			b.registerTypeAdapterFactory(HibernateProxyTypeAdapter.FACTORY);
			
			Gson gson = b.create();
		    PrintWriter pw=response.getWriter();
			String dd = gson.toJson(ls1);
			pw.print(dd);
			break;
		case 2:
			id=Integer.parseInt(request.getParameter("id"));
			System.out.println(id);
			List<Area_model> ls12=d.getid("Area_model","cm", id);
			
			b = new GsonBuilder();
			b.registerTypeAdapterFactory(HibernateProxyTypeAdapter.FACTORY);
			
			gson = b.create();
		    pw=response.getWriter();
			dd = gson.toJson(ls12);
			pw.print(dd);
			break;
		case 3:
			id=Integer.parseInt(request.getParameter("id"));
			System.out.println(id);
			List menu=d.getid("Submenu_model","mid", id);
			
			b = new GsonBuilder();
			b.registerTypeAdapterFactory(HibernateProxyTypeAdapter.FACTORY);
			
			gson = b.create();
		    pw=response.getWriter();
			dd = gson.toJson(menu);
			pw.print(dd);
			break;
		case 6:
			List offer=d.view("Registration_model");
			
			b = new GsonBuilder();
			b.registerTypeAdapterFactory(HibernateProxyTypeAdapter.FACTORY);
			
			gson = b.create();
		    pw=response.getWriter();
			dd = gson.toJson(offer);
			pw.print(dd);
			break;
		
		default:
			break;
		}
    }
    
    
    private String name="";
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			dao d=new daoimpl();
			HttpSession ses=request.getSession();
			//System.out.println(ses.getAttribute("user"));
			byte i=Byte.parseByte(request.getParameter("i"));
			switch (i) {
			case 0:
				name="login.jsp";
				break;
			case 1:
				List orderm=d.view("Order_master_model");
				request.setAttribute("orderm", orderm);
				List tab=d.view1("Table_model");
				request.setAttribute("data", tab);
				name="master.jsp?p=home";
				break;
			case 25:
				name="forgotpass_email.jsp";
				break;
			case 26:
				name="forgotpass_pass.jsp";
				break;
			case 2:
				List lis=d.view1("State_model");
				request.setAttribute("data", lis);
				name="master.jsp?p=state&title=state";
				break;
			case 3:
				List cd=d.view1("City_model");
				request.setAttribute("view", cd);
				lis=d.view1("State_model");
				request.setAttribute("data", lis);
				name="master.jsp?p=city&title=City";
				break;
			case 4:
				cd=d.view1("City_model");
				request.setAttribute("city", cd);
				cd=d.view1("State_model");
				request.setAttribute("state", cd);
				lis=d.view1("Area_model");
				request.setAttribute("data", lis);
				name="master.jsp?p=area&title=Area";
				break;
			case 5:
				List mn=d.view1("Menu_model");
				request.setAttribute("data", mn);
				name="master.jsp?p=menu&title=Menu";
				break;
			case 6:
				cd=d.view1("Menu_model");
				request.setAttribute("menu", cd);
				mn=d.view1("Submenu_model");
				request.setAttribute("smenu", mn);
				name="master.jsp?p=submenu&title=Sub-menu";
				break;
			case 7:
				cd=d.view1("Table_model");
				request.setAttribute("data", cd);
				name="master.jsp?p=table&title=Table";
				break;
			case 8:
				List l1=d.view1("Role_model");
				request.setAttribute("data", l1);
				name="master.jsp?p=role&title=Role";
				break;
			case 122:
				List ls1=d.view("City_model");
				
				GsonBuilder b = new GsonBuilder();
				b.registerTypeAdapterFactory(HibernateProxyTypeAdapter.FACTORY);
				
				Gson gson = b.create();
			    PrintWriter pw=response.getWriter();
				String dd = gson.toJson(ls1);

				break;
			case 11:
				l1=d.view1("State_model");
				request.setAttribute("state", l1);
				l1=d.view1("Role_model");
				request.setAttribute("role", l1);
				l1=d.view1("City_model");
				request.setAttribute("city", l1);
				l1=d.view1("Area_model");
				request.setAttribute("area", l1);
				
				List em=d.view1("Employee_model");
				request.setAttribute("emp", em);
				name="master.jsp?p=employee&title=Employee";
				break;
			
			case 12:
				name="transferpage.jsp";
				break;
			case 13:
				l1=d.view1("State_model");
				request.setAttribute("state", l1);
				l1=d.view1("Role_model");
				request.setAttribute("role", l1);
				l1=d.view1("City_model");
				request.setAttribute("city", l1);
				l1=d.view1("Area_model");
				request.setAttribute("area", l1);

				int id=Integer.parseInt(request.getParameter("id"));
				System.out.println("id:"+id);
				Employee_model em1=d.getData(new Employee_model(), id);
				request.setAttribute("empid", em1);
				name="master.jsp?p=emp";
				break;
			case 14:
				cd=d.view1("Area_model");
				request.setAttribute("area", cd);
				List pm=d.view1("Registration_model");
				request.setAttribute("data", pm);
				name="master.jsp?p=user_regestration";
				break;
			case 19:
				name="user_login.jsp";
				break;
			case 15:
				ses.removeAttribute("user_id");
				name="user_master.jsp?m=user_home";
				break;
			case 16:
				cd=d.view1("Area_model");
				request.setAttribute("state", cd);
				name="user_side_registration.jsp";
				break;
			case 17:
				List menu=d.view1("Menu_model");
				request.setAttribute("menu", menu);
				List user_menu=d.view1("Submenu_model");
				request.setAttribute("submenu", user_menu);
				name="user_master.jsp?m=user_menu";
				break;
			case 18:
				int userid=(Integer)ses.getAttribute("userid");
				List<Order_cart_model> ocart=d.getid_active_flag("Order_cart_model", "uid", userid);
				request.setAttribute("ocart", ocart);
				name="user_master.jsp?m=order_cart";
				break;
			case 35:
				int uid=(Integer)ses.getAttribute("userid");
				System.out.println("user_id"+uid);
				//get order data;
				List<Order_master_model> order_m=d.getid("Order_master_model", "uid", uid);
				request.setAttribute("orderm", order_m);
				
				//find last order
				int oid=0;
				for (int j = 0; j < order_m.size(); j++) {
					if(order_m.get(j).getOstatus()==0){
						oid=order_m.get(j).getOid();	
					}
				}
				
				List o_result=d.getid("Order_child_model", "oid", oid);
				request.setAttribute("bill", o_result);
				
				name="user_master.jsp?m=user_order";
				break;
			case 20:
				List order=d.show_status("Order_child_model");
				request.setAttribute("orderc", order);
				List orderm1=d.view("Order_master_model");
				request.setAttribute("orderm", orderm1);
				name="kitchen_screen.jsp";
				break;
			case 21:
				int uid1=(Integer)ses.getAttribute("userid");
				System.out.println("user_id"+uid1);
				//get order data;
				List<Order_master_model> order_m1=d.getid("Order_master_model", "uid", uid1);
				request.setAttribute("orderm", order_m1);
				
				//find last order
				int oid1=0;
				for (int j = 0; j < order_m1.size(); j++) {
					oid1=order_m1.get(j).getOid();
				}
				System.out.println(oid1);
				
				//change
				int ostatus=1;
				int upd=d.updatecartdata("Order_master_model", "ostatus", ostatus, "oid", oid1);
				
				
					List o_result1=d.getid("Order_child_model", "oid", oid1);
					request.setAttribute("bill", o_result1);
					name="user_bill.jsp";
				
				break;
			case 22:
				uid1=(Integer)ses.getAttribute("userid");
				order_m1=d.getid("Order_master_model", "uid", uid1);
				request.setAttribute("orderm", order_m1);
				oid1=0;
				for (int j = 0; j < order_m1.size(); j++) {
					oid1=order_m1.get(j).getOid();
					byte status=order_m1.get(j).getOstatus();
					System.out.println("under"+oid1);
				}
				System.out.println("last"+oid1);
				List<Payment_model> paymodel=d.getid_active_flag("Payment_model", "oid", oid1);
				request.setAttribute("data", paymodel);
				ses.setAttribute("order_id", oid1);
				System.out.println(oid1 +"aty");
					if(paymodel.get(0).getPay_type().equals("Cash")){
						System.out.println("cash");
						name="user_cash.jsp";
						}
					
						if(paymodel.get(0).getPay_type().equals("Paytm")){
							System.out.println("paytm");
							name="user_paytm.jsp";
						}
					
				
				break;
			
			case 27:
				userid=(Integer)ses.getAttribute("userid");
				List<Order_cart_model> ocart1=d.getid("Order_cart_model", "uid", userid);
				//SELECT a FROM Author a JOIN FETCH a.books;
				//SELECT DISTINCT a FROM Author a JOIN FETCH a.books

				List ls=new ArrayList();
				for (int j = 0; j < ocart1.size(); j++) {
					//find unique id and add in list
					if(!ls.contains(ocart1.get(j).getSmid().getSmid())){
						ls.add(ocart1.get(j).getSmid().getSmid());
					}
				}
				List qty=new ArrayList();
				for (int j = 0; j < ls.size(); j++) {
					int smid=(Integer)ls.get(j);
					System.out.println("smid:"+smid);
					List las=d.sumofdata("Order_cart_model", "smid", smid);
					for (int k = 0; k < las.size(); k++) {
						qty.add(las.get(k));
						System.out.println("qty :"+las.get(k));
					}
				}
				
				//show data from both id and its qty
				for (int j = 0; j < ls.size(); j++) {
					System.out.println("submenu id:"+ls.get(j)+" qty :"+qty.get(j));
				}
				name="fetch.jsp";
				break;
			case 28:
				uid1=(Integer)ses.getAttribute("userid");
				order_m1=d.getid("Order_master_model", "uid", uid1);
				request.setAttribute("orderm", order_m1);
				oid1=0;
				for (int j = 0; j < order_m1.size(); j++) {
					oid1=order_m1.get(j).getOid();
					System.out.println("under"+oid1);
				}
				int out=0;
				System.out.println("last"+oid1);
				int ordid=(Integer)ses.getAttribute("order_id");
				if(ordid==oid1){
					out=d.updatecartdata("Payment_model", "status", 1, "oid", ordid);
				}
				name="feedback.jsp";
				break;
				
			case 24:
				List ordercdate=d.view("Order_master_model");
				request.setAttribute("orderm", ordercdate);
				name="master.jsp?p=show_current_Date_order&title=Current date order";
				break;	
			case 29:
				//new page use order show by admin
				List orderall=d.view("Order_master_model");
				request.setAttribute("orderm", orderall);
				name="master.jsp?p=show_all_order&title=All Order";
				break;
			case 30:
				List ordermon=d.view("Order_master_model");
				request.setAttribute("orderm", ordermon);
				name="master.jsp?p=show_month_order&title=Month Order";
				break;
			case 32:
				List orderyear=d.view("Order_master_model");
				request.setAttribute("orderm", orderyear);
				name="master.jsp?p=show_year_order&title=Year Order";
				break;
			case 33:
				name="change_password.jsp";
				break;
			case 34:
				List ulog=d.view("Login_log");
				request.setAttribute("data", ulog);
				name="master.jsp?p=login_user";
				break;
			case 36:
				List tlog=d.view("Transaction_log");
				request.setAttribute("data", tlog);
				name="master.jsp?p=page_transaction_log";
				break;
			default:
				name="login.jsp";
				break;
			}
			//System.out.println("connect");
			RequestDispatcher rd=request.getRequestDispatcher(name);
			rd.forward(request, response);
	}
}

// convert in json from list for one query output store only one model and transfer it
/*List<City_model> jn = new ArrayList<City_model>();
for (City_model c:ls1) {
	City_model cv = new City_model(c.getCid(),c.getCname());
	jn.add(cv);
}*/