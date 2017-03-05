/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;


/**
 *
 * @author Kapil Malviya
 */
public class RetriveBody extends HttpServlet {
String refnumber;
String branch;
String body;
String tID;
String gettID;
String getemail;
String getmobile;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          response.setContentType("text/html;charset=UTF-8");
          refnumber = request.getParameter("refno");
          branch = request.getParameter("branch");
          tID = request.getParameter("tid");
          PrintWriter out = response.getWriter();
          HttpSession sess = request.getSession(false);
          String session = sess.getAttribute("name").toString();
          JSONObject tdata = new JSONObject();
        if(session.length()!=0){
        try{
            try{
                             String JDBC_DRIVER = "com.mysql.jdbc.Driver";  

                        Class.forName(JDBC_DRIVER);
                        PreparedStatement ps,ps1;
                        Connection con = DriverManager.getConnection(Keys.dbText,Keys.dbID,Keys.dbPass);
                        ps = con.prepareStatement("select body from notice_"+branch.toLowerCase()+" where reference_no=?"); 
                        ps1 = con.prepareStatement("select fname,email,pno from faculty where fid=?"); 
                        ps.setString(1,refnumber);
                        ps1.setString(1,tID);
                        ResultSet rs = ps.executeQuery();
                        ResultSet rs1 = ps1.executeQuery();
                        if(rs.toString().length()!=0){
                         while(rs.next()){
                          body = rs.getString(1);            
                         }
                        //out.write(body);
                          }
                         if(rs1.toString().length()!=0){
                         while(rs1.next()){
                         gettID = rs1.getString(1);    
                         getemail = rs1.getString(2);
                         getmobile = rs1.getString(3);
                         }
                            tdata.put("body",body);
                            tdata.put("fname",gettID);
                            tdata.put("fmail",getemail);
                            tdata.put("fmobile",getmobile);
                            out.write(tdata.toString());
                            ps.close();
                            ps1.close();
                            con.close();
                            rs.close();
                            rs1.close();
                          }
                        }catch(Exception e){  
                        }
           
        }catch(Exception e){
            
        }
    }else{
            out.write("Session Expired!!!");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
