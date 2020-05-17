$(document).ready(function(){

        
    function requestUsers(txtrequest = ""){             
        $.ajax("getUsers.php", {
            method: 'GET'             
            
        }).done(function(response){
            let parseHTML = response;
            $("#result").html(parseHTML);
            
        }).fail(function(){
            alert('There was an issue with the request.');
        });
    }

    function requestFriends(txtrequest = ""){             
        $.ajax("getFriends.php", {
            method: 'GET'             
            
        }).done(function(response){
            let parseHTML = response;
            $("#result").html(parseHTML);
            
        }).fail(function(){
            alert('There was an issue with the request.');
        });
    }

    
    $("#getUsers").click(function(){
        requestUsers();
        //requestMessage("cities");
    });

    $("#getFriends").click(function(){
        requestFriends();
        //requestMessage("cities");
    });
    


    

    
});