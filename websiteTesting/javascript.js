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

    function requestComments(txtrequest = ""){             
        $.ajax("comment.php", {
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

    $("#lookup-comments").click(function(){
        requestComments();
        //requestMessage("cities");
    });
    


    

    
});