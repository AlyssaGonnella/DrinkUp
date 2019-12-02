<?php session_start(); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>Ingredient Added</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
  </head> 
  <body> 
    <p><?php 
    $user = $_SESSION['user'];
    $db = mysqli_connect('localhost','root',LemonDemon);
    if(!$db)
	{
	$output = 'Unable to connect to the database';
	include 'output.html.php';
	exit();
	}
    if (!mysqli_set_charset($db, 'utf8'))
       {
       $output = 'Unable to set database connection encoding.';
       include 'output.html.php';
       exit();
       }

    if (!mysqli_select_db($db, 'DrinkUp')) 
       {
       $output = 'Unable to locate the database.';
       include 'output.html.php';
       exit();
       }
    $name = $_REQUEST['name'];
    $query = "INSERT INTO InPantry(userID,name) VALUES('$user','$name')";
    if(!mysqli_query($db,$query))
	{
	$output = 'Unable to insert ingredient into InPantry table';
	include 'output.html.php';
	exit();
	}    
    $output = "Target acquired.";
    include 'output.html.php';
?>

</p>
<p>
    <form action="welcome.html.php" method="post">
    <div><input type="submit" value="RETURN HOME"/></div>		  
  </body> 		  
</html>			  
