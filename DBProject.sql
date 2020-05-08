--Lois-Anne Hall April 24,2020, May 7,2020 - 620117954
--K-Cyanne Beckford April 24, 2020 - 620123796
--Dwight Muschette May 7,2020 - 620120113

drop table IF EXISTS groups;
drop table IF EXISTS moderator;
drop table IF EXISTS profile;
drop table IF EXISTS album;
drop table IF EXISTS picture;
drop table IF EXISTS posts;
drop table IF EXISTS friendgroup;
drop table IF EXISTS friend;
drop table IF EXISTS users;


create table users(
   userId varchar(15) not null unique,
   name varchar(15)	not null,
   dob DATE,
   primary key(userId)
);

create table groups(
   groupid 	varchar(15)	not null unique,
   moderatorID varchar(15)	not null,
   memberlist varchar(200)	not null,
   contenteditors varchar(50)	not null,
   primary key(groupid)
);

create table moderator(
   groupid 	varchar(15)	not null unique,
   moderatorID varchar(15)	not null,
   primary key(moderatorID),
   foreign key(groupid) references groups(groupid) on update cascade on delete cascade	
);

create table profile(
   userId 	varchar(15)	not null unique,
   profileid varchar(15) not null unique,
   primary key(profileid),
   foreign key(userId) references users(userId) on update cascade on delete cascade
);

create table album(
   albumid varchar(15) not null unique,
   profileid varchar(15) not null,
   primary key(albumid),
   foreign key(profileid) references profile(profileid) on update CASCADE on delete cascade	
);

create table posts(
   postid varchar(15) not null unique,
   content varchar(15) not null,
   viewers FLOAT not null,
   primary key(postid)	
);

create table picture(
   pictureid varchar(15) not null unique,
   postid varchar(15) not null,
   albumid varchar(15) not null,
   primary key(pictureid),
   foreign key(postid) references posts(postid) on update CASCADE on delete cascade,
   foreign key(albumid) references album(albumid) on update CASCADE on delete cascade	
);


create table friendgroup(
   fgroupid varchar(15) not null unique,
   friendlist varchar(200) not null,
   name varchar(50) not null unique,
   primary key(fgroupid)
);

create table friend(
   friendId varchar(15) not null unique,
   userId varchar(15) not null,
   name varchar(50) not null,
   primary key(friendId),
   foreign key(userId) references users(userId) on update CASCADE on delete cascade
);



/*

Tables:
groups(groupid,moderatorID,memberlist,contenteditors)
moderator(groupid,moderatorID)
profile(userId,profileid)
album(albumid,profileid)
posts(postid ,content,viewers)
picture(pictureid,postid,albumid)
friendgroup(fgroupid ,friendlist,name)
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

