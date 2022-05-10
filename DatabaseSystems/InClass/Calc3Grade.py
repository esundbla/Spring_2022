def gen_percent(data, switch):
    sum = int(data)/100
    print(sum, switch)
    if switch == 'h':
        return sum * .10
    elif switch == 't':
        return sum * .50
    elif switch == 'w':
        return sum * .05



if __name__ == "__main__":
    homework = input("Homework %: ")
    test = input("Test % : ")
    worksheets = input("Worksheet %: ")

    homePerc = gen_percent(homework, 'h')
    testPerc = gen_percent(test, 't')
    workPerc = gen_percent(worksheets, 'w')

    withoutFinal = (homePerc + testPerc + workPerc)/0.65
    print("Without Final: ", withoutFinal)

    while(True):
        final = (int(input("Final %: "))/100)*0.35
        if final == 0:
            break
        grade = homePerc +testPerc + workPerc + final
        print("Your final grade will be: ", grade)



