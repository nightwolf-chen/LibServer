<%-- 
    Document   : blog
    Created on : 2013-4-23, 14:58:35
    Author     : nightwolf
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Database.DatabaseManager"%>
<%@include file="include/Header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style type="text/css">
    body {
        padding-top: 60px;
        padding-bottom: 40px;
    }
    .sidebar-nav {
        padding: 9px 0;
    }
</style>
<script type="text/javascript" src="dwr/engine.js"></script>
<script type="text/javascript" src="dwr/util.js"></script>
<script type="text/javascript" src="dwr/interface/DatabaseOperator.js"></script>

<script type="text/javascript">

    function refreshPage() {

        location.href = "friend.jsp";
    }

    function send() {


        var sender = document.getElementById("sender").value;
        //sender = "社区管理员";
        var reciever = document.getElementById("reciever").value;
        //reciever = "测试用户";
        var content = document.getElementById("content").value;

        DatabaseOperator.sendMessage(sender, reciever, content, refreshPage);

    }
</script>

<div class="container-fluid">
    <div class="row-fluid">

        <%
            String sender = username;
            String reciever = request.getParameter("reciever");
        %>
        <div class="hero-unit">
            <div class="row"><h3>发送消息</h3></div>
            <div class="row">
                <p>To</p>
                <textarea readonly="true" id="reciever" rows="1" class="span12"><%=reciever%></textarea>

                <br/>
                <p>From</p>
                <textarea  readonly="true" id="sender" rows="1" class="span12"><%=sender%></textarea>

                <br/>

                <p>内容</p>
                <textarea  id="content" rows="10" class="span12"></textarea>
                <%
                
                    /*
                     if(username==null){
                        
                     response.sendRedirect("index.jsp#myLogin");
                        
                     }
                     * */

                %>
                <p class="pull-right">
                    <button class="btn btn-primary" type="button" onclick="send()">确定发表</button>
                </p>

            </div>  
        </div>

    </div>

</div><!--/.fluid-container-->

<%@include file="include/Footer.jsp"%>

