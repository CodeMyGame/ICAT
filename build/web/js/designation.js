     $(document).ready(function(){
                   $('#logout').on("click", function () {
                
                    $.ajax({
                        url: "Logout",
                        type: 'POST',
                        success: function (data, textStatus, jqXHR) {
                            var resp = jqXHR.responseText;
                            if (resp === "success") {
                                alert("Logout Successfull");
                                window.location.replace("NewWelcome.jsp");

                            }
                            if (resp === "failed") {
                                alert("Failed!!!");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            alert("Something went wrong!!!!");
                        }
                    });

                }); 
                
                 $("#ssubmit").click(function(){
      
    var sid = $('#sID').val();
    var desig = $('#sdesignation').val();
    
     var datastringU = 'sid='+encodeURIComponent(sid)
             +'&'+'sdesig='+encodeURIComponent(desig);
    $.ajax({
        type: 'POST',
        data:datastringU,
        url: "StudentDesignation",
        
        success: function (data, textStatus, jqXHR) {
                       
                        var resp = jqXHR.responseText;
                        if(resp==="success"){
                            
                          $('#responseDesig').html("Success!!! Designation updated");
                          $('#responseDesig').fadeIn(1);
                         $('#responseDesig').fadeOut(4000);
//                          window.setTimeout(function(){
//                              location.reload(5000);
//                          });

                        }
                        else if(resp==="failed"){
                            $('#responseDesig').fadeIn(100);
                         $('#responseDesig').html("Warning!!! Designation not updated");
                            $('#responseDesig').fadeOut(6000);
                        }
                        
                        else{
                             $('#responseDesig').fadeIn(100);
                             $('#responseDesig').html("Warning!!! Something went wrong");
                             $('#responseDesig').fadeOut(5000);
                        }
                      
                    },
                    
        error: function (jqXHR, textStatus, errorThrown) {
                          $('#responseDesig').fadeIn(100);
                             $('#responseDesig').html("Technical Server Problem");
                             $('#responseDesig').fadeOut(5000);
                    },
                    beforeSend: function (xhr) {
                       $('#ssubmit').attr("disabled", true);  
                    },
         complete: function (jqXHR, textStatus ) {
                        $('#ssubmit').attr("disabled", false);
                }
         
    });
    
           
    });
           $("#fsubmit").click(function(){
      
    var fid = $('#fID').val();
    var fdesig = $('#fdesignation').val();
    var fsdesig = $('#fsdesignation').val();
    var dept = $('#fdept').val();
    var datastringU = 'fid='+encodeURIComponent(fid)
             +'&'+'fdesig='+encodeURIComponent(fdesig)
             +'&'+'fsdesig='+encodeURIComponent(fsdesig)
             +'&'+'fdept='+encodeURIComponent(dept);
    $.ajax({
        type: 'POST',
        data:datastringU,
        url: "FacultyDesignation",
        
        success: function (data, textStatus, jqXHR) {
                       
                        var resp = jqXHR.responseText;
                        if(resp==="success"){
                            
                          $('#responseDesig').html("Success!!! Designation updated");
                          $('#responseDesig').fadeIn(1);
                         $('#responseDesig').fadeOut(4000);
//                          window.setTimeout(function(){
//                              location.reload(5000);
//                          });

                        }
                        else if(resp==="failed"){
                            $('#responseDesig').fadeIn(100);
                         $('#responseDesig').html("Warning!!! Designation not updated");
                            $('#responseDesig').fadeOut(6000);
                        }
                        
                        else{
                             $('#responseDesig').fadeIn(100);
                             $('#responseDesig').html("Warning!!! Something went wrong");
                             $('#responseDesig').fadeOut(5000);
                        }
                      
                    },
                    
        error: function (jqXHR, textStatus, errorThrown) {
                          $('#responseDesig').fadeIn(100);
                             $('#responseDesig').html("Technical Server Problem");
                             $('#responseDesig').fadeOut(5000);
                    },
                    beforeSend: function (xhr) {
                       $('#fsubmit').attr("disabled", true);  
                    },
         complete: function (jqXHR, textStatus ) {
                        $('#fsubmit').attr("disabled", false);
                }
         
    });
    
           
    });
                
            });