<?php session_start(); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>Party Created</title>
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
    $startDID = $_REQUEST['startDrinkID'];
    $query = "SELECT drinkID FROM IngredientOf WHERE Name IN(SELECT name FROM IngredientOf WHERE drinkID = '$startDID') AND drinkID <> '$startDID' ORDER BY RAND() LIMIT 5";
    if(!$result = mysqli_query($db,$query))
	{
	$output = 'Unable to Generate First Drink List';
	include 'output.html.php';
	exit();
	}
    else
	{
	while( $row = mysqli_fetch_array($result) )
	       {
		echo "<b>Drink ID:</b> " . $row["drinkID"] . "<br>";
	       }
	}
    $output = "Flight Generated. DrinkUp!";
    include 'output.html.php';
?>
	
    </p>
    <p>
    <form action="welcome.html.php" method="post">
    <div><input type="submit" value="RETURN HOME"/></div>		  
  </body> 		  
</html>			  