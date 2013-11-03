<%-- 
    Document   : lib
    Created on : 2013-4-23, 19:53:12
    Author     : nightwolf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="include/Header.jsp"%>
        
<div class="container">
    <div id="myCarousel" class="carousel slide">
                <ol class="carousel-indicators">
                  <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                  <li data-target="#myCarousel" data-slide-to="1" class=""></li>
                  <li data-target="#myCarousel" data-slide-to="2" class=""></li>
                </ol>
                <div class="carousel-inner">
                  <div class="item active">
                      <a href="index.jsp"> <img src="assets/img/map.jpg" alt=""></a>
                    <div class="carousel-caption">
               
                      <p>图书馆一楼地图</p>
                    </div>
                  </div>
                  <div class="item">
                      <a href="index.jsp">  <img src="assets/img/map1.jpg" alt=""></a>
                    <div class="carousel-caption">
                      <p>图书馆正门</p>
                    </div>
                  </div>
                  <div class="item">
                      <a href="index.jsp"> <img src="assets/img/map2.jpg" alt=""></a>
                    <div class="carousel-caption">
                       <p>图书馆一楼地图</p>
                    </div>
                  </div>
                </div>
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a>
              </div>
</div> <!--end of container-->
<%@include file="include/Footer.jsp"%>