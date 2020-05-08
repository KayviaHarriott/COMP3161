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

create table groups(
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
   --is a moderator a user?yes
   --so should we have like a composite key type thing or foreign key idk lol..to show that a moderator is a user?
   --once a user has a moderator id do they keep the same id in all groups?if the 
   --if the person is a moderator in one group it doesn't transfer to another group automatically, i think
   -- yeah i get that but like what happend when i am in two groups and im a moderator in both...do i have to diff ids?
   --i think its up to us to decide, we could just use the user's id as the moderator id as a reference only once they've been made a moderator
   --thats smart but how would that go....ooohhhhh yesssss makes sense...ah
   -- i think it works as an answer for both problems, so it just needs to be a foreign key

   groupid 	varchar(15)	not null unique,
   moderatorID varchar(15)	not null,
   primary key(moderatorID),
   foreign key(groupid) references groups(groupid) on update cascade on delete cascade,
   foreign key(moderatorID) references users(userid) on delete cascade 
);

create table profile(
   --modifies a user
   --has an album
   --the profile Id...if it is unique and so is the user...why is it needed?
   --it probably isn't, because a user has a profile and the profile can't exist without the user --yup
   --but then we need to decide what the function this table actually has since we can't just drop it, i think --yeah....we cant its one of the core things

   userId 	varchar(15)	not null unique,
   profileid varchar(15) not null unique,
   primary key(profileid),
   foreign key(userId) references users(userId) on update cascade on delete cascade,
   foreign key (albumid) references album(albumid) on update cascade on delete cascade
);

create table album(
   -- has a picture

   albumid varchar(15) not null unique,
   profileid varchar(15) not null,
   primary key(albumid),
   foreign key(profileid) references profile(profileid) on update CASCADE on delete cascade,
   foreign key(pictureid) references picture(pictureid) on update CASCADE on delete cascade	
);

create table posts(
   --can include pictures
   --can't create a user 
   --can't? its like creating a post on insta or facebook, the user has to alreasy exist
   --yeah as i thought...lol thats what was in the diagram so I had to check its
   --the diagram might be wrong in some parts, i think we can fix it 
   --loool ik...yeah we can
   --so the relationship is supposed to be a post is created by a user...so it should have a foreign key of user Id right? yeah definitely

   postid varchar(15) not null unique,
   content varchar(15) not null,
   viewers INTEGER not null,
   primary key(postid),
   foreign key(userid) references users(userid) on update cascade on delete cascade

);

create table picture(
   --cant exist without a user
   --can become a profile picture
   --in an album -indeed
   -- can become a profile picture (profile pictures cant exist without a picture in the album)
   --agreed

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
   -- could we add an is a relationship here saying a friend is a user? makes sense 
   --my concern about it is that....its gonna be a lot? if you get what i mean? ummmm lemme think
   --i think i get what youre saying but i dont think it could be anything else
   --like every user has a friend or many friends...and then a friend has many friends...wouldnt it be better if we use the user Id instead

   --of doubling up on the data4
   --yh using the userid sounds like a better idea, gets rid of an unnecessary id
   --lol idk how to do that though...or maybe i do...im tired
   -- is added by a user
   --can view posts
   --maybe we just leave it in as a foreign key. my concern is how we relate the many friends
   --same....DWIGHT!!!!! We need your brain!!!!!!
   -- um the main concern is how can a person have many friends?
   -- what can happen is thers a table that has userid and the friend ID as a composiste key
   -- so one user can have multiple friends but the say pair won't show up more than once
   -- making it unique. Make sense? --yeah ah so...add it please (begging for demonstration)
   -- exampe (user1, frend3), (user1, friend1), (user2,friend3) etc
   --a person can have in a single table
   

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