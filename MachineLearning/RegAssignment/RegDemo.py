import random


def sumation(H, Y, zed):
    sum = 0
    if  not zed:
        for i in range(len(H)):
            sum = sum + ((H[i] - Y[i])*H[i])
        return sum
    else:
        for i in range(len(H)):
            sum = sum + (H[i] - Y[i])
        return sum




if __name__ == "__main__":
    samples = [1, 3.5, 2, 15, 7, 9.6, 6, 6.5, 7, 7.5, 8]
    results = []
    for sam in samples:
        results.append((2*sam)+50+(3*random.random()))

    w1 = 1.0
    b = 1.0
    step = 0.0001

    for i in range(10000000):
        h = []
        for x in samples:
            h.append((w1 * x) + b)

        w1 = w1 - step*(sumation(h, results, False))
        b = b - step*(sumation(h, results, True))

    print("Y =", w1, "X +", b)
    print("done")

    machine = []
    for x in samples:
        machine.append((w1*x) + b)
    print(results)
    print(machine)
