<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Vector"%>
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
        <title>Home</title>
        <script src="js/jquery.js" type="text/javascript"></script>
        <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">
        <link href="dist/css/sb-admin-2.css" rel="stylesheet">
        <link href="bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <script src="js/bootstrap-filestyle.js" type="text/javascript"></script>
        <link href="css/profile.css" rel="stylesheet" type="text/css"/>
        <script src="js/filesupload.js" type="text/javascript"></script>
        <script src="dist/js/bootstrap.js" type="text/javascript"></script>
        <link href="css/floating.css" rel="stylesheet" type="text/css"/>
        <script src="js/encrpdicryp.js" type="text/javascript"></script>
        <script src="js/jquery.easyui.min.js" type="text/javascript"></script>
        <style>

            @font-face{
                font-family: myfont;
                src: url("fonts/1.otf");

            }
            #dp{
                cursor: pointer;
            }
            .centered {
                width: 100%;
                margin-left: auto;
                margin-right: auto;
                text-align: center;
            }
            h1,h2,h3{
                font-family: century gothic;
            }
            .refno{
                cursor: pointer;

            }
            .refno:hover{
                color: red;
            }
            .card{

                height:100px;
                background-color: #e7e7e7;
                border-bottom: 5px solid #fff;
                box-shadow: 5px 10px 10px #524343;

                cursor: pointer;
            }
            .card:hover{
                background-color: #8a94d8;

            }
            .circle{
                background-color: #9BAAB9;
                border-radius: 50%;
                height: 60px;
                width:60px; 
                margin-top: 20px;
                line-height: 60px;
                text-align: center;
                font-size: 30px;
                font-family: myfont;
            }
            .subject{
                height: 100px;
                cursor: pointer;
                line-height: 100px;
                color: #660000
            }
            .attachmentimg{
                height: 80px;
/*                background-color: #ff1;*/
                text-align: center;
                padding: 10px;

            }

            #datealign{
                float:right;
            }
            .date{
                color: #b91b1b
            }
            .modal-body {

                background-color: whitesmoke;
            }
            .modal-header {

                background-color: grey;
            }
        </style>

        <script>
            $(document).ready(function () {
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

                $('body').on('click', '.card', function () {
                    var content = $(this).text();
                    var array = content.split(',');
                    var subject = array[1];
                    var date = array[3];
                    var refno = array[4];
                    var desg = array[5];
                    var attach = array[6];
                    var tid = array[7];
                    var refwithoutslash = refno.replace(/\//g, '');
                    var refwithoutand = refwithoutslash.replace(/\&/g, '');
                    if (attach === 'n') {
                        $('.attachonnotice').css("display", "none");

                    }
                    else {
                        $('.attachonnotice').css("display", "inline");
                        $('#attachpath').attr("href", "notices\\" + refwithoutand + "\\attachment.pdf");
                    }
                    $('#refno').html(refno);
                    $('#ntcdate').html(date);
                    $('#sub').html(subject);
                    $('#ntcdesignation').html(desg);
                    var branch = $('#branch').val();

                    var datastringU = 'refno=' + encodeURIComponent(refno) + '&' + 'branch=' + encodeURIComponent(branch) + '&' + 'tid=' + encodeURIComponent(tid);
                    if (refno !== '') {
                        $.ajax({
                            type: 'POST',
                            data: datastringU,
                            url: "RetriveBody",
                            success: function (data, textStatus, jqXHR) {

                                var resp = jqXHR.responseText;
                                var jsonresp = jQuery.parseJSON(resp);
                                if (resp.toString() === 'iA') {
                                    $('#body').html("");
                                } else {
                                    $('#body').html(jsonresp.body.toString());
                                }
                                $('#ntcemail').html(jsonresp.fmail.toString());
                                $('#ntcfname').html(jsonresp.fname.toString());
                                $('#ntcmobile').html(jsonresp.fmobile.toString());
                                $('.viewnoticebtn').click();
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                alert("ERROR : Technical Server Problem");
                            }


                        });

                    } else {
                        alert("ERROR : Technical Server Problem");
                    }

                });


                $('#uploadntc').click(function () {

                    var attachment = $('#attachment').val();
                    //var ref = $('#refno').val();
                    var subject = $('#subject').val().trim();
                    var body = $('#content').val().trim();
                    var date = $('#date').val();
                    var validate = date.match(/([0-9]{4})-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])/);
                    var desig = $('#desig').val();
                    var spdesig = $('#desig #spdesig').val();
                    var atch = attachment;
                    var sub = encrypt(subject);
                    var bodyy = encrypt(body);
                    var datee = encrypt(date);
                    var desigg = encrypt(desig);
                    var uname = encrypt($('#uname').val());
                    var branch;
                    var splauthcode;
                    if (desig === spdesig) {
                        splauthcode = '1';
                    } else {
                        splauthcode = '0';
                    }
                    branch = encrypt($('#depart').val());
                    var splauth = encrypt(splauthcode);
                    var flag = true;

                    if (attachment !== '') {
                        if ((attachment.split('.')[1].toLowerCase()) !== 'pdf') {
                            $('#alertnotice').html("ERROR: Please select a valid attachment");
                            $('#alertnotice').fadeIn(1);
                            $('#alertnotice').fadeOut(6000);
                            flag = false;
                        }
                    }
                    if (desigg === 'uniAoplsnhll') {
                        $('#alertnotice').html("ERROR: You can see only notices");
                        $('#alertnotice').fadeIn(1);
                        $('#alertnotice').fadeOut(6000);
                        flag = false;
                    }
                    if (flag) {

                        if (subject !== '' && date !== '') {
                            if (validate !== null) {
                                var du = {'AgiAoplsnhniussiytirohtu': uname, 'ceiAoplsnhjbus!;!$!t': sub, 'obiAoplsnhyd': bodyy, 'adiAoplsnhet': datee, 'caiAoplsnhttatnemh': atch, 'uaiAoplsnhht': desigg, 'tuiAoplsnhalps!;!$!h': splauth, 'ariAoplsnhbhcn': branch};

                                $.ajax({
                                    type: 'POST',
                                    url: 'NoticeUpload',
                                    data: {d: JSON.stringify(du)},
                                    dataType: "json",
                                    success: function (data, textStatus, jqXHR) {
                                        var resp = jqXHR.responseText;

                                        if (atch !== '') {
                                            var refnnn = jQuery.parseJSON(resp);
                                            var refno = refnnn.refNo;
                                            $('#refNo').val(refno);
                                            $('#upload-button').click();
                                        } else {
                                            $('#alertnotice').html(resp);
                                            $('#alertnotice').fadeIn(2000);
                                            $('#alertnotice').fadeOut(6000);
                                            $('#subject').val('');
                                            $('#content').val('');
                                            // $('#date').val('');
                                            $('#attachment').val('');
                                        }

                                    },
                                    error: function (jqXHR, textStatus, errorThrown) {
                                        $('#alertnotice').html("ERROR:" + " Technical Server problem!!!");
                                        $('#alertnotice').fadeIn(2000);
                                        $('#alertnotice').fadeOut(6000);
                                    },
                                    beforeSend: function (xhr) {
                                        $('#uploadntc').attr("disabled", true);
                                        $('#uptext').css("display", "none");
                                        $('#upimg').css("display", "inline");

                                    },
                                    complete: function (jqXHR, textStatus) {

                                        setTimeout(function () {
                                            $('#uploadntc').attr("disabled", false);
                                            $('#uptext').css("display", "inline");
                                            $('#upimg').css("display", "none");
                                        }, 5000);
                                    }

                                });
                            } else {
                                $('#alertnotice').html("ERROR:Date format is invalid");
                                $('#alertnotice').fadeIn(1);
                                $('#alertnotice').fadeOut(6000);
                            }
                        } else {

                            $('#alertnotice').html("ERROR: Subject/Date field is empty");
                            $('#alertnotice').fadeIn(1);
                            $('#alertnotice').fadeOut(6000);
                        }
                    }
                });
                $('form#data').submit(function () {
                    var formData = new FormData($(this)[0]);

                    $.ajax({
                        url: 'UploadAttachment',
                        type: 'POST',
                        data: formData,
                        async: false,
                        cache: false,
                        contentType: false,
                        processData: false,
                        success: function (data, textStatus, jqXHR) {
                            var resp = alert(jqXHR.responseText);
                            if (resp === '') {
                                $('#alertnotice').html("SUCCESS: Notice posted successfully");
                                $('#alertnotice').fadeIn(1);
                                $('#alertnotice').fadeOut(6000);
                                $('#subject').val('');
                                $('#content').val('');
                                // $('#date').val('');
                                $('#attachment').val('');
                            } else {
                                $('#alertnotice').html("ERROR:");
                                $('#alertnotice').fadeIn(1);
                                $('#alertnotice').fadeOut(6000);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $('#alertnotice').html("ERROR:" + " Technical Server problem!!!");
                            $('#alertnotice').fadeIn(1);
                            $('#alertnotice').fadeOut(6000);
                        },
                        beforeSend: function (xhr) {
                            $('#uploadntc').attr("disabled", true);
                            $('#uptext').css("display", "none");
                            $('#upimg').css("display", "inline");
                        },
                        complete: function (jqXHR, textStatus) {
                            $('#uploadntc').attr("disabled", false);
                            $('#uptext').css("display", "inline");
                            $('#upimg').css("display", "none");
                        }


                    });
                    return false;
                });

            });
        </script>

    </head>

    <body>

        <%
            String checkstudent = null;
            String checkfaculty = null;
            if (session.getAttribute("name") == null) {
                String site = new String("NewWelcome.jsp");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site);
            } else if (session.getAttribute("name").toString().charAt(0) == 'I') {
//    String site = new String("StudentHome.jsp"); 
//                       response.setStatus(response.SC_MOVED_TEMPORARILY);   
//                       response.setHeader("Location", site);
                checkstudent = "yes";
                checkfaculty = "no";
            } else if (session.getAttribute("name").toString().charAt(0) == 'T') {
                checkstudent = "no";
                checkfaculty = "yes";
            }
        %>

        <%
            String fname = null;
            String email = null;
            String mobile = null;
            String depart = null;
            String designation = null;
            String spdesignation = null;
            String spdept = null;
            String uname = "";
            try {
                uname = session.getAttribute("name").toString();
                if (session.getAttribute("name").toString().charAt(0) == 'T') {
                    String JDBC_DRIVER = "com.mysql.jdbc.Driver";
                    String DB_URL = "jdbc:mysql://localhost:3306/record";
                    String USER = "root";
                    String PASS = "root";
                    Class.forName(JDBC_DRIVER);
                    PreparedStatement ps;
                    PreparedStatement ps1;
                    Connection con = DriverManager.getConnection(DB_URL, USER, PASS);
                    ps = con.prepareStatement("select * from faculty where fid = ?");
                    ps.setString(1, session.getAttribute("name").toString());
       //                    
                    ResultSet rs = ps.executeQuery();
                    //  
                    while (rs.next()) {
                        fname = rs.getString(2);
                        email = rs.getString(3);
                        mobile = rs.getString(4);
                        depart = rs.getString(5);
                        designation = rs.getString(6);
                    }
                    ps1 = con.prepareStatement("select designation,dept from faculty_authority where id = ?");
                    ps1.setString(1, session.getAttribute("name").toString());
                    ResultSet rs1 = ps1.executeQuery();
                    while (rs1.next()) {
                        spdesignation = rs1.getString(1);
                        spdept = rs1.getString(2);
                    }

                    con.close();
                    ps.close();
                    rs.close();
                    rs1.close();
                    ps1.close();

                } else if (session.getAttribute("name") == null) {
                    String site = new String("NewWelcome.jsp");
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", site);
                } else if (session.getAttribute("name").toString().charAt(0) == 'I') {
                    String site = new String("StudentHome.jsp");
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", site);
                } else {
                    String site = new String("NewWelcome.jsp");
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", site);
                }
            } catch (Exception e) {

            }
        %>

        <input id="uname" type="text" value="<%=uname%>" style="display: none">
        <input id="depart" type="text" value="<%=depart%>" style="display: none">
        <input id="chkstu" type="text" value="<%=checkstudent%>" style="display: none">
        <input id="chkfac" type="text" value="<%=checkfaculty%>" style="display: none">
        <input id="branch" type="text" value="" style="display: none">
        <script>
            var chkstu = $('#chkstu').val();
            var chkfac = $('#chkfac').val();
