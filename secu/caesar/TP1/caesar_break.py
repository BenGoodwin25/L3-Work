#! /usr/bin/python3.5

import sys,os

#Fonction
def creatingAlphaDict():
    dico=dict()
    dico={'a':0,'b':0,'c':0,'d':0,'e':0,'f':0,'g':0,'h':0,'i':0,'j':0,'k':0,'l':0,'m':0,'n':0,'o':0,'p':0,'q':0,'r':0,'s':0,'t':0,'u':0,'v':0,'w':0,'x':0,'y':0,'z':0}
    return dico

def gettingMostUsedLetter(dico):
    i=0
    for letter,number in dico.items():
        if number > i :
            c=letter
            i=number
    return c

def addingRecurentLetter(dico,c):
    if c.isalpha():
        dico[c.lower()]+=1

def gettingKey(c):
    return ord(c)-ord('e')


#main
NbOfEachLetter=creatingAlphaDict()
namefile = sys.argv[1]
with open(namefile,"r") as cipher:
    for line in cipher:
        for char in line:
            addingRecurentLetter(NbOfEachLetter,char)

c=gettingMostUsedLetter(NbOfEachLetter)
print("The Most used letter is ",c)
key=gettingKey(c)
print("The Key is : ",key)
cipher.close()
os.system(("./caesar_decrypt " + str(key) + " < cipher"))
answer=input("is this okay ?(y/n)")
if answer == 'y':
    os.system(("./caesar_decrypt " + str(key) + " < cipher > plain"+str(namefile)))
