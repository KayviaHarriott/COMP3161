                                                                                                                                                                                                          --Lois-Anne Hall April 24,2020, May 7,2020, May 11,2020 - 620117954
--K-Cyanne Beckford April 24, 2020, May 7,2020 - 620123796
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

   userId int(15) not null unique,
   name varchar(15)	not null,
   gender VARCHAR(1) not null,
   dob DATE,
   primary key(userId)
); 

create table groups(
   --appoints users to a friend group
   --       We also need do do some corrections so that it makes more sense generally
   --group posts are apart of a group
   -- could we add a has a relationship here that says group has group post?

   groupid 	integer	not null unique,
   moderatorID integer	not null,
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

   groupid 	integer not null unique,
   moderatorID integer	not null,
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

   userId 	integer	not null unique,
   profileid integer not null unique,
   primary key(profileid),
   foreign key(userId) references users(userId) on update cascade on delete cascade,
   foreign key (albumid) references album(albumid) on update cascade on delete cascade
);

create table album(
   -- has a picture

   albumid integer not null unique,
   profileid integer not null,
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

   postid integer not null unique,
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

   pictureid INTEGER not null unique,
   postid integer not null,
   albumid varchar(15) not null,
   primary key(pictureid),
   foreign key(postid) references posts(postid) on update CASCADE on delete cascade,
   foreign key(albumid) references album(albumid) on update CASCADE on delete cascade	
);


