package controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.dao;
import dao.daoimpl;
import model.Menu_model;
import model.Submenu_model;


public class sub_menu_upload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public sub_menu_upload() {
        super();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String idd="";
    	String mid="";

    	String smname="";
    	String dprice="";
    	String fileName="";
    	String submenudesc="";
    	
    	
    	
    	//using cast menu
    	int menu_id=0;
    	
    	//using price
    	double price=0;
        int y=0;
        int id=0;
        
        Menu_model mm=null;
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);

        if (isMultipart) {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

            try {
                List items = upload.parseRequest(request);
                Iterator iterator = items.iterator();
                while (iterator.hasNext()) {
                    FileItem item = (FileItem) iterator.next();
                    InputStream input = item.getInputStream();
                    //id
                    if(item.getFieldName().equals("id")){
                    	byte[] str = new byte[input.available()];
                        input.read(str);
                        idd = new String(str,"UTF8");
                        System.out.println("under"+idd);
                    }
                    //name
                    if(item.getFieldName().equals("mid")){
                    	byte[] str = new byte[input.available()];
                        input.read(str);
                        mid = new String(str,"UTF8");
                        menu_id=Integer.parseInt(mid);
                        mm=new Menu_model(menu_id);
                        System.out.println(menu_id);
                    }
                    //submenu name
                    if(item.getFieldName().equals("name")){
                    	byte[] str = new byte[input.available()];
                        input.read(str);
                        smname = new String(str,"UTF8");
                        System.out.println(smname);
                    }
                    
                  //submenu price
                    if(item.getFieldName().equals("price")){
                    	byte[] str = new byte[input.available()];
                        input.read(str);
                        dprice = new String(str,"UTF8");
                        price=Double.parseDouble(dprice);
                        System.out.println(price);
                    }
                    
                  //submenu description
                    if(item.getFieldName().equals("desc")){
                    	byte[] str = new byte[input.available()];
                        input.read(str);
                        submenudesc = new String(str,"UTF8");
                        System.out.println(submenudesc);
                    }
                    

                    id=0;
                    
                    //using update
                    if(!idd.isEmpty()){
                    	id=Integer.parseInt(idd);
        			}
                    
                    //image
                    if (!item.isFormField()) {
                        fileName = item.getName();
                        String root = getServletContext().getRealPath("/");
                        File path = new File(root + "/uploads");
                        if (!path.exists()) {
                            boolean status = path.mkdirs();
                        }
                        
                        
                        dao d=new daoimpl();
                        
                        System.out.println("id: "+id+"name: "+smname+"file name "+" "+fileName+" dmenudesc: "+submenudesc);
            		
                        Submenu_model subm=new Submenu_model(id, smname, price, submenudesc, fileName, mm);
            			if(!idd.isEmpty()){
            				y=d.Update(subm);
            			}
            			else{
            				y=d.insert(subm);
            				//System.out.println("id: "+id+"name: "+name+"file name "+" "+fileName+"menudesc: "+menudesc);
            			}
            			if(y>0){
            				response.sendRedirect("file?i=6");
            			}
            			else{
            				System.out.println("data cant inserted");
            			}
            			File uploadedFile = new File(path + "/" + fileName);
                        System.out.println(uploadedFile.getAbsolutePath());
                        item.write(uploadedFile);
                         
                          
                       // System.out.println("name is :"+name+" file name is:"+fileName);
                        //System.out.println("file name is:"+fileName);
                    }
                }
            } catch (FileUploadException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        else{
        	System.out.println("enter file please");
        }

	
	
	}

}
