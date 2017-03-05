
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONException;
import org.json.JSONObject;

public class NoticeUpload extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, JSONException {
        int jj=0;
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        try
        {
            EnDecryption enDecryption=EnDecryption.getInstance();
            int sno=0;
            String subject,body,date,uname,splauth,auth,branch,atch,table="notice_",ref_no="NITUK/";
            JSONObject params=new JSONObject(request.getParameter("d"));
            subject=enDecryption.decrypt(params.getString(Keys.KEY_NOTICE_SUB));
            body=enDecryption.decrypt(params.getString(Keys.KEY_NOTICE_BODY));
            date=enDecryption.decrypt(params.getString(Keys.KEY_NOTICE_DATE));   
            uname=enDecryption.decrypt(params.getString(Keys.KEY_NOTICE_issAuth));
            splauth=enDecryption.decrypt(params.getString(Keys.KEY_NOTICE_SPAUTH));
            branch=enDecryption.decrypt(params.getString(Keys.KEY_NOTICE_BRANCH));
            atch=params.getString(Keys.KEY_NOTICE_ATCH);
            auth=enDecryption.decrypt(params.getString(Keys.KEY_NOTICE_AUTHO));
          
            Calendar cal=Calendar.getInstance();
        
            if(branch.equals("CSA") || branch.equals("HMD") || branch.equals("ADMIN"))
                table=table+"csa";
            else
                table=table+branch.toLowerCase();
        
            Object mutex = 1;
            
            if(true)
            {
                
            }
            
            synchronized(mutex){
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection(Keys.dbText,Keys.dbID,Keys.dbPass);
                String sql="select max(sno) from "+table;
                PreparedStatement stmt=con.prepareStatement(sql);
                ResultSet rs=stmt.executeQuery();
                if(rs.next())
                {
                    sno=rs.getInt(1);
                }
                sno++;
                
                if(!splauth.equals("0"))
                {
                    sql="select post_code from post_codes where post_name=?";
                    stmt=con.prepareStatement(sql);
                    stmt.setString(1,auth);
                    rs=stmt.executeQuery();
                    if(rs.next())
                    {
                        ref_no=ref_no+rs.getString(1)+"/";
                    }
                    else
                    {
                        ref_no=ref_no+branch.toUpperCase()+"/";
                    }
                }   
                else
                {
                    ref_no=ref_no+branch.toUpperCase()+"/";
                }
                ref_no=ref_no+cal.get(cal.YEAR);
                jj=10;
                int actualrfn=0;
                sql="select count(*) from "+table+" where reference_no like '%"+cal.get(cal.YEAR)+"%'";
                stmt=con.prepareStatement(sql);
                rs=stmt.executeQuery();
                if(rs.next())
                {
                    actualrfn=rs.getInt(1);
                }
                sql="select count(*) from temp_notice where reference_no like '%"+cal.get(cal.YEAR)+"%' and branch=?";
                stmt=con.prepareStatement(sql);
                stmt.setString(1, table);
                rs=stmt.executeQuery();
                if(rs.next())
                {
                    actualrfn=actualrfn+rs.getInt(1);
                }
                actualrfn++;
                int div,rem;
                div=actualrfn/99;
                rem=actualrfn%99;
                if(rem==0)
                {
                    rem=99;
                    div--;
                }
                char alph=(char)(65+div);
                
                ref_no=ref_no+"/"+alph+rem;
                if(atch.length()!=0)
                {
                    sql="insert into temp_notice values(?,?,?,?,?,?,?,?,?,?)";
                    stmt=con.prepareStatement(sql);
                    String temp=ref_no.replaceAll("/","");
                    temp=temp.replaceAll("&","");
                    
                    stmt.setString(6,uname);
                    stmt.setString(7,auth);
                    stmt.setString(8,branch);
                    stmt.setString(9,temp);
                    stmt.setString(10,table);
                    stmt.setString(5,"y");
                }
                else
                {
                    sql="insert into "+table+" values(?,?,?,?,?,?,?,?,?)";
                    stmt=con.prepareStatement(sql);
                    stmt.setString(5,"n");
                    stmt.setInt(6, sno);
                    stmt.setString(7,uname);
                    stmt.setString(8,auth);
                    stmt.setString(9,branch);
                }
                jj=34;
                stmt.setString(1,ref_no);
                stmt.setString(2, subject);
                    stmt.setString(3,body);
                    stmt.setString(4, date);
                    
                
               stmt.executeUpdate();
               con.close();
            }
            mutex=1;
          
            JSONObject output=new JSONObject();
            output.put("success","Notice Posted Successfully");
            if(atch.length()!=0)
            {
                ref_no=ref_no.replaceAll("/","");
                ref_no=ref_no.replaceAll("&","");
                output.put("refNo",ref_no);
            }
            out.write(output.toString());
        }
        catch(Exception ex)
        {
            JSONObject output=new JSONObject();
            output.put("error",ex.getMessage()+"     "+jj);
            out.write(output.toString());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (JSONException ex) {
            
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (JSONException ex) {
            
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
