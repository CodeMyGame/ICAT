$(document).ready(function(){
    
           $("#btn-loginFaculty").click(function(){
        
 var userName = $('#login-usernameFaculty').val().trim();
 var Pass = $('#login-passwordFaculty').val().trim();
                        if(userName==='' && Pass===''){
			$("#login-passwordFaculty").css('border-color','red');
			$("#login-usernameFaculty").css('border-color','red');
			}
			else if(userName==='' &&  Pass!==''){
			$("#login-usernameFaculty").css('border-color','red');
			$("#login-passwordFaculty").css('border-color','#ccc');
			}
			else if(Pass==='' && userName!==''){
			$("#login-passwordFaculty").css('border-color','red');
			$("#login-usernameFaculty").css('border-color','#ccc');
			}
			else{
			$("#login-passwordFaculty").css('border-color','#ccc');
			$("#login-usernameFaculty").css('border-color','#ccc');
                        
			} 
     var datastringU ='fid='+encodeURIComponent(userName)+'&'+'pass='+encodeURIComponent(Pass)+'&'+'key='+encodeURIComponent("key");
    if(userName!==''&&Pass!==''){
    $.ajax({
        type: 'POST',
        data:datastringU,
        url: "Login",
        
        success: function (data, textStatus, jqXHR) {
                      
                        var resp = jqXHR.responseText;
                        if(resp===Pass){
                          $('#response').html("SUCCESS: Welcome back Login Successfull.");
                          $('#response').fadeIn(1);
                          window.location.replace("Home.jsp");      
                        }
                      
                        
                        else if(resp==="faculty"){     
                          $('#response').html("ERROR: Login only for faculties & Students");
                          $('#response').fadeIn(10);
                           $('#response').fadeOut(4000);
                         
                        }
                        else{
                            $('#response').fadeIn(100);
                            $('#response').fadeOut(4000);
                         $('#response').html("ERROR : ID and password combination missmatched");
                        }
                      
                    },
                    
        error: function (jqXHR, textStatus, errorThrown) {
                      $('#responseFacLogin').fadeIn(100);
                            $('#response').fadeOut(4000);
                         $('#response').html("ERROR :Technical server Problem");
                    },
                    beforeSend: function (xhr) {
                         $('#btn-login').attr("disabled", true);
                    },
                    complete: function (jqXHR, textStatus ) {
                         $('#btn-login').attr("disabled", false);
                }
             
    });
    }else{
                          $('#response').html("ERROR: Username/Password field empty");
                          $('#response').fadeIn(10);
                          $('#response').fadeOut(4000);
    }
        
    });    
    
    
    $("#fsignup").click(function(){
      
    var name = $('#fname').val().trim();
    var email = $('#femail').val().trim();
    var phone = $('#fphone').val().trim();
    var department = $('#fdept').val().trim();
    var pass = $('#fpass').val().trim();
    var cpass = $('#fcpass').val().trim();
     var datastringU = 'name='+encodeURIComponent(name)
             +'&'+'email='+encodeURIComponent(email)
             +'&'+'password='+encodeURIComponent(pass)
             +'&'+'cpassword='+encodeURIComponent(cpass)
             +'&'+'phone='+encodeURIComponent(phone)
             +'&'+'dept='+encodeURIComponent(department);  //white space sensetive
   
    if(name!==''&&email!==''&&phone!==''&&department!==''&&pass!==''&&cpass!==''){
    $.ajax({
        type: 'POST',
        data:datastringU,
        url: "SignupFaculty",
        
        success: function (data, textStatus, jqXHR) {
                       
                        var resp = jqXHR.responseText;
                        if(resp==="success"){
                          $('#response').html("SUCCCESS: Now you can use i-CAT app");
                          $('#response').fadeIn(1);
                         $('#response').fadeOut(4000);
                        }
                        else if(resp==="failed"){
                            $('#response').fadeIn(100);
                         $('#response').html("ERROR :  Try again");
                            $('#response').fadeOut(6000);
                        }
                        
                        else{
                             $('#response').fadeIn(100);
                             $('#response').html("ERROR : Something went wrong");
                             $('#response').fadeOut(5000);
                        }
                      
                    },
                    
        error: function (jqXHR, textStatus, errorThrown) {
                          $('#response').fadeIn(100);
                             $('#response').html("ERROR : Technical Server Problem");
                             $('#response').fadeOut(5000);
                    },
                    beforeSend: function (xhr) {
                       $('#btn-Signup').attr("disabled", true);  
                    },
         complete: function (jqXHR, textStatus ) {
                        $('#btn-Signup').attr("disabled", false);
                }
         
    });
    
        }else{
                             $('#response').fadeIn(100);
                             $('#response').html("ERROR : Input fields are empty");
                             $('#response').fadeOut(5000);
        }  
    });
    
     $("#ssignup").click(function(){     
    var sroll = $('#sroll').val().trim();
    var sname = $('#sname').val().trim();
    var branch = $('#sbranch').val().trim();
    var email = $('#semail').val().trim();
    var phone = $('#sphone').val().trim();
    var dob = $('#sdob').val().trim();
    var validate =dob.match(/([0-9]{4})-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])/);
    var address = $('#saddress').val().trim();
    var pass = $('#spass').val().trim();
    var rpass = $('#scpass').val().trim();
     var datastringU = 'sname='+encodeURIComponent(sname)
             +'&'+'sroll='+encodeURIComponent(sroll)
             +'&'+'email='+encodeURIComponent(email)
             +'&'+'pass='+encodeURIComponent(pass)
             +'&'+'rpass='+encodeURIComponent(rpass)
             +'&'+'branch='+encodeURIComponent(branch)
             +'&'+'phone='+encodeURIComponent(phone)
             +'&'+'dob='+encodeURIComponent(dob)
             +'&'+'address='+encodeURIComponent(address);
               //white space sensetive
   
    if(sname!==''&&sroll!==''&&branch!==''&&email!==''&phone!==''&&dob!==''&&address!==''&&pass!==''&&rpass!==''){
        if(validate!==null){
    $.ajax({
        type: 'POST',
        data:datastringU,
        url: "SignupStudent",
        success: function (data, textStatus, jqXHR) {
                       
                        var resp = jqXHR.responseText;
                        if(resp==="success"){
                                     
                          $('#response').html("SUCCESS : Now you can use i-CAT App/Web");
                          $('#response').fadeIn(100);
                        }
                        else if(resp==="failed"){
                            $('#response').fadeIn(100);
                            $('#response').html("ERROR : Warning!!! Something went wrong ");
                            $('#response').fadeOut(6000);
                        }
                        
                        else{
                             $('#response').fadeIn(100);
                             $('#response').html("ERROR : Warning!!! Something went wrong");
                             $('#response').fadeOut(5000);
                        }
                      
                    },
                    
        error: function (jqXHR, textStatus, errorThrown) {
                              $('#response').fadeIn(100);
                             $('#response').html("ERROR : Technical Server problem");
                             $('#response').fadeOut(5000);
                    },
                    beforeSend: function (xhr) {
                       $('#ssignup').attr("disabled", true);  
                    },
         complete: function (jqXHR, textStatus ) {
                        $('#ssignup').attr("disabled", false);
                }
         
    });
    }else{
                          
     $('#response').fadeIn(100);
     $('#response').html("ERROR : DOB format invalid ");
     $('#response').fadeOut(6000); 
    }
}else{
      $('#response').fadeIn(100);
      $('#response').html("ERROR : Input fields are empty ");
      $('#response').fadeOut(6000); 
     }
    });
     $("#btn-loginTemp").click(function(){
      
 var email = $('#login-usernameTemp').val().trim();
   var Pass = $('#login-passwordTemp').val().trim();
     var datastringU ='email='+encodeURIComponent(email)+'&'+'password='+encodeURIComponent(Pass);
     if(email!==''&&Pass!==''){
    $.ajax({
        type: 'POST',
        data:datastringU,
        url: "TempLogin",
        success: function (data, textStatus, jqXHR) {
                       
                        var resp = jqXHR.responseText;
                        if(resp===Pass){
                            $('#response').fadeIn(100);
                          $('#response').html("SUCCESS : Now you can fill your information in singup page after refreshing page..");
                          window.setTimeout(function(){
                              location.reload(5000);
                          });
                       
                        } 
                        else if(resp==='not_match'){
                             $('#response').fadeIn(100);
                             $('#response').html("ERROR : ID and password combination mismatched!!!");
                              $('#response').fadeOut(4000);
                        }
                        else if(resp==='empty'){
                             $('#response').fadeIn(100);
                             $('#response').html("ERROR : Enter ID and password!!!");
                              $('#response').fadeOut(4000);
                        }
                        else{
                            $('#response').fadeIn(100);
                            $('#response').fadeOut(4000);
                         $('#response').html("Please give your email id to CSE department");
                        }
                      
                    },
                    
        error: function (jqXHR, textStatus, errorThrown) {
                         $('#response').html("ERROR : Technical server problem!!!");
                    },
                    beforeSend: function (xhr) {
                         $('#btn-loginTemp').attr("disabled", true);
                    },
                    complete: function (jqXHR, textStatus ) {
                         $('#btn-loginTemp').attr("disabled", false);
                }
         
    });
    
         }else{
                             $('#response').fadeIn(100);
                             $('#response').html("ERROR : UID/Password field empty");
                             $('#response').fadeOut(4000);
         }     
    });
  
      $('#defaultForm1').formValidation({
        message: 'This value is not valid',
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            id: {
                
                validators: {
                    notEmpty: {
                        message: 'The ID is required'
                    }
                }
            },
            fname: {
                
                validators: {
                    notEmpty: {
                        message: 'The name is required'
                    }
                }
            },
            phone: {
               
                validators: {
                    notEmpty: {
                        message: 'The phone number is required'
                    }
                }
            },
             dept: {
               
                validators: {
                    notEmpty: {
                        message: 'The department is required'
                    }
                }
            },
            
            email: {
                validators: {
                    notEmpty: {
                        message: 'The email address is required'
                    },
                    emailAddress: {
                        message: 'The input is not a valid email address'
                    }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: 'The password is required and can\'t be empty'
                    }
                }
            },
            confirmPassword: {
                validators: {
                    notEmpty: {
                        message: 'The confirm password is required and can\'t be empty'
                    },
                    identical: {
                        field: 'password',
                        message: 'The password and its confirm are not the same'
                    }
                }
            }
            
           
            
        }
    });
    
    $('#defaultForm').formValidation({
        message: 'This value is not valid',
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            id: {
                
                validators: {
                    notEmpty: {
                        message: 'The ID is required'
                    }
                }
            },
            sname: {
                
                validators: {
                    notEmpty: {
                        message: 'The first name is required'
                    }
                }
            },
            
            
            email: {
                validators: {
                    notEmpty: {
                        message: 'The email address is required'
                    },
                    emailAddress: {
                        message: 'The input is not a valid email address'
                    }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: 'The password is required and can\'t be empty'
                    }
                }
            },
            confirmPassword: {
                validators: {
                    notEmpty: {
                        message: 'The confirm password is required and can\'t be empty'
                    },
                    identical: {
                        field: 'password',
                        message: 'The password and its confirm are not the same'
                    }
                }
            },
            dob: {
                validators: {
                    notEmpty: {
                        message: 'DOB required'
                    }
                }
            },
            address: {
                validators: {
                    notEmpty: {
                        message: 'Address required'
                    }
                }
            },
             phone: {
                validators: {
                    notEmpty: {
                        message: 'phone required'
                    }
                }
            },
             branch: {
                validators: {
                    notEmpty: {
                        message: 'branch name required'
                    }
                }
            },
             roll: {
                validators: {
                    notEmpty: {
                        message: 'Roll number required '
                    }
                }
            }
        }
    });
      $('#defaultForm1').formValidation({
        message: 'This value is not valid',
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            id: {
                
                validators: {
                    notEmpty: {
                        message: 'The ID is required'
                    }
                }
            },
            fname: {
                
                validators: {
                    notEmpty: {
                        message: 'The first name is required'
                    }
                }
            },
            
            
            email: {
                validators: {
                    notEmpty: {
                        message: 'The email address is required'
                    },
                    emailAddress: {
                        message: 'The input is not a valid email address'
                    }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: 'The password is required and can\'t be empty'
                    }
                }
            },
            confirmPassword: {
                validators: {
                    notEmpty: {
                        message: 'The confirm password is required and can\'t be empty'
                    },
                    identical: {
                        field: 'password',
                        message: 'The password and its confirm are not the same'
                    }
                }
            },
            
             phone: {
                validators: {
                    notEmpty: {
                        message: 'phone number required'
                    }
                }
            },
             dept: {
                validators: {
                    notEmpty: {
                        message: 'branch name required'
                    }
                }
            }
             
        }
    });
    $("#btn-loginAuth").click(function(){
        
 var userName = $('#login-usernameAuth').val().trim();
   var Pass = $('#login-passwordAuth').val().trim();
     var datastringU ='fid='+encodeURIComponent(userName)+'&'+'pass='+encodeURIComponent(Pass)+'&'+'key='+encodeURIComponent("authority");  //white space sensetive
     if(userName!==''&&Pass!==''){
    $.ajax({
        type: 'POST',
        data:datastringU,
        url: "Login",
        
        success: function (data, textStatus, jqXHR) {
                      
                        var resp = jqXHR.responseText;
                        if(resp===Pass){
                            
                          $('#response').html("SUCCESS : Welcome back Login Successfull.");
                          $('#response').fadeIn(1);
                          window.location.replace("Authority.jsp");
                
                        }
                      
                       
                        else if(resp==="faculty"){
                            
                          $('#response').html("ERROR : Login only for authorized person");
                          $('#response').fadeIn(10);
                           $('#response').fadeOut(4000);
                         
                        }
                        else{
                            $('#response').fadeIn(100);
                            $('#response').fadeOut(4000);
                         $('#response').html("ERROR : ID and password combination not matched");
                        }
                      
                    },
                    
        error: function (jqXHR, textStatus, errorThrown) {
                      $('#response').fadeIn(100);
                            $('#response').fadeOut(4000);
                         $('#response').html("ERROR : Technical server Problem");
                    },
                    beforeSend: function (xhr) {
                         $('#btn-loginAuth').attr("disabled", true);
                    },
                    complete: function (jqXHR, textStatus ) {
                         $('#btn-loginAuth').attr("disabled", false);
                }
         
    });
    
        }else{
             $('#response').fadeIn(100);
             $('#response').fadeOut(4000);
             $('#response').html("ERROR : UID/Password are empty");
        }
    });
    });