'''This is a code to generate random numbers using LINEAR CONGRUENT or POWER RESIDUE METHOD'''

def linearCongruent(a, c, M, r1):
    r = []
    i = 0
    r[0] = r1
    r[1] = (a * r[0] + c) % M
    while r[i] != r[i+1]:
        i += 1
        r[i+1] = (a * r[i] + c) % M