/*
Lois-Anne Hall April 24,2020, May 7,2020, May 11,2020 - 620117954                                                                                                                                                                                                        --Lois-Anne Hall April 24,2020, May 7,2020, May 11,2020 - 620117954
K-Cyanne Beckford April 24, 2020, May 7,2020 - 620123796
Dwight Muschette May 7,2020 - 620120113
Kayvia Harriott May 7,2020 - 620118463 
Wayne Clarke May 7, 2020 - 620091440*/

DROP DATABASE IF EXISTS DBProject; /*Added by Kay - 05/15/2020 -- START*/
CREATE DATABASE DBProject;
USE DBProject;                      /*Added by Kay - 05/15/2020 -- END*/

drop table IF EXISTS groups;
drop table If EXISTS groupsmembers;
drop table IF EXISTS moderator;
drop table IF EXISTS profile;
drop table IF EXISTS album;
drop table IF EXISTS picture;
drop table IF EXISTS posts;
drop table IF EXISTS friend;
drop table IF EXISTS users;
 

create table users(
   /*
   can add a friend  
   creates posts : make sure posts has a foreign key of the user id
   modifies profile
   creates a user*/
   userId integer not null unique,
   name varchar(100)	not null,
   gender VARCHAR(1) not null,
   dob DATE,
   primary key(userId)
); 

create table groups(
   groupid 	integer	not null unique,
   groupname VARCHAR(100) not null,
   datecreated date not null,
   /*moderatorID*/userId integer	not null, /*Edit: Kayvia 05/16/2020*/
   primary key(groupid)/*,
   foreign key (moderatorIDuserId) references users(userId) *//*Edit: Kayvia 05/16/2020*/
);

create table groupsmembers(
   groupid integer not null,
   userId integer,
   typemember varchar(50) not null, 
   primary key(groupid,userid),
   foreign key (userId) references users(userId) on delete cascade, 
   foreign key (groupid) references groups(groupid) on delete cascade 
);


create table profile(
   /*
   modifies a user
   has an album   
   */    
   profileid integer not null unique,
   albumid integer not null /*unique*/,
   primary key(profileid)
);

create table profiles( 
   /* 
   relationship linking a user to a profile
   */
   userID integer not null,
   profileid integer not NULL,
   foreign key(userID) references users(userID) on update cascade on delete CASCADE,
   foreign key(profileid) references profile(profileid) on update cascade on delete cascade
);

create table album(
   /*  has a picture */

   albumid integer not null unique,
   pictureid integer not null,
   primary key(albumid)   
);

create table posts(
   postid integer not null unique,
   posttype varchar(50) not null, 
   userId integer not null,
   primary key(postid),
   foreign key(userId) references users(userId) on update cascade on delete cascade

);

create table picture(
   pictureid integer not null unique,
   albumid integer not null,
   primary key(albumid, pictureid),   
   foreign key(albumid) references album(albumid) on update CASCADE on delete cascade	
);



create table friend(
   userId integer not null,
   friendId integer not null /*unique*/, /*Edit: Kayvia 05/16/2020*/
   friendgroup varchar(80) not null,
   primary key/*(friendId)*/(userId), /*Edit: Kayvia 05/16/2020*/
   foreign key(userId) references users(userId) on update CASCADE on delete cascade
);


/*Edit: Kayvia 05/16/2020* --These give errors for some reason/
/*
ALTER TABLE profile ADD CONSTRAINT FK_albumid FOREIGN KEY(albumid)
   REFERENCES album(albumid) on update CASCADE on delete cascade; 


ALTER TABLE album ADD CONSTRAINT FK_picureid FOREIGN KEY(pictureid)
   REFERENCES picture(pictureid) on update CASCADE on delete cascade;*/




/*############################################ 
Up to this section has been ran so far */



/*

Tables:
group(groupid,moderatorID,memberlist,contenteditors)
moderator(groupid,moderatorID)
profile(userId,profileid)
album(albumid,profileid)
posts(postid ,content,viewers)
picture(pictureid,postid,albumid)
friend(userId,friendId,name)
users(userId,name,dob)



Assumptions:
-	A user can only have one profile and each user has to have a profile.
-	A profile can only be created by a user.
-	An album can contain many pictures, but multiple copies of one picture can be in other albums
-	One picture can be designated as a profile picture.
-	Multiple posts can be created by a user
-	The user can create multiple groups and designate a moderator for the created groups.
-	Group posts are only created by a moderator.
-	A user can designate another user as a friend, in one of three specific categories.

*/


/* STORED PROCEDURES */

/*
DELIMITER //
 CREATE PROCEDURE findEmployees(IN company varchar(20))
 BEGIN
 SELECT person_name FROM works WHERE company_name=company;
 END //
DELIMITER ;


DELIMITER // 
   CREATE PROCEDURE finduser(in user_id integer) 
   BEGIN
      SELECT * FROM users
      WHERE userid = user_id;
    END //
DELIMITER ;

CALL finduser(1);

DELIMITER // 
   CREATE PROCEDURE findgroups (In id integer) 
   BEGIN
      SELECT groupname FROM groups grp
      JOIN groupsmembers grpmem ON grp.groupid = grpmem.groupid
      WHERE grpmem.userid = id;
    END//
DELIMITER ;

CALL findgroups(2);

DELIMITER // 
   CREATE PROCEDURE findpost (In id integer) 
   BEGIN
      SELECT postid,posttype FROM post pt 
      WHERE pt.userid = id;
    END//
DELIMITER ;

CALL findposts(2);

DELIMITER // 
   CREATE PROCEDURE showfriends (In id integer) 
   BEGIN
      SELECT name,gender,dob FROM user us
      JOIN friend frnd ON frnd.friendId = us.userId
      WHERE frnd.friendId = id;
    END//
DELIMITER ;

CALL showfriends(1); */



