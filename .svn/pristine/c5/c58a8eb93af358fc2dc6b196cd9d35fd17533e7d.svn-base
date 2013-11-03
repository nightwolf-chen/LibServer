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


<div class="container-fluid">

    <div class="row-fluid">
        <h2>图书馆通知</h2>
        <div class="hero-unit">

            <%
                String nid = request.getParameter("nid");
                ResultSet rs1 = DatabaseManager.select("select * from notice where nid=" + nid);
                //out.println("select * from notice where nid=" + nid) ;
                String title="" ;
                String pcontent="" ;
                if(rs1.next()){
                title = rs1.getString("title");
                pcontent = rs1.getString("content");
                }
            %>
            <div class="row">
                
                 <p class="navbar-text pull-right">
                <button class="btn" type="button" onclick="">作者：图书馆管理员</button> 
            </p>
           

             <button class="btn btn-primary" type="button" onclick=""><h4>主题：<%=title%></h4></button>
                <div class="well">
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;<%=pcontent%></p>
                </div>
               
                
            </div>

            
        </div><!--/hero-unit -->
        
        </div> <!-- end of row-fluid-->
        
    </div><!--/.fluid-container-->

    <%@include file="include/Footer.jsp"%>