//alert(chkstu);
            if (chkstu === 'yes') {
                $('#writenoticebtn').css("display", "none");
            }
        </script>
        <div class="modal fade" style="z-index: 8000" id="writenotice" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">



                    <div class="modal-body popups">
                        <button type="button" class="btn btn-danger btn-circle" data-dismiss="modal" aria-label="Close" style="margin-left:90%">X</button><br>
                        <div class="panel-body" >

                            <div class="alert alert-success" id="alertnotice" style="display: none;text-align: center">

                            </div>
                            <div class="form-group">
                                <div  class=" input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <select class="form-control" id="desig">
                                        <option><%=designation%></option>
                                        <option id="spdesig"><%=spdesignation%></option>

                                    </select>

                                </div>
                            </div>
                            <div class="form-group">

                                <div class=" input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                    <input id="date" type="date" class="form-control" name="date" placeholder="yyyy-mm-dd" required >
                                </div>
                            </div>

                            <div class="form-group">
                                <div class=" input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-book"></i></span>
                                    <input id="subject" type="text" class="form-control" name="subject" placeholder="Subject" required >
                                </div>
                            </div>
                            <div class="form-group">
                                <div class=" input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>

                                    <textarea class="form-control" rows="5" id="content" placeholder="Content" name="content" required></textarea>
                                </div>
                            </div>
                            <form id="data">