Insert into users VALUES (1,"Katrina Warren","F","1998-12-30");
Insert into users VALUES (2,"Tyler Bryant","F","1998-11-03");
Insert into users VALUES (3,"David Thomas","F","2019-09-11");
Insert into users VALUES (4,"Lee Harrison","M","2006-11-29");
Insert into users VALUES (5,"Robert Conley","F","1988-10-19");
Insert into users VALUES (6,"Terry Chambers","M","2014-04-20");
Insert into users VALUES (7,"Jasmine Martinez","M","1989-06-12");
Insert into users VALUES (8,"Matthew Grimes","F","1971-01-21");
Insert into users VALUES (9,"Russell Mcpherson","M","1998-02-20");
Insert into users VALUES (10,"Jennifer Castillo","F","1979-07-02");

Insert into friend VALUES (1,5,"School");
Insert into friend VALUES (2,8,"Work");
Insert into friend VALUES (3,2,"Work");
Insert into friend VALUES (4,2,"Work");
Insert into friend VALUES (5,6,"School");
Insert into friend VALUES (6,1,"Relative");
Insert into friend VALUES (7,5,"School");
Insert into friend VALUES (8,1,"Relative");
Insert into friend VALUES (9,7,"School");
Insert into friend VALUES (10,1,"Relative");

Insert into groups VALUES (1,"Biking Clubs","2020-05-12",494239);
Insert into groups VALUES (2,"Biking Clubs","2020-05-12",5689);
Insert into groups VALUES (3,"Biking Clubs","2020-05-12",258456);
Insert into groups VALUES (4,"Biking Clubs","2020-05-12",54239);
Insert into groups VALUES (5,"TV Watchers","2020-05-12",59665);
Insert into groups VALUES (6,"TV Watchers","2020-05-12",482844);
Insert into groups VALUES (7,"Anime Watching","2020-05-12",452833);
Insert into groups VALUES (8,"Biking Clubs","2020-05-12",24732);
Insert into groups VALUES (9,"Anime Watching","2020-05-12",257312);
Insert into groups VALUES (10,"Anime Watching","2020-05-12",110234);

Insert into groupsmembers VALUES (1,4,"Viewer");
Insert into groupsmembers VALUES (2,1,"Content Editor");
Insert into groupsmembers VALUES (3,7,"Content Editor");
Insert into groupsmembers VALUES (4,3,"Content Editor");
Insert into groupsmembers VALUES (5,7,"Viewer");
Insert into groupsmembers VALUES (6,5,"Content Editor");
Insert into groupsmembers VALUES (7,2,"Content Editor");
Insert into groupsmembers VALUES (8,2,"Content Editor");
Insert into groupsmembers VALUES (9,8,"Viewer");
Insert into groupsmembers VALUES (10,9,"Viewer");

Insert into profile VALUES (1,3);
Insert into profile VALUES (2,3);
Insert into profile VALUES (3,2);
Insert into profile VALUES (4,3);
Insert into profile VALUES (5,9);
Insert into profile VALUES (6,9);
Insert into profile VALUES (7,7);
Insert into profile VALUES (8,6);
Insert into profile VALUES (9,1);
Insert into profile VALUES (10,2);

Insert into profiles VALUES (1,4);
Insert into profiles VALUES (2,7);
Insert into profiles VALUES (3,10);
Insert into profiles VALUES (4,3);
Insert into profiles VALUES (5,7);
Insert into profiles VALUES (6,3);
Insert into profiles VALUES (7,6);
Insert into profiles VALUES (8,3);
Insert into profiles VALUES (9,2);
Insert into profiles VALUES (10,1);

Insert into album VALUES (1,2);
Insert into album VALUES (2,2);
Insert into album VALUES (3,2);
Insert into album VALUES (4,2);
Insert into album VALUES (5,2);
Insert into album VALUES (6,2);
Insert into album VALUES (7,2);
Insert into album VALUES (8,2);
Insert into album VALUES (9,2);
Insert into album VALUES (10,2);

Insert into posts VALUES (1,"image",1);
Insert into posts VALUES (2,"text",2);
Insert into posts VALUES (3,"image",3);
Insert into posts VALUES (4,"text",4);
Insert into posts VALUES (5,"image",5);
Insert into posts VALUES (6,"image",6);
Insert into posts VALUES (7,"image",7);
Insert into posts VALUES (8,"text",8);
Insert into posts VALUES (9,"text",9);
Insert into posts VALUES (10,"image",10);

Insert into picture VALUES (1,1);
Insert into picture VALUES (2,6);
Insert into picture VALUES (3,10);
Insert into picture VALUES (4,8);
Insert into picture VALUES (5,1);
Insert into picture VALUES (6,5);
Insert into picture VALUES (7,8);
Insert into picture VALUES (8,6);
Insert into picture VALUES (9,2);
Insert into picture VALUES (10,5);

DELIMITER // 
   CREATE PROCEDURE getUser (In id integer) 
   BEGIN
      SELECT name from users WHERE userid = id;
   END//
DELIMITER ;

DELIMITER // 
   CREATE PROCEDURE getUserFriends (In id integer) 
   BEGIN   
      SELECT users.name, users.gender
      FROM users
      INNER JOIN friend
      ON users.userid=friend.userid
      WHERE friend.friendid = id;
   END//
DELIMITER ;

DELIMITER // 
   CREATE PROCEDURE findpost (In id integer) 
   BEGIN
      SELECT postid,posttype FROM posts 
      WHERE posts.userid = id;
    END//
DELIMITER ;


/*
CALL getUser(1);
CALL getUserFriends(1);
CALL findpost(1); */




