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

    function reloadPage() {

        location.reload();
    }
    function add_post(postid) {

        var content = document.getElementById("post_content").value;
        var username = "社区管理员";
        DatabaseOperator.addPostComment(username, content, postid, reloadPage);


    }
</script>

<div class="container-fluid">

    <div class="row-fluid">

        <div class="hero-unit">

            <%
                String postId = request.getParameter("postid");
                ResultSet rs1 = DatabaseManager.select("select * from post where postid=" + postId);
                rs1.next();
                String title = rs1.getString("title");
                String pcontent = rs1.getString("content");
                String puserid = rs1.getString("post_userid");
            %>
            <div class="row">
                
                 <p class="navbar-text pull-right">
                <button class="btn" type="button" onclick="">作者：<%=puserid%></button> 
            </p>
           

             <button class="btn btn-primary" type="button" onclick=""><h4>话题：<%=title%></h4></button>
                <div class="well">
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;<%=pcontent%></p>
                </div>
               
                
            </div>

            <hr>
            <div class="row">
                <p class="text-info"><strong>发表评论：</strong></p>
                <textarea  id="post_content" rows="5" class="span12"></textarea>
                <p class="pull-right">
                    <button class="btn btn-primary" type="button" onclick="add_post(<%=postId%>)">发表</button>
                </p>

                <%
                    ResultSet rs2 = DatabaseManager.select("select * from post_comments where postid=" + postId +" order by comment_time desc");
                %>
            </div>  

            <div class="row">
                <%
                    int count = 1;
                    while (rs2.next()) {

                        String postid = rs2.getString("postid");
                        String content = rs2.getString("content");
                        String userid = rs2.getString("userid");
                %>
                <div >
                    <div class="well well-large">
                        <p class="text-info"><small>#<%=count%>楼(<%=userid%>)</small> </p>  
                         <p> <%=content%></p> 
                    </div>
                </div>

                <%
                        count++;
                    }
                %>
            </div>



        </div><!--/hero-unit -->
    </div><!--/.fluid-container-->

    <%@include file="include/Footer.jsp"%>

