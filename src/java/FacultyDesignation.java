
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FacultyDesignation extends HttpServlet{
    
     static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
  
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text");
        String fid = req.getParameter("fid");
        String desig = req.getParameter("fdesig");
        String spdesig = req.getParameter("fsdesig");
        String dept = req.getParameter("fdept");
      
        try {
            Class.forName(JDBC_DRIVER);
            Connection con = DriverManager.getConnection(Keys.dbText,Keys.dbID,Keys.dbPass);
            
            if((!spdesig.equals(""))&&(!desig.equals(""))){
            PreparedStatement ps = con.prepareStatement("update faculty set designation=? where fid=?");
            ps.setString(1,desig);
            ps.setString(2,fid);
            int i =ps.executeUpdate();
            PreparedStatement ps1 = con.prepareStatement("insert into  faculty_authority values(?,?,?)");
            ps1.setString(1,fid);
            ps1.setString(2,spdesig);
            ps1.setString(3,dept);
            int j =ps1.executeUpdate();
            if(i!=0&&j!=0){
                 resp.getWriter().write("success");  
            }
            else{
                resp.getWriter().write("failed"); 
            }
            }
            else if((!spdesig.equals(""))&&(desig.equals(""))){
            PreparedStatement ps1 = con.prepareStatement("insert into  faculty_authority values(?,?,?)");
            ps1.setString(1,fid);
            ps1.setString(2,spdesig);
            ps1.setString(3,dept);
            int j =ps1.executeUpdate();
            if(j!=0){
                 resp.getWriter().write("success");  
            }
            else{
                resp.getWriter().write("failed"); 
            }
            }
            else if((spdesig.equals(""))&&(!desig.equals(""))){
                 PreparedStatement ps = con.prepareStatement("update faculty set designation=? where fid=?");
            ps.setString(1,desig);
            ps.setString(2,fid);
            int i =ps.executeUpdate();
            if(i!=0){
                 resp.getWriter().write("success");  
            }
            else{
                resp.getWriter().write("failed"); 
            }
            }
            else{
                resp.getWriter().write("error"); 
            }
        }catch(ClassNotFoundException | SQLException | IOException e){
            resp.getWriter().write("exception"); 
        }
    }
}