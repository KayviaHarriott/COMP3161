import random

def writetofile():
    f = open("friends.txt", "a")

    for i in range(100):
        f.write("Insert into users VALUES (%d,%d);\r" % ( random.randint(1,50), random.randint(50,100)))    
    f.close()

writetofile()
