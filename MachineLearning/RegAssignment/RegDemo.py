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
    samples = [.07, .08, .19, .2, .19, .18, .06]
    results = [0.6, 0.8, 2.1, 3.4, 2.1, 1.7, 0.5]
    w1 = 0.1
    b = 0.1
    step = 0.001

    for i in range(1000000):
        h = []
        for x in samples:
            h.append((w1 * x) + b)

        w1 = w1 - step*(sumation(h, results, False))
        b  = b - step*(sumation(h, results, True))

    print("Y =", w1, "X +", b)
    print("done")

    machine = []
    for x in samples:
        machine.append((w1*x) + b)
    print(results)
    print(machine)
