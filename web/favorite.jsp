<%-- 
    Document   : favorite
    Created on : 2013-4-10, 16:27:01
    Author     : nightwolf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="include/Header.jsp"%>

    <!-- Button to trigger modal -->
<a href="#myModal" role="button" class="btn" data-toggle="modal">查看演示案例</a>
 

<!-- Modal -->
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Modal header</h3>
  </div>
  <div class="modal-body">
    <p>One fine body…</p>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
    <button class="btn btn-primary">Save changes</button>
    <button class="btn btn-primary">Save changes</button>
    <button class="btn btn-primary">Save changes</button>
  </div>
</div>



<%@include file="include/Footer.jsp"%>