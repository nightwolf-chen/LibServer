<%-- 
    Document   : proxy
    Created on : 2013-4-24, 20:49:37
    Author     : nightwolf
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="include/Header.jsp" %>

<%
    String info = "欢迎您";
    username = (String) session.getAttribute("username");

    if (username != null) {
        if (!username.equals("")) {
            response.sendRedirect("index.jsp");
        }
    } else {
        username = request.getParameter("username");
        String password = request.getParameter("password");
        if (username != null && password != null) {
            ResultSet userRs = Database.DatabaseManager.select("select * from users where username='" + username + "' and password='" + password + "'");
            if (userRs!=null && userRs.next()) {
                response.sendRedirect("LoginSession.jsp?username=" + username);
            } else {
                info = "登录失败";
            }
        }
    }
%>
<script language="javascript" type="text/javascript">

    function mysubmit() {

        var username = document.getElementById("username").value;
        var password = $.md5(document.getElementById("password").value);
        window.location.href = "loginPlus.jsp?username=" + username + "&password=" + password;
      
    }
</script>
<link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
<link href="assets/css/login.css" rel="stylesheet">
<div id="myLogin1" class="" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <span>Login</span>
    </div>
    <div class="form-signin" id="form1">
        <h2 class="form-signin-heading">Please sign in</h2>
        <h3 ><%=info%></h3>
        <input type="text" class="input-block-level" placeholder="Username" id="username">
        <input type="password" class="input-block-level" placeholder="Password" id="password">
        <label class="checkbox">
            <input type="checkbox" value="remember-me"> Remember me
        </label>
        <button class="btn btn-large btn-primary" onclick="mysubmit();">Sign in</button>
    </div>
</div>

<%@include file="include/Footer.jsp"%>
