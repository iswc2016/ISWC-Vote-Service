<style>
	div.box{
		display:inline-block;
		width:100px;
		margin:5px;
		padding:5px;
		border:#aaa solid 1px;
	}

	div.input{
		display:inline-block;
		margin:10px;
		padding:0 20px;
		border:#aaa solid 1px;
		background-color: #efefef;
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
?>

<h1>Keys</h1>

<div class='input'>
	<h2>To Add Keys</h2>
	<form action="votekeys.php?add=1&key=<?php echo $_GET["key"]; ?>" method="post">
		<textarea name="keys" rows="15" cols="100"></textarea>
		<br/>
		<input type="submit"/>
	</form>

<?php

	if(isset($_GET["add"]) && $_GET["add"]=="1"){
		$keystring = trim($_POST["keys"]);

		if(strlen($keystring)>2){
			$iswckeys = preg_split('/\r\n|[\r\n]/', $keystring);

			foreach($iswckeys as $iswckey){
				$iswckey = trim($iswckey);
				if(strlen($iswckey)>2){
					$sql = "INSERT INTO ISWCKEYS (iswckey) VALUES ('$iswckey')";
					$conn->query($sql);
				}
			}
		}
	}

?>


</div>


<!-- ############################################### -->

<h2>Existing Keys</h2>

<?php

	$sql = "SELECT iswckey FROM ISWCKEYS";


	$result = $conn->query($sql);

	echo "<div class='container'>";
	

	if($result->num_rows > 0){
		while($row = $result->fetch_assoc()){
			echo "<div class='box'>".$row["iswckey"]."</div>";
		}
	}

	echo "</div>";

	$conn->close();

}else{
	echo "<h1>403</h1>";
	http_response_code(403);
}


?>