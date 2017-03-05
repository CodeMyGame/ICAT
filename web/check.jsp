
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/fileupload.js" type="text/javascript"></script>
        <link href="css/profile.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
        <script>
             $(document).ready(function () {
               
                $('input[type="file"]').ajaxfileupload({
                    action: 'Check',
                    onComplete: function (response) {
                        $('#upload').fadeIn(100);
                        $('#upload').fadeOut(5000);
                    },
                    onStart: function () {
                        $('#upload').fadeIn(100);
                        $('#upload').fadeOut(5000);
                       
                    }
                });

                function readURL(input) {

                    if (input.files && input.files[0]) {
                        var reader = new FileReader();

                        reader.onload = function (e) {
                            $('#blah').attr('src', e.target.result);
                        };

                        reader.readAsDataURL(input.files[0]);
                    }
                }

                $("#imgInp").change(function () {
                    readURL(this);
                });
            
               
            });
        </script>
    </head>
    <body>
        
                                <div class="profile-userpic">
                                    <form id="form1" runat="server" >
                                       
                                        
                                        <img id="blah" src="images/default.png"  alt="jpegimage" />
                                        <input type='file' id="imgInp" class="custom-input filestyle " name="file" data-input="false"  />
                                        <div id="upload" style="display:none;">Uploading..</div>
                                       
                                    </form>
                 

                                </div>

    </body>
</html>
