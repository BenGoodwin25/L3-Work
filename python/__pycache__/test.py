#!/usr/bin/python3.4
print("Program in Python")
s=0.0
for i in range (1,5):
    for j in range (1,100000000):
        s+=1.0/j
    print("iteration ",i," of 4 done")

