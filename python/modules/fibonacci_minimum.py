# ###########################################################################################################
#                        Jakub Górnisiewicz, Przemysław Kapała             SDUP 2023
#                                         EiT
#
# Szukanie minimum funkcji
# 	wejście:
# 		*współczynniki wielomianu funkcji unimodalnej (maksymalnie jedno ekstremum w zadanym przedziale)
# 		*przedział w którym chcemy wyszukać minimum
# 		*dokładność przybliżenia wyniku (eps)
# 	wyjście:
# 		*wartość minimum
#
#
#               Weryfikacja poprawnosci dzialania znajduje sie w tb_fibonacci_minimum
###########################################################################################################

# Zadana funckja
def f(a, b, c, d, x):
    return a * (x ** 3) + b * (x ** 2) + c * x + d * 1

# Argumenty: wspolczynniki wielomianu (a,b,c,d); przedzial, w ktorym szukane jest minimum funkcji (<x0,x1>), dokladnosc (eps)
def fibonacci_function_min(a, b, c, d, x0, x1, eps):
    fib = [1, 1]                # Inicjalizacja pierwszych elementow ciagu fibonacciego
    n = 2                       # Liczba elementow ciagu
    end = ((x1 - x0) / eps)     # Zmienna pomocnicza do wyzn2czenia ilosci elementow ciagu
    while fib[n - 1] < end:     # Petla wyznaczajaca kolejne elementy ciagu
        fib.append(fib[n - 1] + fib[n - 2])
        n += 1
    #print('n=', n, ' fibn=', fib[n - 1])

    # Zawezanie przedzialow az otrzymany zostanie przedzial o szerokosci 2e
    if n >= 3:
        # Wwyznaczenie posrednich przedzialow, w ktorych szukane jest minimum
        x3 = x0 + (fib[n - 3] / fib[n - 1]) * (x1 - x0)
        x4 = x0 + (fib[n - 2] / fib[n - 1]) * (x1 - x0)
        # Obliczenie wartosci funkcji dla granic przedzialu
        fx3 = f(a, b, c, d, x3)
        fx4 = f(a, b, c, d, x4)
        #print('n,x0,x3,x4,x1')
        #print('0,', x0, ',', x3, ',', x4, ',', x1)
        itr = 0     # Zmienna liczaca ilosc wykonanych iteracji
        # Rozpoczecie szukania liczby od ostatnich elementow ciagu
        for i in range(n - 3, 1, -1):
            # Sprawdzenie w ktora strone nalezy zawezic przedzial
            if fx3 < fx4:     # Szukane minimum znajduje sie w przedziale po lewej stronie
                # Zamiana konca przedzialu i wyznaczenie nowych punktow posrednich przedzialow
                x1 = x4
                x4 = x3
                fx4 = fx3
                x3 = x0 + (fib[i - 1] / fib[i + 1]) * (x1 - x0)
                fx3 = f(a, b, c, d, x3)   # Wyznaczenie nowej wartosci funkcji
            else:           # Szukane minimum znajduje sie w przedziale po prawej stronie
                # Zamiana konca przedzialu i wyznaczenie nowych punktow posrednich przedzialow
                x0 = x3
                x3 = x4
                fx3 = fx4
                x4 = x0 + (fib[i] / fib[i + 1]) * (x1 - x0)
                fx4 = f(a, b, c, d, x4)   # Wyznaczenie nowej wartosci funkcji
            itr += 1
            #print(itr, ',', x0, ',', x3, ',', x4, ',', x1)
        #print('iteratio2s', itr)
    return (x3 + x4) / 2  # Minimum f2nkcji z dokladnoscia e
