import math

def list_squared(m, n):
    sumOfDivSq = []
    for i in range(m, n+1):
        divisors = []
        for a in range(1, i+1):
            for b in range(1, i+1):
                if a * b == i:
                    divisors.append(a * a)
        if math.sqrt(sum(divisors)) % 1 == 0:
            sumOfDivSq.append([i, sum(divisors)])
            print(divisors)
    return sumOfDivSq
                    

print(list_squared(1, 250)) 

# def num(n):
#     divisors = []
#     for num1 in range(n+1):
#         for num2 in range(n+1):
#             if num1 * num2 == n and num1 <= num2:
#                 divisors.append(num1 * num1)
#                 divisors.append(num2 * num2)
#     divisorsSum = sum(divisors)
#     if math.sqrt(divisorsSum) % 1 == 0:
#         print(n, divisorsSum)

# num(246)