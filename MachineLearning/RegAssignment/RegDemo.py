import random
import numpy as np

import matplotlib.pyplot as plt


def sumation(X,H, Y, zed):
    sum = 0
    if  not zed:
        for i in range(len(H)):
            sum = sum + (((H[i] - Y[i])*X[i]))
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
    step = 0.00001
    w1_hist =[]
    b_hist=[]

    for i in range(1000000):
        h = []
        for x in samples:
            h.append((w1 * x) + b)
        w1_hist.append(w1)
        b_hist.append(b)
        w1 = w1 - step*(sumation(samples, h, results, False))
        b = b - step*(sumation(samples, h, results, True))

    print("Y =", w1, "X +", b)
    print("done")
    bb = np.arange(0, 100, 1)  # bias
    ww = np.arange(0, 10, 0.1)  # weight
    Z = np.zeros((len(bb), len(ww)))

    for i in range(len(bb)):
        for j in range(len(ww)):
            b = bb[i]
            w = ww[j]
            Z[j][i] = 0
            for n in range(len(samples)):
                Z[j][i] = Z[j][i] + (w * samples[n] + b - results[n]) ** 2  # this is the loss
            Z[j][i] = Z[j][i] / len(results)

    plt.contour(bb, ww, Z, 200, alpha=0.7, cmap=plt.get_cmap('jet'))
    plt.plot([50], [2], 'x', ms=12, markeredgewidth=3, color='orange')
    plt.plot(b_hist, w1_hist, 'o-', ms=3, lw=1.5, color='black')
    plt.show()
