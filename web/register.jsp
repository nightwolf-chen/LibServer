<!DOCTYPE html> 
<html lang="en"> 
<head> 
<meta charset="utf-8"> 
<title>Twitter Bootstrap Popover with placement option Example</title> 
<meta name="description" content="Creating Modal Window with Twitter Bootstrap">
<link href="assets/css/bootstrap.css" rel="stylesheet"> 
<style>
a {
margin-left : 400px;
}
</style>
</head>
<body>
<div class="container">
<h2>Example of creating Popover with Twitter Bootstrap with placement option</h2>
<div class="well">
<a href="#" id="example" class="btn btn-success" rel="popover" data-content="It's so simple to create a tooltip for my website!" data-original-title="Twitter Bootstrap Popover">hover for popover</a>
</div>
<div class="well">
<a href="#" id="example_left" class="btn btn-success" rel="popover" data-content="It's so simple to create a tooltop for my website!" data-original-title="Twitter Bootstrap Popover">hover for popover</a>
</div>
<div class="well">
<a href="#" id="example_top" class="btn btn-success" rel="popover" data-content="It's so simple to create a tooltop for my website!" data-original-title="Twitter Bootstrap Popover">hover for popover</a>
</div>
<div class="well">
<a href="#" id="example_bottom" class="btn btn-success" rel="popover" data-content="It's so simple to create a tooltop for my website!" data-original-title="Twitter Bootstrap Popover">hover for popover</a>
</div>
</div>
<script src="assets/js/jquery.js"></script>
<script src="assets/js/bootstrap.js"></script>
<script>
$(function ()
{ $("#example").popover();
  $("#example_left").popover({placement:'left'});
  $("#example_top").popover({placement:'top'});
  $("#example_bottom").popover({placement:'bottom'});
});
</script>
</body>
</html>