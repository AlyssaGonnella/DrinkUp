<?php
$user = $_REQUEST['username'];
$pass = $_REQUEST['password'];

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

if (!mysqli_select_db($db, 'DrinkUp')) {
  $output = 'Unable to locate the database.';
  include 'output.html.php';
  exit();
}

$query = "INSERT INTO Users(userID,password) VALUES('$user','$pass')";
if (!mysqli_query($db, $query)) 
   {
   $output = 'Unable to insert user into user table.';
   include 'output.html.php';
   exit();
   }

$output = "User $user successfully created with given password.";
include 'output.html.php';
?>