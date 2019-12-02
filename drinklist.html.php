<?php session_start(); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>My Parties</title>
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
    
    //$query = "SELECT name, partyDate, location, partyID FROM Party, Attending WHERE '$user' = Attending.userID AND Attending.partyID = Party.partyID";
    $query = "SELECT * FROM Drink";
    //$query = "SELECT name, partyDate, location, partyID FROM Party WHERE partyID IN (SELECT partyID FROM Attending WHERE ‘$user’ = userID)";
    if (!$result = mysqli_query($db,$query))
	  {
	  $output = 'No Drinks :(';
	  include 'output.html.php';
	  }
    else
	  {
	  while( $row = mysqli_fetch_array($result) )
            {
              echo "<b>Drink Name:</b> " . $row["name"] . " <b>Drink ID:</b> " . $row["drinkID"] . " <b>Recipe:</b> " . $row["instructions"] . "<br>";
            }
	  }
    
?>
    <p><b>To Like A Drink, Type Its Drink ID Here:</b></p>
    <form action="likedrink.html.php" method="post">
    <div><label for="drinkID">Drink ID:
	<input type="text" name="drinkID" id=:"drinkID"/></label>
    </div>
    <div><input type="submit" value="LIKE DRINK"/></div>
    </form>
    <form action="welcome.html.php" method="post">
      <div><input type="submit" value="RETURN HOME"/></div>
    </form>
  </body>
</html>
