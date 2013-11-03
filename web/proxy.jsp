<%-- 
    Document   : proxy
    Created on : 2013-4-24, 20:49:37
    Author     : nightwolf
--%>

<%
    String username=(String)session.getAttribute("username") ;
    
    if(username==null){
        response.sendRedirect("loginPlus.jsp");
    }else{
        
        //out.println(request.getHeader("referer")) ;
        response.sendRedirect(request.getHeader("referer"));
        //response.sendRedirect("index.jsp");
    }
%>
