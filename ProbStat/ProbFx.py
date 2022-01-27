import math


def mean(numb):
    mean = sum(numb)/len(numb)
    return mean


def main():
    while(True):
        numbers = input("Data set: ")
        if numbers.__contains__("\t"):
            numb = numbers.split("\t")
        else:
            numb = numbers.split(",")
        nlist = []
        for items in numb:
            if items.__contains__(','):
                items = items.replace(',', '', 1)
            nlist.append(float(items))

        nlist.sort()
        print(nlist)
        myMean = mean(nlist)
        if len(nlist) % 2 == 0:
            median = (nlist[(len(nlist)//2)] + nlist[(len(nlist)//2)-1])/2
        else:
            median = nlist[(len(nlist)//2)]
        print("Mean =", myMean, "Median=", median)

        trimPerc = float(input("Trim percent: "))
        low = (len(nlist) * trimPerc).__floor__()
        high = (len(nlist) * trimPerc).__ceil__()
        meanLow = mean(nlist[(low):(len(nlist) - low)])
        meanHig = mean(nlist[(high):(len(nlist) - high)])
        trimMean = (meanLow + meanHig)/2

        print("Trinm mean:", trimMean)

        run = input("Run again? Y/N ")
        if run == 'N':
            break



if __name__ == "__main__":
    main()