create table friendgroup(
   -- is a : relative, work, school    ???
   --is this trying to say that a friend group has a category? and a category falls under either relative work or school?

   fgroupid integer not null unique,
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
   

   friendId integer not null unique,
   userId integer not null,
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



Insert into users VALUES (1,"Deborah Lee","M","2007-10-16");
Insert into users VALUES (2,"Anita Sherman","M","1973-06-09");
Insert into users VALUES (3,"Samuel Lopez","M","1991-06-19");
Insert into users VALUES (4,"Diana Barnes","M","2000-10-03");
Insert into users VALUES (5,"Jennifer Benson","M","1990-06-06");
Insert into users VALUES (6,"Denise Carey","M","1986-12-01");
Insert into users VALUES (7,"Debbie Carter","F","1970-01-16");
Insert into users VALUES (8,"Juan Smith","M","1994-11-20");
Insert into users VALUES (9,"Stephen Wood","M","2019-12-05");
Insert into users VALUES (10,"Steve Fernandez","M","2007-12-17");
Insert into users VALUES (11,"Benjamin Day","M","1974-04-11");
Insert into users VALUES (12,"Austin Greer","F","2015-02-07");
Insert into users VALUES (13,"Megan Santos","M","1979-10-06");
Insert into users VALUES (14,"Thomas Brown","F","1975-05-07");
Insert into users VALUES (15,"Brian Parker","M","1970-07-17");
Insert into users VALUES (16,"Kayla White","M","1982-10-10");
Insert into users VALUES (17,"Catherine Webb","M","1989-05-10");
Insert into users VALUES (18,"Manuel Walker","M","2002-08-10");
Insert into users VALUES (19,"Andres Williams","F","1999-12-06");
Insert into users VALUES (20,"Anthony Lawrence","F","1981-11-29");
Insert into users VALUES (21,"James Brown","M","2018-10-25");
Insert into users VALUES (22,"Noah Rivera","M","1981-11-14");
Insert into users VALUES (23,"Donald Thompson","F","2013-12-12");
Insert into users VALUES (24,"Jordan Morgan","M","1971-08-18");
Insert into users VALUES (25,"Emily Simmons","M","1978-11-15");
Insert into users VALUES (26,"Christina Newton","M","1975-12-07");
Insert into users VALUES (27,"Antonio Stewart","M","1996-01-20");
Insert into users VALUES (28,"Brian Grant","F","1988-12-01");
Insert into users VALUES (29,"Julie Johnson","M","1976-08-12");
Insert into users VALUES (30,"Brittany Mcdonald DVM","M","2019-06-07");
Insert into users VALUES (31,"Brandon Collins","M","2006-06-26");
Insert into users VALUES (32,"Clinton Diaz","F","1988-11-07");
Insert into users VALUES (33,"Dustin Forbes","F","1984-09-27");
Insert into users VALUES (34,"Jason Caldwell","M","1980-08-01");
Insert into users VALUES (35,"Todd Jensen","F","2019-11-23");
Insert into users VALUES (36,"Brooke Walsh","F","1985-05-07");
Insert into users VALUES (37,"Luis Brown","M","1983-05-17");
Insert into users VALUES (38,"Heather Weaver","M","2003-08-24");
Insert into users VALUES (39,"Makayla Lewis","M","1999-10-12");
Insert into users VALUES (40,"Michelle Johnson","M","1983-06-24");
Insert into users VALUES (41,"Christopher Tyler","M","1972-07-22");
Insert into users VALUES (42,"Colleen Gray","F","2000-12-31");
Insert into users VALUES (43,"William Barker","F","1976-02-02");
Insert into users VALUES (44,"Nancy Stewart","F","2004-03-08");
Insert into users VALUES (45,"Samantha Bridges","M","1998-03-20");
Insert into users VALUES (46,"Lisa Holmes","M","2016-06-12");
Insert into users VALUES (47,"Amanda Salazar","M","2016-11-13");
Insert into users VALUES (48,"Drew Figueroa","M","2002-09-20");
Insert into users VALUES (49,"Brian Johnson","M","1984-06-18");
Insert into users VALUES (50,"Abigail Craig","M","2016-04-07");
Insert into users VALUES (51,"Nicole White","M","1999-04-05");
Insert into users VALUES (52,"Carrie Cruz","F","1995-08-14");
Insert into users VALUES (53,"Angela Carey","F","1975-06-24");
Insert into users VALUES (54,"Mason Golden","F","1986-10-22");
Insert into users VALUES (55,"Krystal Barry","F","2005-04-03");
Insert into users VALUES (56,"Cody Smith","M","2006-12-15");
Insert into users VALUES (57,"Meghan Davis","F","1999-07-20");
Insert into users VALUES (58,"Alyssa Walker","M","1975-02-23");
Insert into users VALUES (59,"Jennifer Scott","M","2009-05-24");
Insert into users VALUES (60,"Heather Oneal","F","2011-10-04");
Insert into users VALUES (61,"Jacob Patel","F","2010-06-08");
Insert into users VALUES (62,"Wayne Munoz","M","2011-01-28");
Insert into users VALUES (63,"Brian Haynes","F","2000-11-29");
Insert into users VALUES (64,"Lisa Ortiz","F","2001-12-21");
Insert into users VALUES (65,"John Garcia","F","1987-03-06");
Insert into users VALUES (66,"James Shaw","F","2014-01-03");
Insert into users VALUES (67,"Kevin Lynch","F","2019-10-28");
Insert into users VALUES (68,"Benjamin Torres","F","2004-11-08");
Insert into users VALUES (69,"Sarah Curry","F","1983-02-04");
Insert into users VALUES (70,"Amy Richards","F","2008-04-15");
Insert into users VALUES (71,"Dylan Lee","F","2007-03-02");
Insert into users VALUES (72,"Megan Norris","M","1973-09-19");
Insert into users VALUES (73,"Anthony Dean","F","1988-02-02");
Insert into users VALUES (74,"Nathan Newman","F","2016-01-03");
Insert into users VALUES (75,"Bradley Hansen","M","2012-02-08");
Insert into users VALUES (76,"Lawrence Robinson","M","2005-05-08");
Insert into users VALUES (77,"Amber Fields","M","2014-08-05");
Insert into users VALUES (78,"Kristina Spencer","F","1982-05-21");
Insert into users VALUES (79,"Hannah Rodriguez","F","2003-06-10");
Insert into users VALUES (80,"Tanner Davis","F","1984-02-19");
Insert into users VALUES (81,"Steven Campbell","F","1999-07-11");
Insert into users VALUES (82,"Shelly Ibarra","F","1971-10-13");
Insert into users VALUES (83,"Derrick Steele","F","1973-03-24");
Insert into users VALUES (84,"Jeremy Shannon","M","1986-06-16");
Insert into users VALUES (85,"Javier Young","M","2017-02-24");
Insert into users VALUES (86,"Robert Mcclure","M","1989-04-11");
Insert into users VALUES (87,"Elizabeth Gill","F","2008-08-06");
Insert into users VALUES (88,"Carolyn Adkins","F","2001-09-03");
Insert into users VALUES (89,"Nicholas Contreras","F","1974-07-12");
Insert into users VALUES (90,"Rebecca Rivas","F","1993-02-09");
Insert into users VALUES (91,"Lisa Young","F","1974-02-09");
Insert into users VALUES (92,"Alexis Logan","F","1980-04-24");
Insert into users VALUES (93,"Maria Mckee","F","2015-04-14");
Insert into users VALUES (94,"Justin Gonzales","F","1990-05-20");
Insert into users VALUES (95,"Adrienne Clarke","F","1986-11-14");
Insert into users VALUES (96,"Briana Garcia","F","1972-08-17");
Insert into users VALUES (97,"Lee Rodriguez","F","2009-03-28");
Insert into users VALUES (98,"Alyssa Sanchez","F","2008-02-16");
Insert into users VALUES (99,"Sarah Dennis","M","1986-02-28");
Insert into users VALUES (100,"Tonya Cannon","F","2017-10-25");

