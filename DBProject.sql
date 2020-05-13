/*
Lois-Anne Hall April 24,2020, May 7,2020, May 11,2020 - 620117954                                                                                                                                                                                                        --Lois-Anne Hall April 24,2020, May 7,2020, May 11,2020 - 620117954
K-Cyanne Beckford April 24, 2020, May 7,2020 - 620123796
Dwight Muschette May 7,2020 - 620120113
Kayvia Harriott May 7,2020 - 620118463 
Wayne Clarke May 7, 2020 - 620091440*/

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
   moderatorID integer	not null,
   primary key(groupid),
   foreign key (moderatorID) references users(userId) 
);

create table groupsmembers(
   groupid integer not null,
   userId integer,
   typemember varchar(6) not null,
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
   albumid integer not null unique,
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
   friendId integer not null unique,
   friendgroup varchar(80) not null,
   primary key(friendId),
   foreign key(userId) references users(userId) on update CASCADE on delete cascade
);

ALTER TABLE profile ADD CONSTRAINT FK_albumid FOREIGN KEY(albumid)
   REFERENCES album(albumid) on update CASCADE on delete cascade;

ALTER TABLE album ADD CONSTRAINT FK_picureid FOREIGN KEY(pictureid)
   REFERENCES picture(pictureid) on update CASCADE on delete cascade;




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
      SELECT groupname FROM groups grp /*someone editing here?*/
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

CALL showfriends(1);


