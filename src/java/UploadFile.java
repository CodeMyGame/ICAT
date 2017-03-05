
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class UploadFile extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private String UPLOAD_DIRECTORY = "";
      
     static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
 
   String deparment="";
        private File checkExist(String fileName) {
            
        File f = new File(UPLOAD_DIRECTORY+"/"+fileName);
        if(f.exists())
        {
        	f.delete();
        }
        return f;
    }
       
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        
    
        try {
            // process only if it is multipart content
            Class.forName(JDBC_DRIVER);
            PreparedStatement ps=null;
            ResultSet rs;
            Connection con = DriverManager.getConnection(Keys.dbText,Keys.dbID,Keys.dbPass);
            HttpSession s = request.getSession(false);
            String uid = s.getAttribute("name").toString();
            if(uid.charAt(0)=='T'){
            ps = con.prepareStatement("select dept from faculty where fid=?");
            }
            if(uid.charAt(0)=='I'){
            ps = con.prepareStatement("select branch from student where sid=?");
            }
            ps.setString(1,uid);
            rs = ps.executeQuery();
            while(rs.next())
            {
                   deparment = rs.getString(1);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UploadFile.class.getName()).log(Level.SEVERE, null, ex);
        }
            
        if (isMultipart) {
            // Create a factory for disk-based file items
            FileItemFactory factory = new DiskFileItemFactory();

            // Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);
            try {
                // Parse the request
                List<FileItem> multiparts = upload.parseRequest(request);

                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {
                        String type = new File(item.getContentType()).getName();
                        HttpSession s = request.getSession(false);
                        String uid = s.getAttribute("name").toString();
                        String name = "dp" + "." + "jpg";
                      if(type.equals("jpg")||type.equals("jpeg")){
                          UPLOAD_DIRECTORY = Keys.dpDirectory;
                        if(uid.charAt(0)=='I'){
                            UPLOAD_DIRECTORY = UPLOAD_DIRECTORY+'/'+"Student"+'/'+deparment;
                        }
                        if(uid.charAt(0)=='T'){
                            UPLOAD_DIRECTORY = UPLOAD_DIRECTORY+'/'+"Faculty"+'/'+deparment;
                        }
                        File newDir = new File(UPLOAD_DIRECTORY+'/'+uid);
                        if(!newDir.exists()){
                            try{
                                newDir.mkdir();
                                
                            }catch(Exception e){}
                        }
                     
                        UPLOAD_DIRECTORY = UPLOAD_DIRECTORY+'/'+uid;
                           if(type.equals("jpg")||type.equals("jpeg")){
                        File f = checkExist(name);
                     
                            item.write(f);
             response.getWriter().write("yesss");  
                        }
                      }
         
                  
                     else{
                          response.getWriter().write("invalid");  
                     }
                        
                    }
                }
            } catch (Exception e) {
            }
        }
    }
}
