<?php
include('local.config.php');

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
	var_dump(http_response_code(403));
    die("Connection failed: " . $conn->connect_error);
} 

$iswckey = $_GET["key"];
$vote = $_GET["vote"];

$sql = "INSERT INTO ISWCVOTES (iswckey, vote)
VALUES ('$iswckey', '$vote')";

if ($conn->query($sql) === TRUE) {
    echo "Success";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
    var_dump(http_response_code(403));
}

$conn->close();

?>