import numpy as np
import matplotlib.pyplot as plt
import pandas
from pandas.plotting import scatter_matrix
import seaborn
from sklearn import preprocessing

def main_preprocessing():
    """ Data Pre-Processing example:"""
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


if __name__ == "__main__":
    #main_preprocessing()
    #main_dataset()