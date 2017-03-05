$(document).ready(function(e) { 
    $("#fsignup").click(function(){
   
    var name = $('#fname').val();
    var email = $('#femail').val();
    var phone = $('#fphone').val();
    var department = $('#fdept').val();
    var pass = $('#fpass').val();
    var cpass = $('#fcpass').val();

     var datastringU = 'name='+encodeURIComponent(name)
             +'&'+'email='+encodeURIComponent(email)
             +'&'+'password='+encodeURIComponent(pass)
             +'&'+'cpassword='+encodeURIComponent(cpass)
             +'&'+'phone='+encodeURIComponent(phone)
             +'&'+'dept='+encodeURIComponent(department);  //white space sensetive
   
    
    $.ajax({
        type: 'POST',
        data:datastringU,
        url: "SignupFaculty",
        
        success: function (data, textStatus, jqXHR) {
                       
                        var resp = jqXHR.responseText;
                        if(resp==="success"){
                            
                          $('#responseFaculty').html("Success!!! Now you can use i-CAT app");
                          $('#responseFaculty').fadeIn(1);
                         $('#responseFaculty').fadeOut(4000);
                         
                        }
                        else if(resp==="failed"){
                            $('#responseFaculty').fadeIn(100);
                         $('#responseFaculty').html("Warning!!! Try again");
                            $('#responseFaculty').fadeOut(6000);
                        }
                        
                        else{
                             $('#responseFaculty').fadeIn(100);
                             $('#responseFaculty').html("Warning!!! Something went wrong"+resp);
                             $('#responseFaculty').fadeOut(5000);
                        }
                      
                    },
                    
        error: function (jqXHR, textStatus, errorThrown) {
                          $('#responseFaculty').fadeIn(100);
                             $('responseFaculty').html("Something went wrong");
                             $('responseFaculty').fadeOut(5000);
                    },
                    beforeSend: function (xhr) {
                       $('#btn-Signup').attr("disabled", true);  
                    },
         complete: function (jqXHR, textStatus ) {
                        $('#btn-Signup').attr("disabled", false);
                }
         
    });
    
           
    });
    
     $("#ssignup").click(function(){     
    var sroll = $('#sroll').val();
    var sname = $('#sname').val();
    var branch = $('#sbranch').val();
    var email = $('#semail').val();
    var phone = $('#sphone').val();
    var dob = $('#sdob').val();
    var address = $('#saddress').val();
    var pass = $('#spass').val();
    var rpass = $('#scpass').val();
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
   
    
    $.ajax({
        type: 'POST',
        data:datastringU,
        url: "SignupStudent",
        success: function (data, textStatus, jqXHR) {
                       
                        var resp = jqXHR.responseText;
                        alert(resp);
                        if(resp==="success"){
                            
                          $('#responseStudent').html("Now you can use i-CAT App");
                          $('#responseStudent').fadeIn(100);
                         
                         
                        }
                        else if(resp==="failed"){
                            $('#responseStudent').fadeIn(100);
                         $('#responseStudent').html("Warning!!! Something went wrong ");
                            $('#responseStudent').fadeOut(6000);
                        }
                        
                        else{
                             $('#responseStudent').fadeIn(100);
                             $('#responseStudent').html("Warning!!! Something went wrong");
                             $('#responseStudent').fadeOut(5000);
                        }
                      
                    },
                    
        error: function (jqXHR, textStatus, errorThrown) {
                              $('#responseStudent').fadeIn(100);
                             $('#responseStudent').html("Server problem");
                             $('#responseStudent').fadeOut(5000);
                    },
                    beforeSend: function (xhr) {
                       $('#ssignup').attr("disabled", true);  
                    },
         complete: function (jqXHR, textStatus ) {
                        $('#ssignup').attr("disabled", false);
                }
         
    });
    
           
    });
     $("#btn-loginTemp").click(function(){
        
 var email = $('#login-usernameTemp').val();
   var Pass = $('#login-passwordTemp').val();
     var datastringU ='email='+encodeURIComponent(email)+'&'+'password='+encodeURIComponent(Pass);  //white space sensetive
    $.ajax({
        type: 'POST',
        data:datastringU,
        url: "TempLogin",
        success: function (data, textStatus, jqXHR) {
                       
                        var resp = jqXHR.responseText;
                        if(resp===Pass){
                            $('#responseTemp').fadeIn(100);
                          $('#responseTemp').html("Now you can fill your information in singup page");
                       
                        }
                        else if(resp==='not_match'){
                             $('#responseTemp').fadeIn(100);
                             $('#responseTemp').html("Something went wrong!!");
                              $('#responseTemp').fadeOut(4000);
                        }
                        else{
                            $('#responseTemp').fadeIn(100);
                            $('#responseTemp').fadeOut(4000);
                         $('#responseTemp').html("Please give your email id to CSE department");
                        }
                      
                    },
                    
        error: function (jqXHR, textStatus, errorThrown) {
                        alert("Server problem"); 
                    },
                    beforeSend: function (xhr) {
                         $('#btn-loginTemp').attr("disabled", true);
                    },
                    complete: function (jqXHR, textStatus ) {
                         $('#btn-loginTemp').attr("disabled", false);
                }
         
    });
    
           
    });
    $("#btn-loginFaculty").click(function(){
        
 var userName = $('#login-usernameFaculty').val();
   var Pass = $('#login-passwordFaculty').val();
     var datastringU ='fid='+encodeURIComponent(userName)+'&'+'pass='+encodeURIComponent(Pass);  //white space sensetive
    $.ajax({
        type: 'POST',
        data:datastringU,
        url: "Login",
        
        success: function (data, textStatus, jqXHR) {
                       
                        var resp = jqXHR.responseText;
                        if(resp===Pass){
                            
                          $('#responseFacLogin').html("Welcome back Login Successfull.");
                          $('#responseFacLogin').fadeIn(1);
                          window.location.replace("FacultyHome.jsp");
                
                        }
                        else if(resp==="faculty"){
                            
                          $('#responseFacLogin').html("Login only for faculties ");
                          $('#responseFacLogin').fadeIn(10);
                           $('#responseFacLogin').fadeOut(4000);
                         
                        }
                        else{
                            $('#responseFacLogin').fadeIn(100);
                            $('#responseFacLogin').fadeOut(4000);
                         $('#responseFacLogin').html("Error!!! "+resp);
                        }
                      
                    },
                    
        error: function (jqXHR, textStatus, errorThrown) {
                        alert("errorrr"); 
                    },
                    beforeSend: function (xhr) {
                         $('#btn-login').attr("disabled", true);
                    },
                    complete: function (jqXHR, textStatus ) {
                         $('#btn-login').attr("disabled", false);
                }
         
    });
    
           
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
	
});