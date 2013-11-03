<%-- 
    Document   : testIMG
    Created on : 2013-3-22, 14:44:44
    Author     : nightwolf
--%>

<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@include file="include/Header.jsp" %>
        <script type="text/javascript" src="dwr/engine.js"></script>
        <script type="text/javascript" src="dwr/util.js"></script>
        <script type="text/javascript" src="dwr/interface/DataUpdator.js"></script>
        <script type="text/javascript" src="assets/js/jquery-1.4.3.min.js"></script>
        <script type="text/javascript" src="assets/js/jquery.md5.js"></script>
        <script type="text/javascript">

            function refreshPage(data)
            {
               for(var key in data)
               {
                   if(data[key] === "true"){
                   document.getElementById(key).style.visibility="visible";
                   }else{
                   document.getElementById(key).style.visibility="hidden" ;   
                   }
               }
                
            }
            function update()
            {
                DataUpdator.getData(refreshPage);
            }
            var timerID = setInterval("update()", 2000);
        </script>
    

 <div id="wrap">

      <!-- Begin page content -->
      <div class="container">
 

        <%
            String filePath = application.getRealPath("/") + "files/location.txt";
            BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(filePath), "utf8"));
        %>


        <div class="back"  style="position:relative;background-image: url(assets/img/background.png); width: 840px; height: 700px ; top:50px" >

            <%
                String line = "";
                while ((line = br.readLine()) != null) {
                    System.out.println(line);
                    String[] seats = line.split(",");
                    if (seats.length < 3) {
                        continue;
                    }
                    String name = seats[0];
                    String left = seats[1];
                    String top = seats[2];
            %>
            <img id="<%=name%>"  class="img-rounded" style="position:absolute;left:<%=left%>px ;top:<%=top%>px;visibility: hidden"  src="assets/img/boy.png" /> 
            <%
                }
            %>
        
        </div>





<%@include file="include/Footer.jsp"%>
