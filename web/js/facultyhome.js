 $(document).ready(function () {
               
                $('input[id="imgInp"]').ajaxfileupload({
                    action: 'UploadFile',
                    onComplete: function () {
                        var image = $('#imgInp').val();
                        if(image!==''){
                            if(image.split('.')[1].toLowerCase()==='jpg'||image.split('.')[1].toLowerCase()==='jpeg'){
                                setTimeout(function(){
                           $('#imgloader').css("display","none");  
                           $('#alertdp').html("SUCCESS: DP Uploaded Successfully!!!");
                           $('#alertdp').fadeIn(1);
                           $('#alertdp').fadeOut(4000);
                        },5000);  
                            }
                        }
                        

                    },
                    onStart: function () {
                        var image = $('#imgInp').val();
                             if(image!==''){
                            if(image.split('.')[1].toLowerCase()==='jpg'||image.split('.')[1].toLowerCase()==='jpeg'){
                                  $('#imgloader').css("display","inline");
                            }
                             }}
                    
                });

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
                                $('#alertdp').html("ERROR: Technical server problem!!!");
                                $('#alertdp').fadeIn(1);
                                $('#alertdp').fadeOut(5000);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                                $('#alertdp').html("ERROR: Technical server problem!!!");
                                $('#alertdp').fadeIn(1);
                                $('#alertdp').fadeOut(5000);
                        }
                    });

                });
                function readURL(input) {

                    if (input.files && input.files[0]) {
                        var reader = new FileReader();
                        reader.onload = function (e) {
                            var image = $('#imgInp').val();
                             if(image!==''){
                            if(image.split('.')[1].toLowerCase()==='jpg'||image.split('.')[1].toLowerCase()==='jpeg'){
                                 $('#blah').attr('src', e.target.result);
                                 
                            }
                            else{

                                $('#alertdp').html("ERROR: Please select an valid image(.jpg)!!!");
                                $('#alertdp').fadeIn(1);
                                $('#alertdp').fadeOut(5000);
                        }
                             }else if(notice!==''){
                                  if(notice.split('.')[1].toLowerCase()==='pdf'){
                                 
                            }
                            else{
                            $('#responseNotice').html("Please select a valid notice!!!");
                          $('#respntc').fadeIn(1000);
                         $('#respntc').fadeOut(4000);
                        }
                             }
                        };

                        reader.readAsDataURL(input.files[0]);
                    }
                }

                $("#imgInp").change(function () {
                    readURL(this);
                });
             
                 
            });