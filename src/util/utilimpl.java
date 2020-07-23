package util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class utilimpl{

	private static final SessionFactory sessionfactory;
	
	
	static{
		try{
			sessionfactory=new AnnotationConfiguration().configure().buildSessionFactory();
		}
		catch(Exception e){
			System.out.println(e);
			throw new ExceptionInInitializerError(e);
		}
	}
	
	public static Session connect(){
		return sessionfactory.openSession();
	}

}
