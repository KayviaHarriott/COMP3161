#created by Lois-Anne Hall

from faker import Faker
import secrets

fake = Faker()

def writetofile():
    f = open("DBProject.sql", "a")
    # randomMaleName = fake.name_male()
    # randomFemaleName = fake.name_female()

    #name = fake.name_male()

    gender = ["M", "F"]

    for i in range(100):
        randomName = fake.name()
        randomGender =secrets.choice(gender)
        randomDOB = fake.date()f
        f.write("Insert into users VALUES (%d,\"%s\",\"%s\",\"%s\");\r\n" % (i+1, randomName, randomGender, randomDOB))
    
    f.close()

writetofile()