
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class SignupStudent extends HttpServlet{
    
     static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
   
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text");
        String sroll = req.getParameter("sroll");
        String sname = req.getParameter("sname");
        String branch = req.getParameter("branch");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone"); 
        String dob = req.getParameter("dob");
        String address = req.getParameter("address");
        String pass = req.getParameter("pass");
        String cpass =  req.getParameter("rpass");
          HttpSession s = req.getSession(false);
                
           int emailValid = email.indexOf('@');
           if(email.indexOf('@')>-1&&emailValid!=0){
               Object mutex =1;
               
        try {
            synchronized(mutex){
            Class.forName(JDBC_DRIVER);
            PreparedStatement ps1;
            PreparedStatement ps2;
                try (Connection con = DriverManager.getConnection(Keys.dbText,Keys.dbID,Keys.dbPass)) {
                    PreparedStatement ps = con.prepareStatement("insert into student values(?,?,?,?,?,?,?,?)");
                    ps1 = con.prepareStatement("insert into login values(?,?,?)");
                    ps2 = con.prepareStatement("delete from temp_login where uid=?");
                    ps.setString(1,s.getAttribute("uid").toString());
                    ps.setString(2,sroll);
                    ps.setString(3,sname);
                    ps.setString(4,branch);
                    ps.setString(5,email);
                    ps.setString(6,phone);
                    ps.setString(7,dob);
                    ps.setString(8,address);
                    ps1.setString(1,s.getAttribute("uid").toString());
                    ps1.setString(2,pass);
                    ps1.setString(3,"S");
                    ps2.setString(1, s.getAttribute("uid").toString());
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
                            resp.getWriter().write("failed1");
                        }
                    }else{
                        resp.getWriter().write("failed");
                    }         ps.close();
                }
           ps1.close();
           ps2.close();
            }
            mutex=1;
        } catch (ClassNotFoundException | SQLException | IOException e) {
            resp.getWriter().write(e.toString());
        }
         
    } else{
              resp.getWriter().write("emailError");  
           }
    }
    }    