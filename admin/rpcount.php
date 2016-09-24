<style>
	table{
		width: 600px;
		border-spacing: 0;
		border-collapse: collapse;
	}

	th{
		text-align: left;
	}

	td{
		border:#555 solid 1px;
	}
</style>

<?php

//error_reporting(0);
//$is_show_error = false;

include('../local.config.php');

if($_GET["key"]==$adminkey){

	$conn = new mysqli($servername, $username, $password, $dbname);

	// Check connection
	if ($conn->connect_error) {
		http_response_code(403);
	    die("Connection failed: " . $conn->connect_error);
	} 

	$sql = "SELECT type, votefor, score FROM ISWCVOTE_SCORES";


	$result = $conn->query($sql);

	echo "<h1>Count</h1>";

	echo "<table>";
	echo "	<thead><tr><th>Type</th><th>ID</th><th>Score</th></tr></thead>";
	echo "	<tbody>";

	if($result->num_rows > 0){
		while($row = $result->fetch_assoc()){
			echo "<tr>";
			echo "	<td>".$row["type"]."</td>";
			echo "	<td>".$row["votefor"]."</td>";
			echo "	<td>".$row["score"]."</td>";
			echo "</tr>";
		}
	}

	echo "	</tbody>";
	echo "</table>";

	$conn->close();

}else{
	echo "<h1>403</h1>";
	http_response_code(403);
}


?>