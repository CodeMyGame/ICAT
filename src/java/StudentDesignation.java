
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StudentDesignation extends HttpServlet{
    
     static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
   

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text");
        String sid = req.getParameter("sid");
        String desig = req.getParameter("sdesig");
      if((!sid.equals(""))&&(!desig.equals(""))){
        try {
            
            Class.forName(JDBC_DRIVER);
            Connection con = DriverManager.getConnection(Keys.dbText,Keys.dbID,Keys.dbPass);
            PreparedStatement ps1 = con.prepareStatement("insert into  student_authority values(?,?)");
            ps1.setString(1,sid);
            ps1.setString(2,desig);
            int j =ps1.executeUpdate();
            if(j!=0){
                 resp.getWriter().write("success");  
            }
            else{
                resp.getWriter().write("failed"); 
            }
           
        }catch(ClassNotFoundException | SQLException e){
            resp.getWriter().write("exception"); 
        }
      }
    }
}