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
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

/**
 *
 * @author Kapil Malviya
 */
public class RetriveNotice extends HttpServlet {
String depart;
     List<String> ref=null;
     List<String> sub=null;
     List<String> body=null; 
     List<String> date=null;
     List<String> attach=null; 
     List<String> sno = null;
     List<String> issAuth = null;
     List<String> desg = null;
     List<String> issAuthBra = null;
     int j;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
                             ref = new ArrayList<>();
                             sub = new ArrayList<>();
                             body = new ArrayList<>();
                             date = new ArrayList<>();
                             attach = new ArrayList<>();
                             sno = new ArrayList<>();
                             issAuth = new ArrayList<>();//id
                             desg = new ArrayList<>();
                             issAuthBra = new ArrayList<>();//depart
                             JSONObject jobj = new JSONObject();
                           JSONObject jobj2 = new JSONObject();
                            StringBuilder bodybuilder;
                             depart = request.getParameter("depart");
        try (PrintWriter out = response.getWriter()) {
            try{
                             String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
                            
                      Class.forName(JDBC_DRIVER);
                        PreparedStatement ps;
                        ResultSet rs;
                try (Connection con = DriverManager.getConnection(Keys.dbText,Keys.dbID,Keys.dbPass)) {
                    ps = con.prepareStatement("select * from notice_"+depart+" where date!='0000-00-00' order by date desc");
                    int i;
                    rs = ps.executeQuery();
                    while(rs.next())
                    {
                        String refno =rs.getString(1);
                        String subject = rs.getString(2);
                        String bodyy = rs.getString(3);
                        String datee =rs.getString(4);
                        String attachm = rs.getString(5);
                        String sr = rs.getString(6);
                        String issA = rs.getString(7);
                        String des =rs.getString(8);
                        String isAB = rs.getString(9);
                        bodybuilder = new StringBuilder(bodyy);
                        int bodylength = bodybuilder.length();
                        String bodycut = bodybuilder.substring(0,bodylength/5);
                        ref.add(refno);
                        sub.add(subject);
                        body.add(bodycut);
                        date.add(datee);
                        attach.add(attachm);
                        sno.add(sr);
                        issAuth.add(issA);//teacher id
                        desg.add(des);
                        issAuthBra.add(isAB); //department
                    }
                    jobj.put("ref",ref);
                    jobj.put("sub",sub);
                    jobj.put("body",body);
                    jobj.put("date",date);
                    jobj.put("attach",attach);
                    jobj.put("sno",sno);
                    jobj.put("issAuth",issAuth);
                    jobj.put("desg",desg);
                    jobj.put("issAuthBra",issAuthBra);
                    jobj2.put("notice",jobj);
                    out.println(jobj2);
                    ps.close();
                }
                rs.close();
                            
                       // out.write(noticecollection.toString());
                       
                        }catch(Exception e){
                            
                        }
           
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
