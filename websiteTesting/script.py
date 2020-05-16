#
#Lois-Anne Hall April 24,2020, May 7,2020, May 11,2020 - 620117954                                                                                                                                                                                                        --Lois-Anne Hall April 24,2020, May 7,2020, May 11,2020 - 620117954
#K-Cyanne Beckford April 24, 2020, May 7,2020 - 620123796
#Dwight Muschette May 7,2020 - 620120113
#Kayvia Harriott May 7,2020 - 620118463 
#Wayne Clarke May 7, 2020 - 620091440

import secrets
import random


def writetofile():
    #######################
    ##     UserScript    ##
    #######################

    f = open("world.sql", "a")
    # randomMaleName = fake.name_male()
    # randomFemaleName = fake.name_female()

    #name = fake.name_male()

    gender = ["M", "F"]
    randomName = ["Mary Beth", "Gergy Herry","Harry Styles","Niall Horan", "Maia Watson","Andrienne McConell","Dr Seuss"]

    for i in range(10):
        randomNames = secrets.choice(randomName)
        randomGender =secrets.choice(gender)
        randomDOB = "1999-09-25"
        f.write("Insert into users VALUES (%d,\"%s\",\"%s\",\"%s\");\r" % (i+1, randomNames, randomGender, randomDOB))


    #for i in range (100):

    #######################
    ##     FriendScript  ##
    #######################

    friendtypes = ["Relative", "Work", "School"]

    for i in range(10):

        id = i + 1
        ftype = secrets.choice(friendtypes)
        rand1 = random.randint(1,10)

        f.write("Insert into friend VALUES (%d,%d,\"%s\");\r" % ( id, rand1,ftype))
        f.write("Insert into friend VALUES (%d,%d,\"%s\");\r" % ( rand1, id,ftype)) 
   
    #######################
    ##     Groups        ##
    #######################
    
    groupnames = ["Anime Watching", "Biking Clubs", "TV Watchers"]

    for i in range(10):

            id = i + 1
            gnames = secrets.choice(groupnames)
            randomdate = "2020-05-12"#fake.date() #see if this can be in a certain time period
            moderatorID = random.randint(1,10)
            

            f.write("Insert into groups VALUES (%d,\"%s\",\"%s\",%d);\r" % (id, gnames, randomdate,moderatorID))
            
    #######################
    ##   groupsmembers   ##
    #######################
    
    typemember = ["Content Editor", "Viewer"]

    for i in range(10):

            id = i + 1
            userID = random.randint(1,10) 
            tmember = secrets.choice(typemember)

            f.write("Insert into groupsmembers VALUES (%d,%d,\"%s\");\r" % (id, userID, tmember))
     
    #######################
    ##   profile         ##
    #######################
    

    for i in range(10):

            id = i + 1
            albumid = random.randint(10,1)            
            f.write("Insert into profile VALUES (%d,%d);\r" % (id, albumid))
    

    #######################
    ##   profiles        ##
    #######################
    

    for i in range(10):

            userid = i + 1
            profileid = random.randint(1,10)            
            f.write("Insert into profiles VALUES (%d,%d);\r" % (userid, profileid))
    
    
   
    #######################
    ##   album           ##
    #######################
    

    for i in range(10):

            id = i + 1
            pictureid = random.randint(1,10)            
            f.write("Insert into album VALUES (%d,%d);\r" % (id, albumid))
          

    #######################
    ##   posts           ##
    #######################
    
    posttype = ["image","text"]
    for i in range(10):
            
            postid = i + 1
            userid = i + 1
            ptype = secrets.choice(posttype)
            albumid = random.randint(10,1)            
            f.write("Insert into posts VALUES (%d,\"%s\",%d);\r" % (postid, ptype, userid))

    #######################
    ##   picture         ##
    #######################
    

    for i in range(10):

            pictureid = i + 1
            albumid = random.randint(1,10)            
            f.write("Insert into picture VALUES (%d,%d);\r" % (pictureid, albumid))
            

    #######################
    ##   friend          ##
    #######################
    
    groupnames = ["Anime Watching", "Biking Clubs", "TV Watchers"]
    for i in range(10):

            userid = i + 1
            rand1 = random.randint(1,10)            
            fgroup = secrets.choice(groupnames)
            f.write("Insert into friend VALUES (%d,%d,\"%s\");\r" % (userid, rand1, fgroup))

writetofile()