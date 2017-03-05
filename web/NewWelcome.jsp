 <%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<html lang="en">
<head>
  <title>Welcome|i-CAT</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="theme-color" content="#3F435F">
  <script src="js/jquery.js" type="text/javascript"></script>
     <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="dist/css/formValidation.css"/>
    <script type="text/javascript" src="vendor/jquery/jquery.js"></script>
    <script type="text/javascript" src="dist/js/formValidation.min.js"></script>
    <script type="text/javascript" src="dist/js/framework/bootstrap.min.js"></script>
     <script src="dist/js/bootstrap.js" type="text/javascript"></script>
     <link href="css/footer.css" rel="stylesheet" type="text/css"/>
       <script src="js/fileupload.js" type="text/javascript"></script>
     <script src="js/myajax.js" type="text/javascript"></script>
     <link href="css/profile.css" rel="stylesheet" type="text/css"/>
 
  <style>
     @font-face{
          font-family: myfont;
          src: url("fonts/1.otf");
          
      }
#responseTemp,#responseStudent,#responseFaculty,#responseFacLogin{
          display:none;
      }
    
      body{

           font-family: century gothic;
           background-color: #3F435F;
      }
     
      .navbar-brand .navbar-toggle .icon-bar {
    background-color: #fff;
}

.h1{
   text-align: center;
   font-size: 9vw;
   margin-top: 1.5em;
   font-family: myfont;
   color: white;
   text-shadow: #222 1px 5px;
}
.popups{
    background-color:#4A5784;
   
}
 
li a{
    color:  #BBCCDA;
}

  </style>

 
</head>
<body class="img-responsive">
  <%
      if(session.getAttribute("name")!=null){
          
                String site = new String("Home.jsp");
                response.setStatus(response.SC_MOVED_TEMPORARILY, "Already login");
                response.setHeader("Location", site);
           
      }
          
        %>
        
   <nav class="nav navbar-fixed-top navbar-brand">
<div class ="container-fluid">
<div class="navbar-header">
<button type="button" class="navbar-toggle " data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
    <a style="color: #ccccff" href="#" class="navbar-brand"><strong style="font-size:20px"><img src="images/iCATweb.png" alt="" width="40px" height="40px"/>&nbsp;i-CAT</strong></a>
</div>
<div class="collapse navbar-collapse" id="myNavbar">
<ul class="nav navbar-nav navbar-left">
    <li ><a  href="#"><span class="glyphicon glyphicon-align-left"></span>&nbsp;&nbsp;About</a></li>
         <li ><a href="#"><span class="glyphicon glyphicon-bell"></span>&nbsp;&nbsp;Developers</a></li>
          <li ><a href="app.html"><span class="glyphicon glyphicon-book"></span>&nbsp;&nbsp;i-CAT Android App</a></li>
      </ul>
<ul class="nav navbar-nav navbar-right">
   
        <li ><a id ="auth" href="javascript:void(0)"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;Authority</a></li>
         <script>
        $('#auth').on("click", function () {
            $('#logButtonAuth').click();
        });
    </script>
      </ul>
</div>
</div>
</nav>  
    <br><br>
    <div id="page-wrapper"> 
   <div class="container">    
       <div class="modal-body">
       
           <h1 class="h1">
           Welcome&nbsp;to&nbsp;i-CAT
            </h1>
           <br>
           <br>
           <br>
           <div class="modal fade" style="z-index: 5000" id="authLogin" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
       
        <center><h4 class="modal-title" id="exampleModalLabel">Authorized-person LogIn</h4></center>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body popups">
        <form>
             <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input id="login-usernameAuth" type="text"  class="form-control" name="id"  placeholder="username" >                                        
                                    </div>
                                
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input id="login-passwordAuth" type="password" class="form-control" name="password" placeholder="password">
                                    </div>
                                    

                                
                            <div class="input-group">
                                      <div class="checkbox">
                                        <label>
                                          <input id="login-rememberAuth" type="checkbox" name="remember" value="1"> Remember me
                                        </label>
                                      </div>
                                    </div>


                                <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->

                                    <div class="col-sm-12 controls">
                                      <button type="button" class="btn btn-info btn-block" id="btn-loginAuth">Login</button><br>
                                      

                                    </div>
        </form>
      </div>
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>
       
       </div>
           
