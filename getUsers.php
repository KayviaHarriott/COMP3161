<?php
	$dbServername = "localhost";
	$dbUsername = "root";
	$dbPassword = "";
	$dbName = "DBProjectt";
	
	$conn = mysqli_connect($dbServername,$dbUsername,$dbPassword,$dbName);

	if($conn === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
/* check connection */
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}


//$query2 = "SELECT author.name, comment.comment FROM author INNER JOIN comment ON author.author_id=comment.comment_id;";
$query2 = "SELECT * from users";

if ($result = $conn->query($query2)) {
    echo nl2br("\n");
    echo nl2br("\n");
    while ($row = $result->fetch_row()) {
        //echo $row[0], ": ";
        //echo nl2br("\n"); 
        echo $row[1] , " ";
        echo nl2br("\n");        
       // echo nl2br("\n"); 
    }

    /* free result set */
    $result->close();
}

    /* close connection */
    $conn->close();
    

?>