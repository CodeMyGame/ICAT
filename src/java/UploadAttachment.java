
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class UploadAttachment extends HttpServlet {
    boolean flag = false; 
    private static final long serialVersionUID = 1L;
    String refno="";
     String ref_no="",sub="",body="",date="",atchpath="",issauth="",desg="",issauthbrnch="",table="";
     int sno=0;
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
   PrintWriter out = response.getWriter();
        if (isMultipart) {
           
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            
            try {
              
                List<FileItem> multiparts = upload.parseRequest(request);
                  
                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {
                        String type = new File(item.getContentType()).getName();
                      if(type.equals("pdf")){
                         File newDir = new File(Keys.noticeDirectory+'/'+refno);
                         
                        if(!newDir.exists()){
                            try{
                                newDir.mkdir();
                               
                            }catch(Exception e){out.write(e.getMessage());}
                        }
                            File f = new File(Keys.noticeDirectory+'/'+ refno +'/'+"attachment.pdf");
                            out.print(f);
                            item.write(f);
                             
                      }
                      }
                    if(item.isFormField()){
                        refno = item.getString();
                        //flag = true;
                    }
                }
                
                  
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection(Keys.dbText,Keys.dbID,Keys.dbPass);
                String sql="select * from temp_notice where attname=?";
                PreparedStatement stmt=con.prepareStatement(sql);
                stmt.setString(1,refno);
                ResultSet rs=stmt.executeQuery();
                if(rs.next())
                {
                    ref_no=rs.getString(1);
                    sub=rs.getString(2);
                    body=rs.getString(3);
                    date=rs.getString(4);
                    atchpath=rs.getString(5);
                    issauth=rs.getString(6);
                    desg=rs.getString(7);
                    issauthbrnch=rs.getString(8);
                    table=rs.getString(10);
                }
                
                sql="select max(sno) from "+table;
                stmt=con.prepareStatement(sql);
                rs=stmt.executeQuery();
                if(rs.next())
                {
                    sno=rs.getInt(1);
                }
                sno++;
                sql="insert into "+table+" values(?,?,?,?,?,?,?,?,?)";
                stmt=con.prepareStatement(sql);
                stmt.setString(1, ref_no);
                stmt.setString(2,sub);
                stmt.setString(3,body);
                stmt.setString(4,date);
                stmt.setString(5,atchpath);
                stmt.setInt(6, sno);
                stmt.setString(7,issauth);
                stmt.setString(8, desg);
                stmt.setString(9,issauthbrnch);
                stmt.executeUpdate();
                
                sql="delete from temp_notice where attname=?";
                stmt=con.prepareStatement(sql);
                stmt.setString(1,refno);
                stmt.executeUpdate();
                
                con.close();
                out.write("done");           
                            con.close();
                            rs.close();
                            stmt.close();
                            

            } catch (Exception e) {
            }
        }
        else{
            out.write("dddd");
        }
    }
}
