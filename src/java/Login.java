
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet{
 String password=null;
  String pass=null;
 String uname=null;
 String key = null;
  static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
  
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        try { 
              uname = req.getParameter("fid");
              pass = req.getParameter("pass");
              key = req.getParameter("key");
              if(key.equals("key")){
            Class.forName(JDBC_DRIVER);
            PreparedStatement ps;
            ResultSet rs;
            try (Connection con = DriverManager.getConnection(Keys.dbText,Keys.dbID,Keys.dbPass)) {
                ps = con.prepareStatement("select upass from login where uid=?");
                ps.setString(1,uname);
                rs = ps.executeQuery();
                while(rs.next())
                {
                    password = rs.getString(1);
                }
                if(password!=null&&pass.equals(password)){
                    resp.getWriter().write(password);  
                    HttpSession s = req.getSession(true);
                    s.setAttribute("name",uname);
                }
                
                else{
                    resp.getWriter().write("Something went Wrong!!!"); 
                }
            }
             ps.close();
             rs.close();
             
              }
              else if(key.equals("authority")){
                 Class.forName(JDBC_DRIVER);
            PreparedStatement ps;
            ResultSet rs;
            try (Connection con = DriverManager.getConnection(Keys.dbText,Keys.dbID,Keys.dbPass)) {
                ps = con.prepareStatement("select apassword from authority where aid=?");
                ps.setString(1,uname);
                rs = ps.executeQuery();
                while(rs.next())
                {
                    password = rs.getString(1);
                }
                if(password!=null&&pass.equals(password)){
                    resp.getWriter().write(password);  
                    HttpSession s = req.getSession(true);
                    s.setAttribute("authority",uname);
                }
                
                else{
                    resp.getWriter().write("Something went Wrong!!!"); 
                }
            }
             ps.close();
             rs.close(); 
              }
              else{
                 resp.getWriter().write("faculty");  
              }
        } catch (ClassNotFoundException | SQLException | IOException e) {
             resp.getWriter().write("Something went Wrong!!!");  
        }
    }  

   
}