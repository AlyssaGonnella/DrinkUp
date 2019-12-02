<?php    
if (!isset($_REQUEST['username']))    
{    
  include 'form.html.php';    
} 
else 
  {    
  $username = $_REQUEST['username'];    
  $password = $_REQUEST['password'];    
  if ($username == 'admin' and $password == 'admin')    
  {    
    $output = 'Welcome, oh glorious leader!';
    include 'admin.html.php';    
  } 
  else 
    {    
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

    $query = "SELECT * FROM Users WHERE userID = '$username' AND password = '$password'";
    $result = mysqli_query($db,$query);
    while($row = mysqli_fetch_array($result)) {
        $success = true;
    }
    if($success == true)
      {
	session_start();
	$_SESSION['user'] = $username;
	$output = 'Welcome to DrinkUp. What would you like to do,  ' .    
        	htmlspecialchars($username, ENT_QUOTES, 'UTF-8') .
		'?' .
		"<br>" .
		'Your password is ' .    
        	htmlspecialchars($password, ENT_QUOTES, 'UTF-8') . '!';    
 		include 'welcome.html.php';		
      }
    else
      {
	$output = 'Not a valid username password combination.';
      	include 'output.html.php';
      	exit();
      }
    
    } 

}  
?>

