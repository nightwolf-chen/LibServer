<%-- 
    Document   : about
    Created on : 2013-4-24, 18:39:16
    Author     : nightwolf
--%>

<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="Database.DatabaseManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="include/Header.jsp" %>

<div class="container">

    <div class="row-fluid">    
        <div class="span1"></div>
        <div class="span10">
            <img  style="max-height: 400px;max-width: " src="assets/img/taken.JPG" class="img-polaroid"/>
        <div class="span1"></div>
        </div>   
    </div>
    <h3>关于我们</h3>
    <hr>
    <p>图Young图书馆服务系统由来自于软件工程的图Young团队开发，创建于2013年4月。网站系统旨在服务广外学生，方便学生查询图书馆座位信息，使用图书馆资源以及分享资讯。</p>
    <p><br /></p>
    <h3>联系我们</h3>
    <hr>
    <p>邮箱：466202783@qq.com</p>  
    <p><br /></p>

</div> <!--end of  container-->
<%@include file="include/Footer.jsp"%>
