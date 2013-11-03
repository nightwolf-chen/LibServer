<%-- 
    Document   : test
    Created on : 2013-4-24, 11:03:52
    Author     : nightwolf
--%>

<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="Database.DatabaseManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="include/Header.jsp" %>

<script type="text/javascript" src="dwr/engine.js"></script>
<script type="text/javascript" src="dwr/util.js"></script>
<script type="text/javascript" src="dwr/interface/DatabaseOperator.js"></script>

<script type="text/javascript">
    
    function refreshPage(){
        
        location.reload() ;
    }
    
    function del_notice(nid){
        
            DatabaseOperator.delNotice(nid,refreshPage) ;
            
    }
    
    function del_post(postid){
            DatabaseOperator.delPost(postid,refreshPage) ;
    }
    
    function loginCheck(){
        var username = <%=(String)session.getAttribute("username")%> ;
        //alert(username) ;
        if(username===null){
        window.location.href="loginPlus.jsp";
        }
    }
    
    loginCheck() ;
    
</script>


<div class="container-fluid">
    <div class="bs-docs-example">
        <ul id="myTab" class="nav nav-tabs">
            <li class="active"><a href="#home" data-toggle="tab">话题</a></li>
            <li class=""><a href="#notice" data-toggle="tab">通知</a></li>
            <li class=""><a href="#book" data-toggle="tab">好书推荐</a></li>
        </ul>
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade active in" id="home">
                <div class="row-fluid">
                    <div class="hero-unit">

                        <p> <button class="btn btn-large btn-primary" type="button" onclick="location.href = 'addPost.jsp'">发表新话题</button></p> 

                        <table class="table">
                            <tbody>

                                <tr>
                                    <td>时间</td>
                                    <td>话题</td>
                                    <td>作者</td>
                                    <td>操作</td>
                                </tr>

                                <%

                                    ResultSet rs1 = DatabaseManager.select("select * from post order by post_time desc");
                                    while (rs1.next()) {
                                        String postId = rs1.getString("postid");
                                        String title = rs1.getString("title");
                                        String puserId = rs1.getString("post_userid");
                                        String time = rs1.getString("post_time");
                                %>


                                <tr>
                                    <td><%=time%></td>
                                    <td><a href="blog.jsp?postid=<%=postId%>"><%=title%></a></td>
                                    <td><%=puserId%></td>
                                    <td><a onclick="del_post(<%=postId%>)">删除</a></td>
                                </tr>


                                <%
                                    }
                                %>
                            </tbody>
                        </table>

                    </div>

                </div><!--end of row-fluid-->



            </div>
            <div class="tab-pane fade" id="notice">
                <div class="row-fluid">
                    <div class="hero-unit">

                        <p> <button class="btn btn-large btn-primary" type="button" onclick="location.href = 'addNotice.jsp'">发通知</button></p> 

                        <table class="table">
                            <tbody>

                                <tr>
                                    <td>时间</td>
                                    <td>通知</td>
                                    <td>发布者</td>
                                    <td>操作</td>
                                </tr>

                                <%

                                    ResultSet rs2 = DatabaseManager.select("select * from notice order by time desc");
                                    while (rs2.next()) {
                                        String noticeId = rs2.getString("nid");
                                        String noticeTitle = rs2.getString("title");
                                        String noticeContent = rs2.getString("content");
                                        String noticeTime = rs2.getString("time");
                                        
                                %>


                                <tr>
                                    <td><%=noticeTime%></td>
                                    <td><a href="notice.jsp?nid=<%=noticeId%>"><%=noticeTitle%></a></td>
                                    <td>图书馆管理员</td>
                                    <td><a onclick="del_notice(<%=noticeId%>)">删除</a></td>
                                </tr>


                                <%
                                    }
                                %>
                            </tbody>
                        </table>

                    </div>

                </div><!--end of row-fluid-->
            </div>

            <div class="tab-pane fade" id="book">

                <div class="row">
                    <%
                        for (int i = 1; i <= 24; i++) {
                            String filePath = application.getRealPath("/") + "assets/book/bookinfo/" + String.valueOf(i) + ".txt";
                            BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(filePath), "gbk"));
                            String bookName = br.readLine();
                            String bookInfo = br.readLine();
                            String bookIntro = br.readLine();


                    %>

                    <div class="span2"><img id="book<%=i%>" onclick="location.href='http://book.douban.com/subject_search?search_text=<%=bookName%>'" src="assets/book/bookimg/<%=i%>.jpg" class="img-polaroid" rel="popover"  data-trigger="hover" data-content="<%=bookIntro%>" data-original-title="<%=bookName%>(<%=bookInfo%>)"></div>
                    <script>
                            $(function()
                            {
                                $("#book<%=i%>").popover();
                            }
                            );

                    </script>



                    <%
                            if (i % 6 == 0) {
                                out.println("</div> <div class=\"row\">");
                            }
                        }
                        out.println("</div>");
                    %>

                </div>


            </div>
        </div>

    </div> <!--end of  container-->
    <%@include file="include/Footer.jsp"%>
