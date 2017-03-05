<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.File"%>
<html lang="en">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
         <meta name="theme-color" content="#F8F8F8">
        <title>Authorized-Home</title>
        <script src="js/jquery.js" type="text/javascript"></script>
        <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">
        <link href="dist/css/sb-admin-2.css" rel="stylesheet">
        <link href="bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
         <script src="dist/js/bootstrap.js" type="text/javascript"></script>
         <script src="js/designation.js" type="text/javascript"></script>
        
        <style>
           
            body{
                font-family: century gothic;
            }
            .nav-tabs { border-bottom: 2px solid #DDD; }
    .nav-tabs > li.active > a, .nav-tabs > li.active > a:focus, .nav-tabs > li.active > a:hover { border-width: 0; }
    .nav-tabs > li > a { border: none; color: #666; }
        .nav-tabs > li.active > a, .nav-tabs > li > a:hover { border: none; color: #4285F4 !important; background: transparent; }
        .nav-tabs > li > a::after { content: ""; background: #4285F4; height: 2px; position: absolute; width: 100%; left: 0px; bottom: -1px; transition: all 250ms ease 0s; transform: scale(0); }
    .nav-tabs > li.active > a::after, .nav-tabs > li:hover > a::after { transform: scale(1); }
.tab-nav > li > a::after { background: #21527d none repeat scroll 0% 0%; color: #fff; }
.tab-pane { padding: 15px 0; }
.tab-content{padding:20px}

.card {background: #FFF none repeat scroll 0% 0%; box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.3); margin-bottom: 30px; }

            
        </style>
       
    </head>

    <body>
        <%
            if(session.getAttribute("authority")==null){
         String site = new String("NewWelcome.jsp"); 
                       response.setStatus(response.SC_MOVED_TEMPORARILY);   
                       response.setHeader("Location", site);
    }
else{
    
}
%>

    </head>

        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html">Authorized-Person</a>
                </div>
                <!-- /.navbar-header -->

                <ul class="nav navbar-top-links navbar-right">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-envelope fa-fw"></i>  <i class="fa fa-caret-down"></i>
                        </a>

                    </li>
                    <!-- /.dropdown -->
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-tasks fa-fw"></i>  <i class="fa fa-caret-down"></i>
                        </a>

                    </li>

                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-bell fa-fw"></i>  <i class="fa fa-caret-down"></i>
                        </a>

                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">

                            <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                            </li>
                            <li class="divider"></li>
                            <li><a  id="logout" href="javascript:void(0)"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                              
                            </li>
                        </ul>
                    </li>
                </ul>
                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">

                            <li>
                                <a class="active" id="profilepage" href="javascript:void(0)"><i class="fa fa-user fa-fw"></i>Profile</a>
                            </li>
                            <li>
                                <a  id="coursepage" href="javascript:void(0)"><i class="fa fa-dashboard fa-fw"></i>Courses</a>
                            </li>
                            <li>
                                <a id="attendancepage" href="javascript:void(0)"><i class="fa fa-bar-chart-o fa-fw"></i>Faculty<span class="fa arrow"></span></a>
                                
                            </li>
                            <li>
                                <a id="noticepage" href="javascript:void(0)"><i class="fa fa-table fa-fw"></i>Student</a>
                            </li>
                            <li>
                                <a id="resultpage" href="javascript:void(0)"><i class="fa fa-edit fa-fw"></i>Designation</a>
                            </li>



                        </ul>
                    </div>

                </div>

            </nav>

          
            <div id="page-wrapper">
                <br>
                <br>
                <br>
                <br>
                <br>
                            <div class="container  col-lg-12" id="notice" style="display:none;">
     <h1>Registered-Student</h1>
<!--     <h3> Get Detail of student</h3>
      <div class=" input-group col-lg-6">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input id="sgetDetail" type="text" class="form-control" name="sgetDetail" placeholder="Enter Student ID" />
                            
                        </div>-->
    
<!--     <div class='image-text'> <a id="getDetail" href="images/TIDCIV0001.png">Description</a></div>
     <script>
         $('#getDetail').click(function(){
            $('#sgetDetail').val();
            $('#getDetail').fancybox({
                    
            });
         });
     </script>-->
            <div class="row table-responsive">
           <table class="table table-bordered table-hover">
                    <%
                        try{
                             String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
                              String DB_URL = "jdbc:mysql://localhost/record";
                              String USER = "root";
                             String PASS = "admin";
                        if(session.getAttribute("authority")!=null){
                      Class.forName(JDBC_DRIVER);
                        PreparedStatement ps;
                      Connection con = DriverManager.getConnection(DB_URL,USER,PASS);
                         ps = con.prepareStatement("select * from student");
                        int i; 
                           ResultSet rs = ps.executeQuery();
                          ResultSetMetaData rsdm = rs.getMetaData();      
                         out.print("<tr>");
                        out.print("<td>"+"SR.NO"+"</td>");
                        out.print("<td>"+rsdm.getColumnName(1)+"</td>");
                        out.print("<td>"+rsdm.getColumnName(2)+"</td>");
                        out.print("<td>"+rsdm.getColumnName(3)+"</td>");
                        out.print("<td>"+rsdm.getColumnName(4)+"</td>");
                        out.print("<td>"+rsdm.getColumnName(5)+"</td>");
                        out.print("<td>"+rsdm.getColumnName(6)+"</td>");
                        out.print("<td>"+rsdm.getColumnName(7)+"</td>");
                        out.print("<td>"+rsdm.getColumnName(8)+"</td></tr>");
                        i=1;
                         while(rs.next())
                         {
                        String sid =rs.getString(1);
                        String sroll = rs.getString(2);
                        String sname = rs.getString(3);
                        String branch =rs.getString(4);
                        String email = rs.getString(5);
                        String phone = rs.getString(6);
                        String dob =rs.getString(7);
                        String add = rs.getString(8); 
                        out.print("<tr>");
                        out.print("<td>"+i+"</td>");
                        out.print("<td>"+sid+"</td>");
                        out.print("<td>"+sroll+"</td>");
                        out.print("<td>"+sname+"</td>");
                        out.print("<td>"+branch+"</td>");
                        out.print("<td>"+email+"</td>");
                        out.print("<td>"+phone+"</td>");
                        out.print("<td>"+dob+"</td>");
                        out.print("<td>"+add+"</td></tr>");
                         
                    i++;
                         }
                    con.close();
                    ps.close();
                   rs.close();
                   
                     
                        }
                        
                        }catch(Exception e){
                            
                        }
                        %>
                    </table>   
            </div>              
                </div>
                                <div class="row table-responsive">    
                            <div class="container" id="attendance" style="display:none;">
                                <h1>Faculty</h1>  <table class="table table-bordered table-hover">
                    <%
                        try{
                             String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
                              String DB_URL = "jdbc:mysql://localhost/record";
                              String USER = "root";
                             String PASS = "admin";
                        if(session.getAttribute("authority")!=null){
                      Class.forName(JDBC_DRIVER);
                        PreparedStatement ps;
                      Connection con = DriverManager.getConnection(DB_URL,USER,PASS);
                         ps = con.prepareStatement("select * from faculty");
                        int i; 
                           ResultSet rs = ps.executeQuery();
                          ResultSetMetaData rsdm = rs.getMetaData();      
                         out.print("<tr>");
                        out.print("<td>"+"SR.NO"+"</td>");
                        out.print("<td>"+rsdm.getColumnName(1)+"</td>");
                        out.print("<td>"+rsdm.getColumnName(2)+"</td>");
                        out.print("<td>"+rsdm.getColumnName(3)+"</td>");
                        out.print("<td>"+rsdm.getColumnName(4)+"</td>");
                        out.print("<td>"+rsdm.getColumnName(5)+"</td>");
                        out.print("<td>"+rsdm.getColumnName(6)+"</td></tr>");
                        i=1;
                         while(rs.next())
                         {
                        String fid =rs.getString(1);
                        String desig = rs.getString(6);
                        String fname = rs.getString(2);
                        String branch =rs.getString(5);
                        String email = rs.getString(3);
                        String phone = rs.getString(4);
                        out.print("<tr>");
                        out.print("<td>"+i+"</td>");
                        out.print("<td>"+fid+"</td>");
                        out.print("<td>"+fname+"</td>");
                        out.print("<td>"+email+"</td>");
                        out.print("<td>"+phone+"</td>");
                        out.print("<td>"+branch+"</td>");
                        out.print("<td>"+desig+"</td></tr>");
                         
                    i++;
                         }
                    con.close();
                    ps.close();
                   rs.close();
                   
                     
                        }
                        
                        }catch(Exception e){
                            
                        }
                        %>
                    </table>   
                            </div>
                                </div>
             
                            <div class="container" id="result" style="display:none;" >
                                <h1>Designation</h1>
                                
                               <div class="container">
	<div class="row">
		                                <div class="col-md-6">
                                    <!-- Nav tabs --><div class="card">
                                    <ul class="nav nav-tabs" role="tablist">
                                        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Student</a></li>
                                        <li role="presentation"><a href="#profileL" aria-controls="profile" role="tab" data-toggle="tab">Faculty</a></li>
                                        <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Messages</a></li>
                                        <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Settings</a></li>
                                    </ul>

                                    <!-- Tab panes -->
                                    <div class="tab-content">
                                        <div role="tabpanel" class="tab-pane active" id="home">
                                            
                    <div class="form-group">
                        
                        <div class=" input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input id="sID" type="text" class="form-control" name="sID" placeholder="ID" />
                        </div>
                    </div>
                       

                    <div class="form-group">
                        
                        <div class=" input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-dashboard"></i></span>
                            <input id="sdesignation" type="text" class="form-control" name="sdesig" placeholder="Disignation" />
                        </div>
                    </div>
                    
                 
                   <div class="form-group">
                        <div class="col-sm-12">
                            <button type="button" class="btn btn-primary btn-block " id="ssubmit" name="ssubdesig" value="Submit">Submit</button>
                        </div>
                    </div>
                                                 <br>
                                                 <br>
                                        
                                            
                                        </div>
                                        
                                        <div role="tabpanel" class="tab-pane" id="profileL">
                                           
                                              <form method="post" action="FacultyDasignation">
                    <div class="form-group">
                        
                        <div class=" input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input id="fID" type="text" class="form-control" name="fID" placeholder="ID" />
                        </div>
                    </div>
                       

                    <div class="form-group">
                        
                        <div class=" input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-dashboard"></i></span>
                            <input id="fdesignation" type="text" class="form-control" name="fdesig" placeholder="Disignation" />
                        </div>
                    </div>
                     <div class="form-group">
                        
                        <div class=" input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-dashboard"></i></span>
                            <input id="fsdesignation" type="text" class="form-control" name="fsdesig" placeholder="Special Disignation" />
                        </div>
                    </div>
                     <div class="form-group">
                        <div class=" input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-pushpin"></i></span>
                            <select class="form-control" id="fdept" placeholder="Branch" name="dept">
                                <option>CSE</option>
                                <option>MEC</option>
                                <option>CIV</option>
                                <option>EEE</option>
                                <option>ECE</option>
                                <option>ADMIN</option>
                                <option>CSA</option>
                            </select>
                            
                        </div>
                    </div>
                 
                   <div class="form-group">
                        <div class="col-sm-12">
                            <button type="button" class="btn btn-primary btn-block " id="fsubmit" name="fsubdesig" value="Submit">Submit</button>
                        </div>
                    </div>
                                                 <br>
                                                 <br>
                                     </form>  
                                          
                                        </div>
                                        <div role="tabpanel" class="tab-pane" id="messages">hvjhbgjh</div>
                                        <div role="tabpanel" class="tab-pane" id="settings">fkkhvjhv</div>
                                    </div>
                                </div>
	</div>
</div>
                            
                </div>
                                <div class="alert alert-success alert-dismissible col-lg-6" role="alert" id="responseDesig" style="display: none">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  
</div>
                            </div>
                             <div class="container" id="course" style="display:none;">
                                <h1>Courses</h1>
                </div>
                </div>
                          
                            
                            

            </div>
                            
     
            <script>
               $('#noticepage').on("click", function () {
                 
                   $('#notice').css("display","block");
                    $('#profile').css("display","none");
                    $('#course').css("display","none");
                    $('#result').css("display","none");
                    $('#attendance').css("display","none");
               });
                $('#profilepage').on("click", function () {
                   $('#notice').css("display","none");
                    $('#profile').css("display","block");
                    
                    $('#attendance').css("display","none");
                    $('#result').css("display","none");
                    $('#course').css("display","none");
               });
               $('#resultpage').on("click", function () {
                    $('#notice').css("display","none");
                    $('#profile').css("display","none");
                    $('#attendance').css("display","none");
                    $('#result').css("display","block");
                    $('#course').css("display","none");
               });
                $('#attendancepage').on("click", function () {
                  $('#notice').css("display","none");
                    $('#profile').css("display","none");
                    $('#attendance').css("display","block");
                    $('#result').css("display","none");
                    $('#course').css("display","none");
               });
                $('#coursepage').on("click", function () {
                   $('#notice').css("display","none");
                    $('#profile').css("display","none");
                    $('#attendance').css("display","none");
                    $('#result').css("display","none");
                    $('#course').css("display","block");
               });
              
            </script>

             <script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>
            <script src="dist/js/sb-admin-2.js"></script>
        

    </body>

</html>