<div class="modal fade" style="z-index: 5000" id="tempLogin" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
       
        <center><h4 class="modal-title" id="exampleModalLabel">Temporary LogIn</h4></center>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body popups">
        <form>
             <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input id="login-usernameTemp" type="text"  class="form-control" name="id"  placeholder="ID" >                                        
                                    </div>
                                
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input id="login-passwordTemp" type="password" class="form-control" name="password" placeholder="password">
                                    </div>
                                    

                                
                            <div class="input-group">
                                      <div class="checkbox">
                                        <label>
                                          <input id="login-remembeTemp" type="checkbox" name="remember" value="1"> Remember me
                                        </label>
                                       
                                      </div>
                                    </div>

                                <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->

                                    <div class="col-sm-12 controls">
                                      <button type="button" class="btn btn-info btn-block" id="btn-loginTemp">Login</button><br>
                                    </div>
        </form>
      </div>
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>
       
       </div>
           <div class="modal fade" style="z-index: 5000" id="signupStudent" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        
        <center> <h4 class="modal-title" id="exampleModalLabel">Register-Student(
            <%
                if(session.getAttribute("uid")!=null){
                                if(session.getAttribute("uid").toString().charAt(0)=='I'){
                                  String uid = "ID";
                               uid = session.getAttribute("uid").toString();
                                out.print(uid);
                                }
                                else{
                                    out.print("Follow Temp login");
                                    
                                }
                }
                else{
                                    out.print("Follow Temp login");
                                    
                                }
                
                              %>
            )
            </h4></center>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body popups">
                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                           <form id="defaultForm"  class="form-horizontal" >
 
                               <div class="form-group">
                               <div  class=" input-group">
                              <span class="input-group-addon"><i class="glyphicon glyphicon-eye-close"></i></span>
                              <input id="sroll" type="text" class="form-control" name="roll" placeholder="Student roll" />
                        </div>
                    </div>
                    <div class="form-group">
                        
                        <div class=" input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input id="sname" type="text" class="form-control" name="sname" placeholder="Student name" />
                        </div>
                    </div>
                        <div class="form-group">
                        <div class=" input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-pushpin"></i></span>
                            <select class="form-control" id="sbranch" placeholder="Branch" name="branch">
                                <option>CSE</option>
                                <option>MEC</option>
                                <option>CIV</option>
                                <option>EEE</option>
                                <option>ECE</option>
                            </select>
                            
                        </div>
                    </div>


                    <div class="form-group">
                        
                        <div class=" input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                            <input id="semail" type="email" class="form-control" name="email" placeholder="Email" />
                        </div>
                    </div>
                           <div class="form-group">
                        
                        <div class=" input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                            <input id="sphone" type="number" class="form-control" name="phone" placeholder="Phone" />
                        </div>
                    </div>
                                <div class="form-group">
                         <div class=" input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                            <input id="sdob" type="date" class="form-control" name="dob" placeholder="yyyy-mm-dd" />
                        </div>
                    </div>
                                <div class="form-group">
             <div class=" input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                          
                            <textarea class="form-control" rows="5" id="saddress" placeholder="Address" name="address"></textarea>
                        </div>
                    </div>


                    <div class="form-group">
                               
                                <div class=" input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                    <input id="spass" type="password" class="form-control" name="password" placeholder="Password"/>
                                </div>
                            </div>

                            <div class="form-group">
                                
                                <div class=" input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                    <input id="scpass" type="password" class="form-control" name="confirmPassword" placeholder="Confirm password" />
                                </div>
                            </div>
                                
                   <div class="form-group">
                        <div class="col-sm-12">
                            <button type="button" class="btn btn-info btn-block " id="ssignup" name="signup" value="Sign up">Submit</button>
                        </div>
                    </div>
                           </form>
                    </div>
              
    </div>
  </div>
