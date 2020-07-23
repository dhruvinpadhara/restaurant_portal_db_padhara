package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import model.Employee_model;
import model.Registration_model;
import util.utilimpl;

public class daoimpl implements dao{
	
	public <E> int updatestatus(String mname,byte status,String fname, int id) {
		System.out.println("ses");
		Session ses=null;
		Transaction t=null;
		int y=0;
		try{
			ses=utilimpl.connect();
			t=ses.beginTransaction();
			String query="update "+mname+" set status="+status+" where "+fname+"="+id+"";
			System.out.println(query);
			
			Query q=ses.createQuery(query);
			y=q.executeUpdate();
			if(y>0){	
				t.commit();
				y=1;
			}
			else{
				System.out.println("jsljldkcds");
			}
			
		}
		catch(HibernateException s){
			while(t!=null){
				t.rollback();
				y=0;
			}
			s.printStackTrace();
		}
		finally{
			//ses.close();
		}
		return y;
	}
	
	public <E> int updatecartdata(String model_name,String fname,int data,String field_name,int id) {
		Session ses=null;
		Transaction t=null;
		int y=0;
		try{
			ses=utilimpl.connect();
			t=ses.beginTransaction();
			String query="update "+model_name+" set "+fname+"="+data+" where "+field_name+"="+id+"";
			System.out.println(query);
			
			Query q=ses.createQuery(query);
			y=q.executeUpdate();
			if(y>0){
				System.out.println("commit");
				t.commit();
				y=1;
				System.out.println("success");
			}
			else{
				System.out.println("not success");
			}
			
		}
		catch(HibernateException s){
			while(t!=null){
				t.rollback();
				y=0;
			}
			s.printStackTrace();
		}
		finally{
			//ses.close();
		}
		return y;
	}
	
	public <E> int updatedata(String mname,String fname, int id) {
		System.out.println("ses");
		Session ses=null;
		Transaction t=null;
		int y=0;
		try{
			ses=utilimpl.connect();
			t=ses.beginTransaction();
			String query="update "+mname+" set active_flag=1 where "+fname+"="+id+"";
			System.out.println(query);
			
			Query q=ses.createQuery(query);
			y=q.executeUpdate();
			if(y>0){	
				t.commit();
				y=1;
			}
			else{
				System.out.println("jsljldkcds");
			}
			
		}
		catch(HibernateException s){
			while(t!=null){
				t.rollback();
				y=0;
			}
			s.printStackTrace();
		}
		finally{
			//ses.close();
		}
		return y;
	}
	
	
	public <E> int insert(E s) {
		int y=0;
		Session ses=null;
		Transaction t=null;
		
		try{
			ses=utilimpl.connect();
			t=ses.beginTransaction();
			ses.save(s);
			t.commit();
			y=1;
		}
		catch(HibernateException e){
			if(t!=null){
				t.rollback();
			}
			e.printStackTrace();
			y=0;
		}
		finally {
			//ses.close();
		}
		return y;
	}

public <E> List view(String name) {
		
		Session ses=null;
		Transaction t=null;
		List lis=null;
		
		try{
			ses=utilimpl.connect();
			t=ses.beginTransaction();
			Query q=ses.createQuery("from "+name+"");
			lis=q.list();
			t.commit();
		}
		catch(HibernateException e){
			if(t!=null){
				t.rollback();
			}
			e.printStackTrace();
		}
		finally{
			//ses.close();
		}
		return lis;
	}

public <E> List dynamic(String name) {
	
	Session ses=null;
	Transaction t=null;
	List lis=null;
	
	try{
		ses=utilimpl.connect();
		t=ses.beginTransaction();
		Query q=ses.createQuery(name);
		lis=q.list();
		System.out.println(name);
		t.commit();
	}
	catch(HibernateException e){
		if(t!=null){
			t.rollback();
		}
		e.printStackTrace();
	}
	finally{
		//ses.close();
	}
	return lis;
}

public <E> List show_status(String name) {
	
	Session ses=null;
	Transaction t=null;
	List lis=null;
	
	try{
		ses=utilimpl.connect();
		t=ses.beginTransaction();
		Query q=ses.createQuery("from "+name+" where status=0");
		lis=q.list();
		t.commit();
	}
	catch(HibernateException e){
		if(t!=null){
			t.rollback();
		}
		e.printStackTrace();
	}
	finally{
		//ses.close();
	}
	return lis;
}


public <E> List view1(String name) {
	
	Session ses=null;
	Transaction t=null;
	List lis=null;
	
	try{
		ses=utilimpl.connect();
		t=ses.beginTransaction();
		Query q=ses.createQuery("from "+name+" where active_flag=0");
		lis=q.list();
		t.commit();
	}
	catch(HibernateException e){
		if(t!=null){
			t.rollback();
		}
		e.printStackTrace();
	}
	finally{
		//ses.close();
	}
	return lis;
}

public <E> List viewall(String name) {
	
	Session ses=null;
	Transaction t=null;
	List lis=null;
	
	try{
		ses=utilimpl.connect();
		t=ses.beginTransaction();
		Query q=ses.createQuery("from "+name+" where active_flag=0 or active_flg=1");
		lis=q.list();
		t.commit();
	}
	catch(HibernateException e){
		if(t!=null){
			t.rollback();
		}
		e.printStackTrace();
	}
	finally{
		//ses.close();
	}
	return lis;
}

