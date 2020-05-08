--Lois-Anne Hall April 24,2020, May 7,2020 - 620117954
--K-Cyanne Beckford April 24, 2020 - 620123796
--Dwight Muschette May 7,2020 - 620120113
--Kayvia Harriott May 7,2020 - 620118463

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
   --can add a friend  
   -- creates posts : make sure posts has a foreign key of the user id
   -- modifies profile
   -- creates a user

   userId varchar(15) not null unique,
   name varchar(15)	not null,
   dob DATE,
   primary key(userId)
); 

create table group(
   --appoints users to a friend group
   --       We also need do do some corrections so that it makes more sense generally
   --group posts are apart of a group
   -- could we add a has a relationship here that says group has group post?

   groupid 	varchar(15)	not null unique,
   moderatorID varchar(15)	not null,
   memberlist varchar(200)	not null,
   contenteditors varchar(50)	not null,
   primary key(groupid)
);

create table moderator(
   -- moderates a group 
   --creates group posts
   --manages group members
   --is a moderator a user?
   --once a user has a moderator id do they keep the same id in all groups?

   groupid 	varchar(15)	not null unique,
   moderatorID varchar(15)	not null,
   primary key(moderatorID),
   foreign key(groupid) references groups(groupid) on update cascade on delete cascade	
);

create table profile(
   --modifies a user
   --has an album

   userId 	varchar(15)	not null unique,
   profileid varchar(15) not null unique,
   primary key(profileid),
   foreign key(userId) references users(userId) on update cascade on delete cascade
);

create table album(
   -- has a picture

   albumid varchar(15) not null unique,
   profileid varchar(15) not null,
   primary key(albumid),
   foreign key(profileid) references profile(profileid) on update CASCADE on delete cascade	
);

create table posts(
   --can include pictures
   --creates a user     ???

   postid varchar(15) not null unique,
   content varchar(15) not null,
   viewers FLOAT not null,
   primary key(postid)	

);

create table picture(
   --cant exist without a user
   --can become a profile picture
   --in an album
   -- can become a profile picture (profile pictures cant exist without a picture in the album)

   pictureid varchar(15) not null unique,
   postid varchar(15) not null,
   albumid varchar(15) not null,
   primary key(pictureid),
   foreign key(postid) references posts(postid) on update CASCADE on delete cascade,
   foreign key(albumid) references album(albumid) on update CASCADE on delete cascade	
);


create table friendgroup(
   -- is a : relative, work, school    ???
   --is this trying to say that a friend group has a category? and a category falls under either relative work or school?

   fgroupid varchar(15) not null unique,
   friendlist varchar(200) not null,
   name varchar(50) not null unique,
   primary key(fgroupid)
);

create table friend(
   -- is apart of a friendgroup
   -- could we add an is a relationship here saying a friend is a user?
   -- is added by a user
   --can view posts

   friendId varchar(15) not null unique,
   userId varchar(15) not null,
   name varchar(50) not null,
   primary key(friendId),
   foreign key(userId) references users(userId) on update CASCADE on delete cascade
);



/*

Tables:
group(groupid,moderatorID,memberlist,contenteditors)
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