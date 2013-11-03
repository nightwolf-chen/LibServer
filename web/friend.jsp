
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="Database.DatabaseManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="include/Header.jsp" %>
<script type="text/javascript" src="dwr/engine.js"></script>
<script type="text/javascript" src="dwr/util.js"></script>
<script type="text/javascript" src="assets/js/proxy.js"></script>
<script type="text/javascript" src="dwr/interface/DatabaseOperator.js"></script>

<script type="text/javascript">

    function refreshPage() {
        window.location.reload();
    }

    function del_message(messageId) {

        DatabaseOperator.delMessage(messageId, refreshPage);
    }

    function del_friend(username, fusername) {
        DatabaseOperator.delFriend(username, fusername,refreshPage);
    }
    
    function loginCheck(){
        var username = <%=(String)session.getAttribute("username")%> ;
        //alert(username) ;
        if(username===null)
         window.location.href="loginPlus.jsp";
    }
    
    loginCheck() ;
    //goProxy();
</script>

<div class="container-fluid">

    <ul id="myTab" class="nav nav-tabs">
        <li class="active"><a href="#person" data-toggle="tab">个人信息</a></li>
        <li class=""><a href="#friendList" data-toggle="tab">好友列表</a></li>
        <li class=""><a href="#message" data-toggle="tab">个人信箱</a></li>
    </ul>

    <div id="myTabContent" class="tab-content">
        <!--个人信息-->
        <div class="tab-pane fade active in" id="person">
            <div class="row-fluid">
                <div class="span12">
                    <div class="well">

                        <div class="row-fluid">
                            <div class="span2">
                                <img src="assets/img/boy.png" class="img-polaroid"/>
                                <p> <br></p>
                                <p class="text-info"><strong>测试用户</strong></p>
                            </div>

                            <div class="span10">
                                <div class="row-fluid">
                                <h4 class="text-info">基本信息：</h4>
                                <div class="span5">
                                    <ul class="nav nav-list">
                                        <li>昵称：测试</li>
                                        <li>真实姓名：测试</li>
                                        <li>学校：广东外语外贸大学</li>
                                        <li>学院：思科信息学院</li>
                                        <li>专业：测试</li>
                                    </ul>                        
                                </div>

                                <div class="span5">
                                    <ul class="nav nav-list">
                                        <li>邮箱：ceshi@ceshi.com</li>
                                        <li>QQ：123456</li>
                                        <li>手机：1232</li>
                                        <li></li>
                                        <li></li>
                                    </ul>                        
                                </div>
                                </div><!--end of span10 row-fluid-->
                                
                                <h4 class="text-info">个人介绍：</h4>
                                <p>本网站的测试用户！</p>
                                
                            </div><!--end of span10-->
                            
                        </div>

                    </div>
                </div>
            </div><!--end of row-fluid-->
        </div>

        <!--好友列表-->
        <div class="tab-pane fade" id="friendList">
            <div class="row-fluid">

                <%
                    username = (String)session.getAttribute("username") ;
                    
                    ResultSet fSet = DatabaseManager.select("select * from friends where username='" + username + "'");
                    
                    while (fSet.next()) {
                        String fName = fSet.getString("fusername");

                %>
                <div class="span3">
                    <div class="well">
                        <ul class="nav nav-list">
                            <li><img src="assets/img/boy.png"><h5 class='pull-right'><%=fName%></h5></li>
                            <li>&nbsp;</li>
                            <li><button class="btn btn-info btn-small" onclick="location.href = 'sendMessage.jsp?reciever=<%=fName%>'">发送消息</button><div class="pull-right"><button class="btn btn-info btn-small" onclick="del_friend(<%=username%>,<%=fName%>);">移除好友</button></div></li>
                        </ul>  
                    </div>
                </div><!--end of span3-->

                <%
                    }
                %>

            </div><!--end of row-fluid-->

        </div>


        <!--消息记录-->
        <div class="tab-pane fade" id="message">

            <%
                
                ResultSet mRs = DatabaseManager.select("select * from message where reciever='" + username + "' order by messagetime desc");
                //out.println("username"+username);
                while (mRs.next()) {
                    String sender = mRs.getString("senderid");
                    String time = mRs.getString("messagetime");
                    String content = mRs.getString("content");
                    String messageId = mRs.getString("messageid");
            %>
            <div class="row-fluid">
                <div class="span12">
                    <div class="well">
                        <p class="text-info"><strong><%=time%></strong><strong> -- From:<%=sender%></strong></p>
                        <p class="text">
                            <%=content%>
                        </p>
                        <p><div class="pull-right"><button class="btn btn-info" onclick="location.href = 'sendMessage.jsp?reciever=<%=sender%>'" >回复</button>&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-info" onclick="del_message(<%=messageId%>)">删除</button></div></p>
                    </div>
                </div>
            </div><!--end of row-fluid-->

            <%
                }
            %>


        </div>



    </div>
</div> <!--end of  container-->
<%@include file="include/Footer.jsp"%>
