package dao;

import java.util.List;

import model.Employee_model;
import model.Registration_model;


public interface dao{

	//insert data
	public <E> int insert(E s) ;
	
	//view
	public <E> List view(String name);
	
	//view active_flag
	public <E> List view1(String name);
	
	//
	public <E> List viewall(String name);
	
	//update flag
	public <E> int updatedata(String model_name,String field_name,int id);
	
	//update status
	public <E> int updatestatus(String model_name,byte status,String field_name,int id);
	
	//update cart for using one field update for any table 
	//update one field and check one field
	public <E> int updatecartdata(String model_name,String fname,int data ,String field_name,int id);
	
	//delete data
	public <E> int del(E m);
	
	//find record
	public <E> E getData(E p,int id);
	
	//update data
	public <E> int Update(E s) ;

	//use for drop
	public List getid(String mname,String fname,int id);
	
	
	//use for single field find string data
	public List getfind(String mname,String fname,String fvalue);
		
	
	
	//use for drop
	public List getid_active_flag(String mname,String fname,int id);
	
	
	//use for flag update for particular id
	public <E> int update_flag_id(String mname,String fname,int id);
	
	
	//use Admin side login
	public <E> List check_log(String name,Employee_model m);
	
	//use check login user
	public <E> List check_user_log(String name,Registration_model m);
	
	
	//use for drop
	public List getdatedata(String mname,String ffname,int id,String sfname,int date);
	
	//update password
	//use update one field check two condition field
	public <E> int updatepass(String mname,String fpass,String pass,String uemail,String email,String userid,int uid);
	
	
	
	public <E> int forgotpass(String mname,String fpass,String pass,String uemail,String email);

	//
	public <E> List sumofdata(String mname,String fname,int smid);
	
	
	//query mate
	public <E> List dynamic(String name);

	//view active_flag
	public <E> List show_status(String name);

}
