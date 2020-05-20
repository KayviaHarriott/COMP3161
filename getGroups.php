<?php
	$dbServername = "localhost";
	$dbUsername = "root";
	$dbPassword = "";
	$dbName = "DBProject";
	
	$conn = mysqli_connect($dbServername,$dbUsername,$dbPassword,$dbName);

	if($conn === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
/* check connection */
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}


/*$query2 = "CALL getUser(1);";*/
$query2 = "SELECT * FROM groupsmembers;";
$result = "";



if ($result = $conn->query($query2)) {
    echo "<table border='0' cellspacing=15 cellpadding=2>
            <tr>

            <th>Group ID</th>

            <th>Group Member ID</th>

            <th>Role</th>

            </tr>";
    while ($row = $result->fetch_row()) {
        
        echo "<tr>";

        echo "<td>" . $row[0] . "</td>";
      
        echo "<td>" . $row[1] . "</td>";
      
        echo "<td>" . $row[2] . "</td>";
      
        echo "</tr>";


        $result;
        
       // echo nl2br("\n"); 
    }

    /* free result set */
    $result->close();
}



    /* close connection */
    $conn->close();
    

?>