	public <E> int del(E m) {
		int y=0;
		Session ses=null;
		Transaction t=null;
		
		try{
			ses=utilimpl.connect();
			t=ses.beginTransaction();
			ses.delete(m);
			t.commit();
			y=1;
		}
		catch(HibernateException e){
			if(t!=null){
				t.rollback();
			}
			e.printStackTrace();
			System.out.println("hello");
			y=0;
		}
		finally {
			//ses.close();
		}
		return y;
	}

	public <E> E getData(E p, int id) {
		
		E l = null;
		Session s = null;
		Transaction tx = null;
		try {
		s = utilimpl.connect();
		tx = s.beginTransaction();
		l = (E)s.load(p.getClass(),id);
		tx.commit();
		
		} catch (HibernateException e) {
			if(tx != null)
			{
				tx.rollback();
			}
			
			e.printStackTrace();
		}
		finally {
		//	s.close();
		}
		return l;
	}

	public <E> int Update(E s) {
		int y=0;
		Session ses=null;
		Transaction t=null;
		
		try{
			ses=utilimpl.connect();
			t=ses.beginTransaction();
			ses.update(s);
			t.commit();
			y=1;
		}
		catch(HibernateException e){
			if(t!=null){
				t.rollback();
			}
			e.printStackTrace();
			y=0;
		}
		finally {
			//ses.close();
		}
		return y;
	}

	public List getdatedata(String mname,String ffname,int id,String sfname,int date) {
		List ls=null;
		Session ses=null;
		Transaction t=null;
		try{
			ses=utilimpl.connect();
			t=ses.beginTransaction();
			String query="from "+mname+" where "+ffname+"="+id+"";
			Query q=ses.createQuery(query);
			ls=q.list();
		}
		catch(HibernateException e1){
			if(t!=null)
			{
				t.rollback();
			}
		}
		return ls;
	}
	
	public  List getid(String name,String fname,int id) {
		List ls=null;
		Session s=null;
		Transaction t=null;
		try{
			
			s=utilimpl.connect();
			t=s.beginTransaction();
			String query="from "+name+" where "+fname+"='"+id+"'";
			Query q=s.createQuery(query);
			ls=q.list();
		}
		catch(HibernateException e){
			if(t!=null){
				t.rollback();
			}
			e.printStackTrace();
		}
		return ls;
	}
	
	public  List getfind(String mname,String fname,String fvalue) {
		List ls=null;
		Session s=null;
		Transaction t=null;
		try{
			
			s=utilimpl.connect();
			t=s.beginTransaction();
			String query="from "+mname+" where "+fname+"='"+fvalue+"'";
			Query q=s.createQuery(query);
			ls=q.list();
		}
		catch(HibernateException e){
			if(t!=null){
				t.rollback();
			}
			e.printStackTrace();
		}
		return ls;
	}
	
	
	
	public  List getid_active_flag(String name,String fname,int id) {
		List ls=null;
		Session s=null;
		Transaction t=null;
		try{
			
			s=utilimpl.connect();
			t=s.beginTransaction();
			String query="from "+name+" where "+fname+"='"+id+"' and active_flag=0";
			Query q=s.createQuery(query);
			ls=q.list();
		}
		catch(HibernateException e){
			if(t!=null){
				t.rollback();
			}
			e.printStackTrace();
		}
		return ls;
	}

