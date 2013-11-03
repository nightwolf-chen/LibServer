<%-- 
    Document   : Login
    Created on : 2013-3-25, 13:57:56
    Author     : zerojetlag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
<link href="assets/css/login.css" rel="stylesheet">
<script type="text/javascript" src="dwr/interface/UserOperator.js"></script>
<script type="text/javascript">
    function check(user)
    {
        //alert("asdfsdfsd");
        if (user)
        {
            //alert("登陆成功\n" + user.username + "\n" + user.password);
            window.navigate("LoginSession.jsp?username=" + user.username);
        }
        else
        {
            alert("登录失败");
        }
    }
    function login()//登录函数
    {
        var userMap = {};//form1.username.value
        userMap.username = form1.username.value;
        userMap.password = $.md5(form1.password.value);
        // alert(userMap.username + "\n" + userMap.password);
        //var s=$.md5(form1.username.value);
        //alert(userMap.username + "\n" + userMap.password);
        console.log(userMap.password)
        UserOperator.findUser(userMap, check);
    }
</script>

<div id="myLogin1" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <span>Login</span>
    </div>
    <form class="form-signin" id="form1">
        <h2 class="form-signin-heading">Please sign in</h2>
        <input type="text" class="input-block-level" placeholder="Username" id="username">
        <input type="password" class="input-block-level" placeholder="Password" id="password">
        <label class="checkbox">
            <input type="checkbox" value="remember-me"> Remember me
        </label>
        <button class="btn btn-large btn-primary" type="submit" onclick="login()" >Sign in</button>
    </form>
</div>
