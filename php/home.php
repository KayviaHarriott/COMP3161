				
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
		$findName = $_GET["username"];
		$var = 1;
		echo "Welcome, ", $findName,"!";
		
		$conn->close();           
?> 
                    
					
	</body>
	<script>
		function getUsername(txtrequest = ""){             
        $.ajax("home2.php", {
            method: 'GET'             
            
        }).done(function(response){
            let parseHTML = response;
            $("#result").html(parseHTML);
            
        }).fail(function(){
            alert('There was an issue with the request.');
        });
        }
	</script>
	
</html>
