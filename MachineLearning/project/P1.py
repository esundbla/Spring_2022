import numpy as np
import matplotlib.pyplot as plt
import pandas
from pandas.plotting import scatter_matrix
import seaborn
from sklearn import preprocessing

""" Machine Learning code demonstrations """

def main_preprocessing():
    """ Data Pre-Processing examples """
    input_data = np.array([[3, -1.5, 3, -6.4], [0, 3, -1.3, 4.1], [1, 2.3, -2.9, -4.3]])
    data_standard = preprocessing.scale(input_data)
    print('\nMean =', data_standard.mean(axis=0))
    print(';Std deviation =', data_standard.std(axis=0))

    data_scaler = preprocessing.MinMaxScaler(feature_range=(0, 1))
    data_scaled = data_scaler.fit_transform(input_data)
    print("\nMin max scaled data =", data_scaled)

    data_normalized = preprocessing.normalize(input_data, norm='l1')
    print("\nL1 normalized data =", data_normalized)

    data_binarized = preprocessing.Binarizer(threshold=1.4).transform(input_data)
    print("\nBinarized data =", data_binarized)

    label_encoder = preprocessing.LabelEncoder()
    input_classes = ['suzuki', 'ford', 'suzuki', 'toyota', 'ford', 'bmw']
    label_encoder.fit(input_classes)
    print("\nClass mapping:")
    for i, item in enumerate(label_encoder.classes_):
        print(item, '-->', i)

    labels = ['toyota', 'ford', 'suzuki']
    encoded_labels = label_encoder.transform(labels)
    print("\nLabels =", labels)
    print("Encoded labels =", list(encoded_labels))

    encoded_labels = [3, 2, 0, 2, 1]
    decoded_labels = label_encoder.inverse_transform(encoded_labels)
    print("\nEncoded labels =", encoded_labels)
    print("Decoded labels =", list(decoded_labels))


def main_dataset():
    """ data set observation tools """
    data = 'breast-cancer-wisconsin.data'
    names = ['Id Number', 'Clump Thickness', 'Cell uniformity size', 'Uniformity cell shape', 'Marginal Adh', 'Single cell size', 'Bare Nuclei', 'Bland Chromatic', 'Normal Nucleoli', 'Mitoses', 'Class']
    dataset = pandas.read_csv(data, names=names)

    print(dataset.shape)
    print(dataset.head(20))
    print(dataset.describe())
    print(dataset.groupby('Class').size())
    dataset.plot(kind='box', subplots=True, layout=(10, 10), sharex=False, sharey=False)
    dataset.hist()
    scatter_matrix(dataset)
    plt.show()


def main_linear():
    """ Linear Regression Algo """
    X = [0, 6, 11, 14, 22]
    Y = [1, 7, 12, 15, 21]
    a, b = best_fit(X, Y)
    # best fit line:
    # y = 0.80 + 0.92x
    # plot points and fit line
    plt.scatter(X, Y)
    yfit = [a + b * xi for xi in X]
    plt.plot(X, yfit)
    plt.show()


def best_fit(X, Y):
    """ Calculate a best fit line for dep(Y) and indep(X) given arrays """
    xbar = sum(X)/len(X)
    ybar = sum(Y)/len(Y)
    n = len(X) # or len(Y)

    numer = sum([xi*yi for xi,yi in zip(X, Y)]) - n * xbar * ybar
    denum = sum([xi**2 for xi in X]) - n * xbar**2

    b = numer / denum
    a = ybar - b * xbar
    print('best fit line:\ny = {:.2f} + {:.2f}x'.format(a, b))
    return a, b




if __name__ == "__main__":
    #main_preprocessing()
    #main_dataset()
    main_linear()