<!DOCTYPE html>
<html>

<body>
<h1>GET</h1>
<?php
echo ("You passed in " . sizeof($_GET) . " parameters<br/>");
echo("In your GET params, the value of parameter <B>greeting</b> is ". $_GET['greeting']);
?>
<h1>POST</h1>
<?php
echo ("You passed in " . sizeof($_POST) . " parameters<br/>");
echo("In your POST params, the value of parameter <B>greeting</b> is ". $_POST['greeting']);
?>

</body>
</html>
