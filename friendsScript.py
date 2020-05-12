import random
import secrets

def writetofile():
    f = open("DBProject.sql", "a")

    friendtypes = ["Relative", "Work", "School"]

    for i in range(100):

        id = i + 1
        ftype = secrets.choice(friendtypes)
        rand1 = random.randint(1,100)

        f.write("Insert into friend VALUES (%d,%d,\"%s\");\r" % ( id, rand1,ftype))
        f.write("Insert into friend VALUES (%d,%d,\"%s\");\r" % ( rand1, id,ftype)) 
    f.close()

writetofile()
