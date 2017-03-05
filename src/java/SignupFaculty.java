
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SignupFaculty extends HttpServlet{
    
     static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
  

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text");
        String fname = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String dept = req.getParameter("dept");
        String pass = req.getParameter("password");
        String cpass =  req.getParameter("cpassword");
        HttpSession s = req.getSession(false);
           int emailValid = email.indexOf('@');
           if(email.indexOf('@')>-1&&emailValid!=0){
        try {
            Object mutex =1;
            synchronized(mutex){
            Class.forName(JDBC_DRIVER);
            Connection con = DriverManager.getConnection(Keys.dbText,Keys.dbID,Keys.dbPass);
            PreparedStatement ps = con.prepareStatement("insert into faculty(fid,fname,email,pno,dept) values(?,?,?,?,?)");
            PreparedStatement ps1 = con.prepareStatement("insert into login values(?,?,?)");
            PreparedStatement ps2 = con.prepareStatement("delete from temp_login where uid=?");
            ps.setString(1,s.getAttribute("uid").toString());
            ps.setString(2,fname);
            ps.setString(3, email);
            ps.setString(4, phone);
            ps.setString(5,dept);
            ps1.setString(1,s.getAttribute("uid").toString());
            ps1.setString(2,pass);
            ps1.setString(3,"F");
            ps2.setString(1,s.getAttribute("uid").toString());
          if(pass.equals(cpass)){
            int i =ps.executeUpdate();
             int j =ps1.executeUpdate();
              int k = ps2.executeUpdate();
            if(i!=0&&j!=0&&k!=0){   
              resp.getWriter().write("success");
                if(s.getAttribute("uid")!=null){
                 s.invalidate();
              }
            }  
            else{
           resp.getWriter().write("failed");
           }	
          }else{
              resp.getWriter().write("failed");
          }
           ps.close();
           ps1.close();
           ps2.close();
           con.close();
           
        }
            mutex=1;
        }catch (ClassNotFoundException | SQLException | IOException e) {
            resp.getWriter().write("error");
        }
        
           
    } else{
              resp.getWriter().write("emailError");  
           }
    }
}