</div>
       
       </div>
           <div class="modal fade" id="signupFaculty" style="z-index: 5000" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
        
      <div class="modal-header">
        
        <center><h4 class="modal-title" id="exampleModalLabel">Register-Faculty(
                 <%
                                if(session.getAttribute("uid")!=null){
                                if(session.getAttribute("uid").toString().charAt(0)=='T'){
                                  String uid = "ID";
                               uid = session.getAttribute("uid").toString();
                                out.print(uid);
                                }
                                else{
                                    out.print("Follow Temp login");
                                    
                                }
                                }else{
                                    out.print("Follow Temp login");
                                    
                                }
                              %>
                )</h4></center>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
                
      <div class="modal-body popups">
  
                 

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                           <form id="defaultForm1"  class="form-horizontal" >
                              
                        
                    <div class="form-group">
                        
                        <div class=" input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input id="fname" type="text" class="form-control" name="fname" placeholder="Name" />
                        </div>
                    </div>
                       

                    <div class="form-group">
                        
                        <div class=" input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                            <input id="femail" type="text" class="form-control" name="email" placeholder="Email" />
                        </div>
                    </div>
                    <div class="form-group">
                        
                        <div class=" input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                            <input id="fphone" type="number" class="form-control" name="phone" placeholder="Phone" />
                        </div>
                    </div>
                                
                   
                                 <div class="form-group">
                        <div class=" input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-pushpin"></i></span>
                            <select class="form-control" id="fdept" placeholder="Department" name="dept">
                                <option>CSE</option>
                                <option>MEC</option>
                                <option>CIV</option>
                                <option>EEE</option>
                                <option>ECE</option>
                            </select>
                            
                        </div>
                    </div>

                    <div class="form-group">
                               
                                <div class=" input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                    <input id="fpass" type="password" class="form-control" name="password" placeholder="Password"/>
                                </div>
                            </div>

                            <div class="form-group">
                                
                                <div class=" input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                    <input id="fcpass" type="password" class="form-control" name="confirmPassword" placeholder="Confirm password" />
                                </div>
                            </div>
                                
                   <div class="form-group">
                        <div class="col-sm-12">
                            <button type="button" class="btn btn-info btn-block " id="fsignup" name="signup" value="Sign up">Submit</button>
                        </div>
                    </div>
                              
                           </form>
                    </div>
              

                                       
      
    </div>
  </div>
</div>
       
       </div>
           <div class="modal fade" id="loginFaculty" style="z-index: 5000" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        
        <center><h4 class="modal-title" id="exampleModalLabel"> LogIn</h4></center>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body popups">
        <form>
            
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input id="login-usernameFaculty" type="text" required value="" class="form-control" name="id"  placeholder="ID" >                                        
                                    </div>
                                
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input id="login-passwordFaculty" type="password" required value="" class="form-control" name="password" placeholder="password">
                                    </div>
                            <div class="input-group">
                                      <div class="checkbox">
                                        <label>
                                          <input id="login-remember" type="checkbox" name="remember" value="1"> Remember me
                                        </label>
                                      </div>
                                    </div>


                                <div style="margin-top:10px" class="form-group">
                                
                                    <div class="col-sm-12 controls">
                                      <button type="button" class="btn btn-info btn-block" id="btn-loginFaculty">Login</button><br>
                                      

                                    </div>
        </form>
      </div>
      <div class="modal-footer">
       
      </div>
    </div>
  </div>
</div>
       
       </div>
           
         
                
         <center>
             <button type="button" style="width: 70px;height: 70px;border-radius: 50%; box-shadow:  0px 3px 5px #acbaaa;" id="tempButton" class="btn btn-info" data-toggle="modal" data-target="#tempLogin"><span class="glyphicon glyphicon-user"></span><strong>Temp</strong><br><strong>LogIn</strong></button>&nbsp;&nbsp;
             <button type="button" style="width: 70px;height: 70px;border-radius: 50%;box-shadow:   0px 3px 5px #acbaaa;" id="StuButton" class="btn btn-warning" data-toggle="modal" data-target="#signupStudent"><strong>Signup</strong><br><strong>Student</strong></button>&nbsp;&nbsp;
             <button type="button" style="width: 70px;height: 70px;border-radius: 50%;box-shadow:   0px 3px 5px #acbaaa;" id="FacButton" class="btn btn-success" data-toggle="modal" data-target="#signupFaculty"><strong>Signup</strong><br><strong>Faculty</strong></button>&nbsp;&nbsp;
          <button type="button" style="width: 70px;height: 70px;border-radius: 50%;box-shadow:   0px 3px 5px #acbaaa;" id="logButton" class="btn btn-danger" data-toggle="modal" data-target="#loginFaculty" ><span class="glyphicon glyphicon-user"></span><strong>LogIn</strong></button>&nbsp;&nbsp;
          <button type="button" id="logButtonAuth" class="btn btn-danger" data-toggle="modal" data-target="#authLogin"style="display: none" >LogIn</button>
       
           </center>
               
       <div class="footer navbar-fixed-bottom">
	<div class="container">
            <div class="footer-left">
            <%
            Calendar cal=Calendar.getInstance();
           Date date = cal.getTime();
           int year = date.getYear()+1900;
            %>
		
			<p>&copy; CSE department NIT Uttarakhand <%=year%>-<%=year+1%></p>
                       
		</div>
		<div class="footer-right">
			<ul>
				<li><a class="facebook" href="#"></a></li>
                                
			</ul>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
   </div>
    </div>          
 <div class="alert alert-info alert-dismissible col-lg-5" role="alert" id="response" style="display:none;margin-left:30% ;text-align: center;z-index: 8000"></div>         
    </div>
                   
    </body>
</html>
