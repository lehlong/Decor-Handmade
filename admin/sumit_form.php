<?php
$link=$_REQUEST['success'];
$link1=$_REQUEST['success1'];
?>
<html>
<head>
<script>
function myfunction()
{
	document.getElementById("success").click();
	document.getElementById("success1").click();
}
</script>
</head>
<body onLoad="myfunction()">
<form action="productlist.php" method="post" id="myform">
	<input hidden="" type="text" name="success" value="<?php echo"$link";?>">
    <button hidden="" type="submit" id="success" data-modal="success" name="success" value="success"></button>
</form>
<form action="export.php" method="post" id="myform">
	<input hidden="" type="text" name="success1" value="<?php echo"$link";?>">
    <button hidden="" type="submit" id="success1" data-modal="success1" name="success1" value="success1"></button>
</form>

<h1 style="padding-left:400px; padding-top:200px;"><img src="../images/loading-x.gif" /></h1>
</body>
</html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Hihi</title>
</head>

<body>
</body>
</html>