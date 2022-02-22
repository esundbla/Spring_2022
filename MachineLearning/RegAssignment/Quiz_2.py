import numpy as np
import matplotlib.pyplot as plt
import sklearn
import random


if __name__ == "__main__":
    reg = sklearn.LinearRegression()
    x_val = []
    y_val = []
    for i in range(500):
        rand = random.random()
        if rand > 0.5:
            x_val.append(round(3*random.random(), 3))
        else:
            x_val.append(round(-3*random.random(), 3))
        y_val.append(round((0.5*(x_val[i]**5))-(5*(x_val[i]**3))-(x_val[i]**2)+(round(10*random.random(), 3)), 3))
    x_train = x_val[0:300]
    x_test = x_val[300:]
    y_train = y_val[0:300]
    y_test = y_val[300:]
    print(x_val, "\n", y_val)
    plt.plot(x_val, y_val,lw=2, label='linear', color= 'Red');