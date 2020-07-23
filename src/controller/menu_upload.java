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



public class menu_upload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public menu_upload() {
        super();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idd="";
    	String name="";
    	String fileName="";
    	String menudesc="";
    	
    	String idupd="";
    	
        int y=0;
        int id=0;
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
                    if(item.getFieldName().equals("mname")){
                    	byte[] str = new byte[input.available()];
                        input.read(str);
                        name = new String(str,"UTF8");
                        System.out.println(name);
                    }
                    //menudesc
                    if(item.getFieldName().equals("menudesc")){
                    	byte[] str = new byte[input.available()];
                        input.read(str);
                        menudesc = new String(str,"UTF8");
                        System.out.println(menudesc);
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
                        
                        System.out.println("id: "+id+"name: "+name+"file name "+" "+fileName+" dmenudesc: "+menudesc);
            		
                        Menu_model mm=new Menu_model(id,name,menudesc,fileName);
            			if(!idd.isEmpty()){
            				y=d.Update(mm);
            			}
            			else{
            				y=d.insert(mm);
            				//System.out.println("id: "+id+"name: "+name+"file name "+" "+fileName+"menudesc: "+menudesc);
            			}
            			if(y>0){
            				response.sendRedirect("file?i=5");
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
