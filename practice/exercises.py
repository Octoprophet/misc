import random

def gameStart():
    print('We will be selecting a range of numbers, then you have to guess the random number within the range')
    r = rangeEntry()
    low = int(r[0])
    high = int(r[1])
    randomNum = int(random.randrange(low, high))
    print("random", randomNum)
    guess(randomNum, low, high)
    playAgain()

def rangeEntry():
    l = False
    u = False
    lowerRange = 0
    upperRange = 0
    while l == False:
        lowerNum = input("Please enter lower number: ")
        if lowerNum.isnumeric():
            lowerRange = int(lowerNum)
            l = True
        else:
            print('Invalid Entry')
    while u == False:
        print("low:", lowerRange)
        upperNum = input("Please enter upper number: ")
        print('upper:', upperNum)
        if upperNum.isnumeric() and int(upperNum) > lowerRange:
            upperRange = upperNum
            u = True
        elif int(upperNum) <= lowerRange:
            print("Invalid entry. Upper number must be greater than lower number")
        else:
            print('Invalid Entry')
    return lowerRange, upperRange

def guess(randomNum, low, high):
    print (f"I am thinking of a number between {low} and {high}, can you guess it?")
    correct = False
    while correct == False:
        guess = input("Enter your guess: ")
        if not guess.isnumeric():
            print("Invalid guess. Please enter a number")
        elif int(guess) < low or int(guess) > high:
            print(f"Invalid guess. Please select a number between {low} and {high}")
        elif int(guess) == randomNum:
            print("Correct!")
            correct = True
        else:
            print("Wrong!")

def playAgain():
    x = input("Would you like to play again? (y/n)")
    if x == "y":
        gameStart()
    if x == "n":
        return
    else:
        print("invalid entry")
        playAgain()

gameStart()
# lowerRange = x[0]
# upperRange = x[1]
# num = input(f"please enter a number between {lowerRange} and {upperRange}: ")
# print(num)