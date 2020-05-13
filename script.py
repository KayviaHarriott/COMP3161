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

    for i in range(500000):
        randomName = fake.name()
        randomGender =secrets.choice(gender)
        randomDOB = fake.date()f
        f.write("Insert into users VALUES (%d,\"%s\",\"%s\",\"%s\");\r\n" % (i+1, randomName, randomGender, randomDOB))


    #for i in range (100):

    #######################
    ##     FriendScript  ##
    #######################

    friendtypes = ["Relative", "Work", "School"]

        for i in range(500000):

            id = i + 1
            ftype = secrets.choice(friendtypes)
            rand1 = random.randint(1,500000)

            f.write("Insert into friend VALUES (%d,%d,\"%s\");\r" % ( id, rand1,ftype))
            f.write("Insert into friend VALUES (%d,%d,\"%s\");\r" % ( rand1, id,ftype)) 
   
    #######################
    ##     Groups        ##
    #######################
    
    groupnames = ["Anime Watching", "Biking Clubs", "TV Watchers"]

    for i in range(500000):

            id = i + 1
            gnames = secrets.choice(groupnames)
            randomdate = "2020-05-12"#fake.date() #see if this can be in a certain time period
            moderatorID = random.randint(1,500000)
            

            f.write("Insert into groups VALUES (%d,\"%s\",\"%s\",%d);\r" % (id, gnames, randomdate,moderatorID))
            
    #######################
    ##   groupsmembers   ##
    #######################
    
    typemember = ["Content Editor", "Viewer"]

    for i in range(500000):

            id = i + 1
            userID = random.randint(1,500000) 
            tmember = secrets.choice(typemember)

            f.write("Insert into groupsmembers VALUES (%d,%d,\"%s\");\r" % (id, userID, tmember))
     
    f.close()

writetofile()