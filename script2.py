#created by Lois-Anne Hall

from faker import Faker
import secrets
import random

fake = Faker()

def writetofile():
    #######################
    ##     UserScript    ##
    #######################

    f = open("DBProject.sql", "a")
    # randomMaleName = fake.name_male()
    # randomFemaleName = fake.name_female()

    #name = fake.name_male()

    gender = ["M", "F"]

    for i in range(500):
        randomName = fake.name()
        randomGender =secrets.choice(gender)
        randomDOB = fake.date()
        f.write("Insert into users VALUES (%d,\"%s\",\"%s\",\"%s\");\r" % (i+1, randomName, randomGender, randomDOB))


    #for i in range (100):

    #######################
    ##     FriendScript  ##
    #######################

    friendtypes = ["Relative", "Work", "School"]

    for i in range(500):

        id = i + 1
        ftype = secrets.choice(friendtypes)
         rand1 = random.randint(1,500)

        f.write("Insert into friend VALUES (%d,%d,\"%s\");\r" % ( id, rand1,ftype))
        f.write("Insert into friend VALUES (%d,%d,\"%s\");\r" % ( rand1, id,ftype)) 
   
    #######################
    ##     Groups        ##
    #######################
    
    groupnames = ["Anime Watching", "Biking Clubs", "TV Watchers"]

    for i in range(500):

            id = i + 1
            gnames = secrets.choice(groupnames)
            randomdate = "2020-05-12"#fake.date() #see if this can be in a certain time period
            moderatorID = random.randint(1,500)
            

            f.write("Insert into groups VALUES (%d,\"%s\",\"%s\",%d);\r" % (id, gnames, randomdate,moderatorID))
            
    #######################
    ##   groupsmembers   ##
    #######################
    
    typemember = ["Content Editor", "Viewer"]

    for i in range(500):

            id = i + 1
            userID = random.randint(1,500) 
            tmember = secrets.choice(typemember)

            f.write("Insert into groupsmembers VALUES (%d,%d,\"%s\");\r" % (id, userID, tmember))
     
    #######################
    ##   profile         ##
    #######################
    

    for i in range(500):

            id = i + 1
            albumid = random.randint(500,1000)            
            f.write("Insert into profile VALUES (%d,%d);\r" % (id, albumid))
    
    
   
    #######################
    ##   profiles        ##
    #######################
    

    for i in range(500):

            userid = i + 1
            profileid = random.randint(1,500)            
            f.write("Insert into profiles VALUES (%d,%d);\r" % (userid, profileid))
    
    
   

    #######################
    ##   album           ##
    #######################
    

    for i in range(500):

            id = i + 1
            pictureid = random.randint(1000,1500)            
            f.write("Insert into album VALUES (%d,%d);\r" % (id, albumid))
          

    #######################
    ##   posts           ##
    #######################
    
    posttype = ["image","text"]
    for i in range(500):
            
            postid = i + 1
            userid = i + 1
            ptype = secrets.choice(posttype)
            albumid = random.randint(500,1000)            
            f.write("Insert into posts VALUES (%d,\"%s\",%d);\r" % (postid, ptype, userid))

    #######################
    ##   picture         ##
    #######################
    

    for i in range(500):

            pictureid = i + 1
            albumid = random.randint(1000,1500)            
            f.write("Insert into picture VALUES (%d,%d);\r" % (pictureid, albumid))
            

    #######################
    ##   friend          ##
    #######################
    
    groupnames = ["Anime Watching", "Biking Clubs", "TV Watchers"]
    for i in range(500):

            userid = i + 1
            rand1 = random.randint(1,500)            
            fgroup = secrets.choice(groupnames)
            f.write("Insert into friend VALUES (%d,%d,\"%s\");\r" % (userid, rand1, fgroup))


writetofile()