<!--                                <div class="form-group">
                                    <div  class=" input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-barcode"></i></span>
                                        <input id="refNo" value="" type="text" class="form-control" name="refno" placeholder="Reference number">
                                    </div>
                                </div>-->
                                <strong> Attachment any(PDF)</strong> <input type='file' id="attachment" name="file">  
                                <input type="submit" id="upload-button" value="upload" style="display: none" />    
                            </form>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <button type="button" class="btn btn-success btn-block " id="uploadntc"><img id="upimg" style="display:none" src="img/hourglass.gif" width="20px" height="20px" alt=""/><span  id="uptext">Upload</span></button>

                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>

        </div>

    </div>
    <div class="row" id="floating">
        <div id="inbox">
            <div class="fab btn-group show-on-hover dropup">
                <div id="writenoticebtn" data-toggle="tooltip" data-placement="left" title="Post_Notices">
                    <button id="btnrules" type="button" class="btn btn-io dropdown-toggle" data-toggle="dropdown" style="background-color: #7994E2">
                        <span class="fa-stack fa-2x">
                            <i class="fa fa-circle fa-stack-2x fab-backdrop"></i>
                            <i class="fa fa-pencil fa-stack-1x fa-inverse fab-primary"></i>
                            <i class="fa fa-pencil fa-stack-1x fa-inverse fab-secondary"></i>
                        </span>
                    </button></div>

                <div style="display: none">

                    <button type="button" id="writebtn" class="btn btn-danger" data-toggle="modal" data-target="#writenotice" ></button>   
                </div>
                <script>
                    $('#writenoticebtn').on("click", function (e) {
                        e.preventDefault();
                        var spdesign = $('#spdesig').val();

                        if (spdesign === "null") {
                            $('#spdesig').css("display", "none");
                        } else {

                        }

                        $('#writebtn').click();
                    });

                </script>
            </div>
        </div>
    </div>

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
                <a class="navbar-brand" href="#"><strong><img src="images/iCATweb.png" alt="" width="30px" height="30px"/>i-CAT</strong></a>
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
                            <a id="attendancepage" href="javascript:void(0)"><i class="fa fa-bar-chart-o fa-fw"></i>Attendance<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a  href="#" id="cseA"><i class="fa fa-code fa-fw"></i>&nbsp;&nbsp;&nbsp;CSE</a>
                                </li>
                                <li>
                                    <a  href="#" id="mecA"><i class="fa fa-truck fa-fw"></i>&nbsp;&nbsp;&nbsp;MEC</a>
                                </li>
                                <li>
                                    <a  href="#" id="eeeA"><i class="fa fa-headphones fa-fw"></i>&nbsp;&nbsp;&nbsp;EEE</a>
                                </li>
                                <li>
                                    <a  href="#" id="eceA"><i class="fa fa-wheelchair fa-fw"></i>&nbsp;&nbsp;&nbsp;ECE</a>
                                </li>
                                <li>
                                    <a  href="#" id="civA"><i class="fa fa-building fa-fw"></i>&nbsp;&nbsp;&nbsp;CIVIL</a>
                                </li>

                            </ul>
                        </li>

                        <li>
                            <a  href="#"><i class="fa fa-edit fa-fw"></i>Notices<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a class="noticepage" href="#" id="cse"><i class="fa fa-code fa-fw"></i>&nbsp;&nbsp;&nbsp;CSE</a>
                                </li>
                                <li>
                                    <a class="noticepage" href="#" id="mec"><i class="fa fa-truck fa-fw"></i>&nbsp;&nbsp;&nbsp;MEC</a>
                                </li>
                                <li>
                                    <a class="noticepage" href="#" id="eee"><i class="fa fa-headphones fa-fw"></i>&nbsp;&nbsp;&nbsp;EEE</a>
                                </li>
                                <li>
                                    <a class="noticepage" href="#" id="ece"><i class="fa fa-wheelchair fa-fw"></i>&nbsp;&nbsp;&nbsp;ECE</a>
                                </li>
                                <li>
                                    <a class="noticepage" href="#" id="civ"><i class="fa fa-building fa-fw"></i>&nbsp;&nbsp;&nbsp;CIVIL</a>
                                </li>
                                <li>
                                    <a class="noticepage" href="#" id="csa"><i class="fa fa-xing fa-fw"></i>&nbsp;&nbsp;&nbsp;SH/CSA/ADMIN</a>
                                </li>

                            </ul>
                            <!-- /.nav-second-level -->
                        </li>

                        <script>
                            $('.noticepage').click(function (e) {
                                e.preventDefault();
                                var depart = $(this).attr('id');
                                $('#branch').val(depart);
                                var dataString = 'depart=' + encodeURIComponent(depart);

                                $('#notice').css("display", "block");
                                $('#profile').css("display", "none");
                                $('#course').css("display", "none");
                                $('#result').css("display", "none");
                                $('#attendance').css("display", "none");

                                $.ajax({
                                    type: 'GET',
                                    url: "RetriveNotice",
                                    data: dataString,
                                    success: function (data, textStatus, jqXHR) {
                                        $('#contentnotice').html("");
                                        var resp = jqXHR.responseText;
                                        var parse = $.parseJSON(resp);
                                        var status;
                                        for (i = 0; i < parse.notice.ref.length; i++) {
                                            var body = parse.notice.body[i];
                                            var sub = parse.notice.sub[i];
                                            var char = sub.charAt(0);
                                            var teachid = parse.notice.issAuth[i];
                                            var attachonnotice = parse.notice.attach[i];
                                            if (attachonnotice === 'n') {
                                                status = 'none';
                                            } else {
                                                status = 'inline';
                                            }
                                            $('#contentnotice').append("<div class='col-lg-12 col-xs-12 col-ms-12 card'>" + "<div class='circle col-lg-1 col-xs-1 col-ms-1'>" + char + "<span style='display:none'>,</span></div>" + "<div class='subject col-lg-7 col-xs-7 col-ms-7'>" + "<h4><strong>" + sub + "</strong><span style='display:none'>,</span></h4>" + "<h5>" + body + ".....<span style='display:none'>,</span></h5>" + "</div>" + "<p  class='date'><strong>" + parse.notice.date[i] + "</strong><span style='display:none'>,</span></p>" + "<div class='col-lg-1 col-xs-1 col-ms-1 attachmentimg'>" + "<img class='imgattach' src='img/attachment.png' width='20px' height='25px' alt='' style='display:" + status + "'/>" + "</div>" + "<p style='display:none' class='refno'>" + parse.notice.ref[i] + "<span style='display:none'>,</span></p>" + "<p style='display:none' class='designation'>" + parse.notice.desg[i] + "<span style='display:none'>,</span></p>" + "<p style='display:none' class='attachntc'>" + attachonnotice + "<span style='display:none'>,</span></p>" + "<p style='display:none' class='attachntc'>" + teachid + "</p>" + "</div>");

                                        }

                                    },
                                    error: function (jqXHR, textStatus, errorThrown) {
                                        $('#alertdp').html("ERROR: Technical server problem");
                                        $('#alertdp').fadeIn(1);
                                        $('#alertdp').fadeOut(6000);
                                    },
                                    beforeSend: function (xhr) {

                                    },
                                    complete: function (jqXHR, textStatus) {

                                    }

                                });
                            });

                        </script>
                        <li>
                            <a id="resultpage" href="javascript:void(0)"><i class="fa fa-edit fa-fw"></i>Results</a>
                        </li>


                    </ul>
                </div>

            </div>

        </nav>

        <br>
        <br>
        <br>
        <br>

        <div id="page-wrapper">
            <div class="container" id="profile" >
                <div class="row profile">
                    <div class="col-md-3">
                        <div class="profile-sidebar">

                            <div class="profile-userpic">
                                <form id="form1" runat="server" > 
                                    <%
                                        String dept = null;
                                        String id = null;
                                        try {
                                            String JDBC_DRIVER = "com.mysql.jdbc.Driver";
                                            String DB_URL = "jdbc:mysql://localhost/record";
                                            String USER = "root";
                                            String PASS = "admin";

                                            if (session.getAttribute("name").toString().charAt(0) == 'T') {
                                                id = session.getAttribute("name").toString();
                                                Class.forName(JDBC_DRIVER);
                                                PreparedStatement ps;
                                                Connection con = DriverManager.getConnection(DB_URL, USER, PASS);
                                                ps = con.prepareStatement("select * from faculty where fid = ?");
                                                ps.setString(1, session.getAttribute("name").toString());
                                                ResultSet rs = ps.executeQuery();
                                                while (rs.next()) {

                                                    dept = rs.getString(5);

                                                }

                                                con.close();
                                                ps.close();
                                                rs.close();
                                            }
                                        } catch (Exception e) {

                                        }
                                    %>

                                    <img id="blah" src="profilepic/Faculty/<%=dept%>/<%=id%>/dp.jpg"  alt="jpgimage" class="img-responsive" >

                                    <input style="display: none" type='file' id="imgInp" name="file" data-input="false">
                                    <span id="dppick" class="glyphicon glyphicon-pencil" style="cursor: pointer"></span>

                                    <center> <img id="imgloader" style="display:none" class="img-responsive" src="img/facebook.gif" width="30px" height="25px" alt=""/></center>
                                    <script>
                                        $('#dppick').on("click", function () {
                                            $('#imgInp').click();

                                        });
                                    </script>
                                </form>


                                <div class="alert alert-success" id="alertdp" style="display:none;position: fixed;top: 45%;left: 45%;text-align: center;">

                                </div>
                            </div>



                            <div class="profile-usertitle">
                                <div class="profile-usertitle-name">

                                    <%
                                        if (session.getAttribute("name") != null) {
                                            out.print(session.getAttribute("name").toString());
                                        }
                                    %>
                                </div>

                            </div>

                            <div class="profile-usermenu">
                                <ul class="nav">
                                    <li class="active" >
                                        <a href="#" id="overview">
                                            <i class="glyphicon glyphicon-home"></i>
                                            Overview </a>
                                    </li>
                                    <li>
                                        <a href="#" id="account">
                                            <i class="glyphicon glyphicon-user"></i>
                                            Account Settings </a>
                                    </li>
                                    <li>
                                        <a href="#" target="_blank">
                                            <i class="glyphicon glyphicon-ok"></i>
                                            Tasks </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="glyphicon glyphicon-flag"></i>
                                            Help </a>
                                    </li>
                                </ul>
                            </div>
                            <!-- END MENU -->
                        </div>
                    </div>
                    <div class="col-md-8 userInfo">


                        <h3 id="facultyname">Name : <%=fname%></h3>
                        <h3 id="facultyemail">Email : <%=email%></h3>
                        <h3 id="facultymobile">Mobile : <%=mobile%></h3>
                        <h3>Department : <%=depart%></h3>
                    </div>
                    <div class="col-md-8 accountSettings" style="display: none">
                        Account update....

                    </div>
                    <script>
                        $('#account').on("click", function (e) {
                            e.preventDefault();
                            $('.accountSettings').css("display", "block");
                            $('.userInfo').css("display", "none");

                        });
                        $('#overview').on("click", function (e) {
                            e.preventDefault();
                            $('.accountSettings').css("display", "none");
                            $('.userInfo').css("display", "block");
                        });
                    </script>
                </div>

            </div>

            <div class="modal fade" role="dialog" id="myModel" >
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">modal</h4>
                        </div>
                        <div class="modal-body">
                            <p>body</p>
                        </div>

                    </div>
                </div>
                <h1>Attendance coming soon......</h1>
            </div>

            <div class="container  col-lg-12 b" id="notice" style="display:none;">
                <center><h1 style="font-family:myfont ">NOTICE</h1></center>
                <div id="contentnotice">

                </div>

            </div>
            <div class="container" id="attendance" style="display:none;">
                <h1>Attendance coming soon......</h1>
            </div>
            <div class="container" id="result" style="display:none;">
                <h1>Result coming soon......</h1>
            </div>
            <div class="container" id="course" style="display:none;">
                <h1>Course coming soon......</h1>
            </div>


        </div>

    </div>

    <script>

        $('#profilepage').on("click", function (e) {
            e.preventDefault();
            $('#notice').css("display", "none");
            $('#profile').css("display", "block");

            $('#attendance').css("display", "none");
            $('#result').css("display", "none");
            $('#course').css("display", "none");
        });
        $('#resultpage').on("click", function (e) {
            e.preventDefault();
            $('#notice').css("display", "none");
            $('#profile').css("display", "none");
            $('#attendance').css("display", "none");
            $('#result').css("display", "block");
            $('#course').css("display", "none");
        });
        $('#attendancepage').on("click", function (e) {
            e.preventDefault();
            $('#notice').css("display", "none");
            $('#profile').css("display", "none");
            $('#attendance').css("display", "block");
            $('#result').css("display", "none");
            $('#course').css("display", "none");
        });
        $('#coursepage').on("click", function (e) {
            e.preventDefault();
            $('#notice').css("display", "none");
            $('#profile').css("display", "none");
            $('#attendance').css("display", "none");
            $('#result').css("display", "none");
            $('#course').css("display", "block");
        });

    </script>

    <script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>
    <script src="dist/js/sb-admin-2.js"></script>

    <script src="js/facultyhome.js" type="text/javascript"></script>
    <div class="modal fade" id="viewnotice" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" style="color:white">&times;</span></button>
                    <center><h2 class="modal-title" id="exampleModalLabel" style="font-family: myfont;color:#EDE8FF;">NIT &nbsp;UTTARAKHAND</h2></center>

                </div>
                <div class="modal-body popups">
                    <div style="padding-top:10px" class="panel-body" >

                        <strong><span>Reference number : <span id="refno"></span></span></strong>
                        <strong><span id="datealign">Date : <span id="ntcdate"></span></span></strong>
                        <center> 
                            <u><strong><h3 id="sub"></h3></strong></u>
                        </center>
                        <br>
                        <h4 id="body"></h4>
                        <br>
                        <h5>Faculty name :<strong id="ntcfname"></strong></h5>
                        <h5>Email ID:<strong id="ntcemail"></strong></h5>
                        <h5>Mobile no:<strong id="ntcmobile"></strong></h5>
                        <h5>Designation:<strong id="ntcdesignation"></strong></h5>
                        <center> <a class='attachonnotice' id="attachpath" style="text-decoration: none" href=""><button class="btn btn-block btn-primary"><img  src='img/unnamed.png' width='30px' height='30px'  alt=''/>&nbsp;&nbsp;<strong>Download Attachment(PDF)</strong></button></a></center>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <button class="btn btn-primary btn-lg viewnoticebtn" data-toggle="modal" data-target="#viewnotice" style="display: none">
    </button>

</body>

</html>
