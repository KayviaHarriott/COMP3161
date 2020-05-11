import random

def writetofile():
    f = open("DBProject.sql", "a")

    for i in range(100):
        f.write("Insert into friend VALUES (%d,%d);\r" % ( i+1, random.randint(1,21)))
        f.write("Insert into friend VALUES (%d,%d);\r" % ( i+1, random.randint(1,21)))  
    f.close()

writetofile()

#to run from terminal 
###Gonna run thi, ye ws from here, or does someone know how to run from terminal? 
###I ran from my laptop and just copied and pasted but wanna run from here to ensure it works

##SHould be the same way. just run the file location ye with that 
#got it oh crazy, i can see what you typing in terminal, nice go ahead
#nah, it ran. check dbproject the output is there .yeah it worked ^_^