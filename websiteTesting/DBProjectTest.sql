DROP DATABASE IF EXISTS DBProjectTest;
CREATE DATABASE DBProjectTest;
USE DBProjectTest;

DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS author;

CREATE TABLE author(
  author_id integer,
  name varchar(100),
  PRIMARY KEY(author_id)
);

CREATE TABLE comment(
  comment_id integer,
  comment varchar(300),
  PRIMARY KEY (comment_id) 
);


INSERT INTO author VALUES (1,"Barby Henry");
INSERT INTO author VALUES (2,"Jim Corry");
INSERT INTO author VALUES (3,"Joshua Harries");
INSERT INTO author VALUES (4,"Barby Henry");
INSERT INTO author VALUES (5,"Joshua Harries");
INSERT INTO author VALUES (6,"Joshua Harries");
INSERT INTO author VALUES (7,"Barby Henry");
INSERT INTO author VALUES (8,"Barby Henry");
INSERT INTO author VALUES (9,"Joshua Harries");
INSERT INTO author VALUES (10,"Joshua Harries");

INSERT INTO comment VALUES (1,"Wow, this is so cool!");
INSERT INTO comment VALUES (2,"I love this post!");
INSERT INTO comment VALUES (3,"Wow, this is so cool!");
INSERT INTO comment VALUES (4,"Wow, this is so cool!");
INSERT INTO comment VALUES (5,"This looks great!");
INSERT INTO comment VALUES (6,"Wow, this is so cool!");
INSERT INTO comment VALUES (7,"This looks great!");
INSERT INTO comment VALUES (8,"I love this post!");
INSERT INTO comment VALUES (9,"I love this post!");
INSERT INTO comment VALUES (10,"This looks great!");


/*********************************************/

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
   friendId integer not null,
   friendgroup varchar(80) not null,
   primary key(friendId),
   foreign key(userId) references users(userId) on update CASCADE on delete cascade
);

ALTER TABLE profile ADD CONSTRAINT FK_albumid FOREIGN KEY(albumid)
   REFERENCES album(albumid) on update CASCADE on delete cascade;

ALTER TABLE album ADD CONSTRAINT FK_picureid FOREIGN KEY(pictureid)
   REFERENCES picture(pictureid) on update CASCADE on delete cascade;Insert into users VALUES (1,"Gergy Herry","F","1999-09-25");




Insert into users VALUES (1,"Gergy Herry","F","1999-09-25");
Insert into users VALUES (2,"Harry Styles","M","1999-09-25");
Insert into users VALUES (3,"Maia Watson","M","1999-09-25");
Insert into users VALUES (4,"Andrienne McConell","M","1999-09-25");
Insert into users VALUES (5,"Gergy Herry","F","1999-09-25");
Insert into users VALUES (6,"Niall Horan","F","1999-09-25");
Insert into users VALUES (7,"Gergy Herry","F","1999-09-25");
Insert into users VALUES (8,"Dr Seuss","F","1999-09-25");
Insert into users VALUES (9,"Harry Styles","F","1999-09-25");
Insert into users VALUES (10,"Mary Beth","M","1999-09-25");
Insert into friend VALUES (1,9,"Work");
Insert into friend VALUES (9,1,"Work");
Insert into friend VALUES (2,2,"Relative");
Insert into friend VALUES (2,2,"Relative");
Insert into friend VALUES (3,1,"Relative");
Insert into friend VALUES (1,3,"Relative");
Insert into friend VALUES (4,4,"School");
Insert into friend VALUES (4,4,"School");
Insert into friend VALUES (5,9,"Work");
Insert into friend VALUES (9,5,"Work");
Insert into friend VALUES (6,8,"School");
Insert into friend VALUES (8,6,"School");
Insert into friend VALUES (7,3,"Relative");
Insert into friend VALUES (3,7,"Relative");
Insert into friend VALUES (8,5,"School");
Insert into friend VALUES (5,8,"School");
Insert into friend VALUES (9,2,"Work");
Insert into friend VALUES (2,9,"Work");
Insert into friend VALUES (10,2,"Work");
Insert into friend VALUES (2,10,"Work");
Insert into groups VALUES (1,"Anime Watching","2020-05-12",9);
Insert into groups VALUES (2,"Anime Watching","2020-05-12",3);
Insert into groups VALUES (3,"Anime Watching","2020-05-12",5);
Insert into groups VALUES (4,"TV Watchers","2020-05-12",8);
Insert into groups VALUES (5,"TV Watchers","2020-05-12",9);
Insert into groups VALUES (6,"Anime Watching","2020-05-12",5);
Insert into groups VALUES (7,"Biking Clubs","2020-05-12",1);
Insert into groups VALUES (8,"Biking Clubs","2020-05-12",3);
Insert into groups VALUES (9,"Biking Clubs","2020-05-12",4);
Insert into groups VALUES (10,"Biking Clubs","2020-05-12",10);
Insert into groupsmembers VALUES (1,5,"Content Editor");
Insert into groupsmembers VALUES (2,4,"Content Editor");
Insert into groupsmembers VALUES (3,7,"Content Editor");
Insert into groupsmembers VALUES (4,10,"Content Editor");
Insert into groupsmembers VALUES (5,10,"Viewer");
Insert into groupsmembers VALUES (6,6,"Viewer");
Insert into groupsmembers VALUES (7,5,"Content Editor");
Insert into groupsmembers VALUES (8,3,"Content Editor");
Insert into groupsmembers VALUES (9,10,"Viewer");
Insert into groupsmembers VALUES (10,10,"Viewer");
