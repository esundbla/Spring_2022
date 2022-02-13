import numpy as np
import matplotlib.pyplot as plt

x_data = np.array([35., 38., 31., 20., 22., 25., 17., 60., 8., 60.])
y_data = 2*x_data+50+5*np.random.random()

bb = np.arange(0, 100, 1)  # bias
ww = np.arange(-5, 5, 0.1)  # weight
Z = np.zeros((len(bb), len(ww)))

for i in range(len(bb)):
    for j in range(len(ww)):
        b = bb[i]
        w = ww[j]
        Z[j][i] = 0
        for n in range(len(x_data)):
            Z[j][i] = Z[j][i] + (w * x_data[n] + b - y_data[n]) ** 2  # this is the loss
        Z[j][i] = Z[j][i] / len(x_data)
