<!DOCTYPE html>
<html>
	<head>
        <meta charset="utf-8">
		<title>My Book | Home</title>	
		
		<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
		<link href="styles/styles4.css" type="text/css" rel="stylesheet" /> 
        <script src="javascript.js" type="text/javascript"></script>
    </head>
    <body>
    <div class="gridcontainer">
            <div class="topbar">
                <div class="header">
                    <a onclick="history.back()"><span  class="logoHeaderMy">My</span><span class="logoHeaderBook">Book</span>
                    <span class="logoAdmin"><i>-admin</i></span></a>
                </div>
            </div>
            <div class="content">
                <br><br><br><br>
                
                <div id="result">
            <!-- result appears here -->
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
                $findName = $_GET["name"];
                $var = 1;

                $query2 = "SELECT * FROM users WHERE name LIKE '%$findName%'";

                /*
                Welcome <?php echo $_GET["name"]; ?><br>
                Your email address is: <?php echo $_GET["email"]; ?> */

                if ($result = $conn->query($query2)) {
                    
                    

                    echo nl2br("\n");
                    echo nl2br("\n");
                    while ($row = $result->fetch_row()) {
                        echo $row[1], " ", $row[2], " ", $row[3];
                        
                        echo nl2br("\n");  
                        echo nl2br("\n");        
                        $result;
                        
                    // echo nl2br("\n"); 
                    }

                    /* free result set */
                    $result->close();
                }/*else {
                    echo "There is no user with that name";
                }



                    /* close connection */
                    $conn->close();
                    

                ?>
            </div>            
            <br><br><br><br>
            <div class="exinfo">
                <a id="return" onclick="history.back()" class="button">Return</a>
            </div>
           </div> 
        </body>
    
        
        
    <script>
        function getUsers(txtrequest = ""){             
        $.ajax("getUsers.php", {
            method: 'GET'             
            
        }).done(function(response){
            let parseHTML = response;
            $("#result").html(parseHTML);
            
        }).fail(function(){
            alert('There was an issue with the request.');
        });
    }
    
    $("#getUsers").click(function(){
        getUsers();
        //requestMessage("cities");
    });

    $("#viewAll").click(function(){
        getUsers();
    });

    </script>    
</html>
