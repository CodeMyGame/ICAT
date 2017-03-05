
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

public class TempLogin extends HttpServlet{
 String password=null;
 String pass=null;
 String uid=null;
  static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
  
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException { 
         uid = req.getParameter("email");
              pass = req.getParameter("password");
              if(uid!=null&&pass!=null){
        try { 
            
            Class.forName(JDBC_DRIVER);
            PreparedStatement ps;
            ResultSet rs;
            try (Connection con = DriverManager.getConnection(Keys.dbText,Keys.dbID,Keys.dbPass)) {
                ps = con.prepareStatement("select upass from temp_login where uid=?");
                ps.setString(1,uid);
                rs = ps.executeQuery();
                while(rs.next())
                {
                    password = rs.getString(1);
                }
                if(password!=null&&pass.equals(password)){
                    resp.getWriter().write(password); 
                    HttpSession s = req.getSession(true);
                    s.setAttribute("uid",uid);
                  
                }
                else{
                    resp.getWriter().write("not_match"); 
                }
            }
             ps.close();
             rs.close();
             
            
        } catch (ClassNotFoundException | SQLException | IOException e) {
             resp.getWriter().write("wrong");  
        }
              }else{
                   resp.getWriter().write("empty");  
              }
    }  

   
}