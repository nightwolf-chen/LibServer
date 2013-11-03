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
    
    function refreshPage(){
        
        location.href="bloglist.jsp" ;
    }
    
    function del_notice(nid){
        
            DatabaseOperator.delNotice(nid,refreshPage) ;
            
    }
</script>

<div class="container-fluid">

    <div class="row-fluid">


        <div class="hero-unit">

            <div class="row">
                <p>标题</p>
                <textarea  id="post_title" rows="2" class="span12"></textarea>
               
                <br/>
                
                <p>内容</p>
                <textarea  id="post_content" rows="10" class="span12"></textarea>
                <% 
                    username = (String)session.getAttribute("username");
                    String nid = request.getParameter("nid");
                    /*
                    if(username==null){
                        
                        response.sendRedirect("index.jsp#myLogin");
                        
                    }
                    * */
                    
                %>
                <p class="pull-right">
                    <button class="btn btn-primary" type="button" onclick="del_notice('<%=nid%>')">确定发表</button>
                </p>
                
            </div>  
        </div>

    </div>

</div><!--/.fluid-container-->

<%@include file="include/Footer.jsp"%>

