<%-- 
    Document   : test_seat
    Created on : 2013-4-25, 12:44:44
    Author     : nightwolf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include  file="include/Header.jsp" %>
<script type="text/javascript" src="dwr/engine.js"></script>
<script type="text/javascript" src="dwr/util.js"></script>

<script type="text/javascript" src="dwr/interface/DatabaseOperator.js"></script>

<script type="text/javascript">

    function refreshPage(data)
    {
        for (var key in data)
        {

            if (data[key] === "0") {
                document.getElementById(key).setAttribute("src","assets/img/free.jpg");
                document.getElementById(key).style.visibility = "visible";

            } else if(data[key]==="1") {
                document.getElementById(key).setAttribute("src","assets/img/boy.png");
                document.getElementById(key).style.visibility = "visible";

            }else if(data[key]==="2"){
                
                document.getElementById(key).setAttribute("src","assets/img/taken_1.jpg");
                document.getElementById(key).style.visibility = "visible";
                
            }
            curData = data;
        }

    }

    function update()
    {
        DatabaseOperator.getTestSeat(refreshPage);
    }
    var timerID = setInterval("update()", 500);

</script>
<div class="container">
    <div class="row">
        <div class="span6 offset3">
            <div  style="width: 200px;height: 50px" ><img id="1" src="assets/img/free.jpg" style="min-height: 50px;min-width: 50px;visibility: hidden" class="img-rounded"><img src="assets/img/girl.png" style="min-height: 50px;min-width: 50px;visibility: hidden" class="img-rounded"><img src="assets/img/girl.png" style="min-height: 50px;min-width: 50px;visibility: hidden" class="img-rounded"><img id="2" src="assets/img/free.jpg" style="min-height: 50px;min-width: 50px;visibility: hidden" class="img-rounded"></div>
        </div>
    </div>
    <div class="row">
        <div class="span6 offset3">
            <div ><img src="assets/img/desk.jpg" ></div>
        </div>
    </div>
    <div class="row">
        <div class="span6 offset3">
            <div  style="width: 200px;height: 50px" ><img id="3" src="assets/img/free.jpg" style="min-height: 50px;min-width: 50px;visibility: hidden" class="img-rounded"><img src="assets/img/girl.png" style="min-height: 50px;min-width: 50px;visibility: hidden" class="img-rounded"><img src="assets/img/girl.png" style="min-height: 50px;min-width: 50px;visibility: hidden" class="img-rounded"><img id="4" src="assets/img/girl.jpg" style="min-height: 50px;min-width: 50px;visibility: hidden" class="img-rounded"></div>
        </div>
    </div>

</div>
<%@include  file="include/Footer.jsp" %>

