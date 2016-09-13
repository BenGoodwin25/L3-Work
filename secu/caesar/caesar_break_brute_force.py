#! /usr/bin/python3.5

import sys,os
#Fonction

#main
namefile = sys.argv[1]
for key in range(1, 25):
    os.system(("./caesar_decrypt " + str(key) + " < cipher"))
    answer=input("is this okay ?(y/n)")
    if answer == 'y':
        os.system(("./caesar_decrypt " + str(key) + " < cipher > plain"))
        break

