<?php
error_reporting(0);
$is_show_error = false;

include('local.config.php');

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
	http_response_code(403);
    die("Connection failed: " . $conn->connect_error);
} 

$iswckey = isset($_POST["key"])?$_POST["key"]:$_GET["key"];
//$vote = $_GET["vote"];
$vote = isset($_POST["vote"])?$_POST["vote"]:$_GET["vote"];

//$iswctype = $_GET["type"];
$iswctype = strtolower(explode("_", $vote)[0]);

echo $iswctype;


$sql = "INSERT INTO ISWCVOTES (iswckey, iswctype, votefor)
VALUES ('$iswckey', '$iswctype' , '$vote')";

if ($conn->query($sql) === TRUE) {
    echo "Success";
} else {
    if ($is_show_error) echo "Error: " . $sql . "<br>" . $conn->error; else echo "Fail" ;
    http_response_code(403);
}

$conn->close();

?>