	public <E> List check_log(String name,Employee_model e) {
		List ls=new ArrayList();
		Session ses=null;
		Transaction t=null;
		try{
			ses=utilimpl.connect();
			t=ses.beginTransaction();
			String query="from "+name+" where email='"+e.getEmail()+"'";
			Query q=ses.createQuery(query);
			List lis1=q.list();
			if(!lis1.isEmpty()){
				query="from "+name+" where email='"+e.getEmail()+"'and password='"+e.getPassword()+"'";				
				Query q1=ses.createQuery(query);
				System.out.println(query);
				List lis2=q1.list();
				if(!lis2.isEmpty()){
					query="from "+name+" where email='"+e.getEmail()+"'and password='"+e.getPassword()+"' and active_flag=0";
					Query q3=ses.createQuery(query);
					List lis3=q3.list();
					if(!lis3.isEmpty()){
						ls.add((byte)3);
						ls.add(lis3.get(0));
					}
					else{
						ls.add((byte)2);
					}
				}
				else{
					ls.add((byte)1);
				}
			}
			else{
				ls.add((byte)0);
			}
		}
		catch(HibernateException e1){
			if(t!=null)
			{
				t.rollback();
			}
		}
		return ls;
	}
	
	
	public <E> List check_user_log(String name,Registration_model r) {
		List ls=new ArrayList();
		Session ses=null;
		Transaction t=null;
		System.out.println("email :"+r.getEmail()+"password is"+r.getPass());
		try{
			ses=utilimpl.connect();
			t=ses.beginTransaction();
			String query="from "+name+" where email='"+r.getEmail()+"'";
			//query processing
			Query q=ses.createQuery(query);
			List lis1=q.list();
			
			//check email can be found or not
			if(!lis1.isEmpty()){
				query="from "+name+" where email='"+r.getEmail()+"'and pass='"+r.getPass()+"'";				
				Query q1=ses.createQuery(query);
				System.out.println(query);
				List lis2=q1.list();
				//check email  and password can be found or not
				if(!lis2.isEmpty()){
					query="from "+name+" where email='"+r.getEmail()+"'and pass='"+r.getPass()+"' and status=1";
					Query q3=ses.createQuery(query);
					List lis3=q3.list();
					//check email,password and status can be found or not
					if(!lis3.isEmpty()){
						ls.add((byte)3);
						ls.add(lis3.get(0));
					}
					else{
						ls.add((byte)2);
					}
				}
				else{
					ls.add((byte)1);
				}
			}
			else{
				ls.add((byte)0);
			}
		}
		catch(HibernateException e1){
			if(t!=null)
			{
				t.rollback();
			}
		}
		return ls;
	}//end use login

	public <E> int updatepass(String mname,String fpass,String pass,String femail,String email,String userid,int uid) {
		System.out.println("ses");
		Session ses=null;
		Transaction t=null;
		int y=0;
		try{
			ses=utilimpl.connect();
			t=ses.beginTransaction();
			String query="update "+mname+" set "+fpass+"='"+pass+"' where "+femail+"='"+email+"' and "+userid+"="+uid+"";
			System.out.println(query);
			
			Query q=ses.createQuery(query);
			y=q.executeUpdate();
			if(y>0){	
				t.commit();
				y=1;
			}
			else{
				System.out.println("jsljldkcds");
			}
			
		}
		catch(HibernateException s){
			while(t!=null){
				t.rollback();
				y=0;
			}
			s.printStackTrace();
		}
		finally{
			//ses.close();
		}
		return y;
	}
	
	
	//forgot pass
	public <E> int forgotpass(String mname,String fpass,String pass,String uemail,String email) {
		Session ses=null;
		Transaction t=null;
		int y=0;
		try{
			ses=utilimpl.connect();
			t=ses.beginTransaction();
			String query="update "+mname+" set "+fpass+"='"+pass+"' where "+uemail+"='"+email+"'";
			System.out.println(query);
			
			Query q=ses.createQuery(query);
			y=q.executeUpdate();
			if(y>0){	
				t.commit();
				y=1;
			}
			else{
				System.out.println("jsljldkcds");
			}
			
		}
		catch(HibernateException s){
			while(t!=null){
				t.rollback();
				y=0;
			}
			s.printStackTrace();
		}
		finally{
			//ses.close();
		}
		return y;
	}

	//update flag for particular id
	public <E> int update_flag_id(String mname,String fname,int id){
		System.out.println("ses");
		Session ses=null;
		Transaction t=null;
		int y=0;
		try{
			ses=utilimpl.connect();
			t=ses.beginTransaction();
			String query="update "+mname+" set active_flag=1 where "+fname+"="+id+"";
			System.out.println(query);
			
			Query q=ses.createQuery(query);
			y=q.executeUpdate();
			if(y>0){	
				t.commit();
				y=1;
			}
			else{
				System.out.println("jsljldkcds");
			}
			
		}
		catch(HibernateException s){
			while(t!=null){
				t.rollback();
				y=0;
			}
			s.printStackTrace();
		}
		finally{
			//ses.close();
		}
		return y;
	}
	
	
	public <E> List sumofdata(String mname,String fname,int smid) {
		Session ses=null;
		Transaction t=null;
		List lis=null;

		try{
			ses=utilimpl.connect();
			t=ses.beginTransaction();
			String query="SELECT SUM(qty) FROM "+mname+" where "+fname+"="+smid+"";
			System.out.println(query);
			Query q=ses.createQuery(query);
			lis=q.list();
			t.commit();
		}
		catch(HibernateException e){
			if(t!=null){
				t.rollback();
			}
			e.printStackTrace();
		}
		finally{
			//ses.close();
		}
		return lis;
	}

	
}
