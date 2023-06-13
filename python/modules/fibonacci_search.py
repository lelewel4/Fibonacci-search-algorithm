# ###########################################################################################################
#                        Jakub Górnisiewicz, Przemysław Kapała             SDUP 2023
#                                         EiT
#
# Zalozenia:
#     Wejscie
#         *posegregowana tablica N-elementowa       (list[int])
#         *szukana wartość      (int)
#     Wyjscie
#         *czy szukana wartość występuje w tablicy      ("-1" w przypadku braku wystepowania lub jednoelementowej macierzy)
#         *indeks tablicy pod którym jest szukana wartość       (int)
#
#
#               Weryfikacja poprawnosci dzialania znajduje sie w testbenches/tb_fibonacci_serach
###########################################################################################################

# Definicja funkcji wraz z wymuszenie odpowiednich argumentow (macierz, szukana wartosc) oraz zwracajacej szukany indeks
def fibonacci_arr_value(arr:list[int], x:int):

    n = len(arr)

    # Weryfikacja czy podana macierz jest poprawna pod wzgledem wielkosci
    if n == 0:
        return -1

    # Inicjalizacja 3 poczatkowych wyrazow ciagu Fibonacciego
    fib1, fib2 = 0, 1
    fib3 = fib1 + fib2

    # Szukanie liczby ciagu Fibonacciego wiekszej lub rownej ostatniemu indeksowi w macierzy
    while fib3 < n:
        fib1, fib2 = fib2, fib3
        fib3 = fib1 + fib2

    # Inicjalizacja zmiennych okreslajacych przedzialy (punkty brzegowe)
    offset = -1                             # Zmienna pomocnicza okreslajaca przesuniecie przy przejsciu do prawego przedzialu
    while fib3 > 1:
        i = min(offset + fib2, n - 1)       # Okreslenie gornego limitu przedzialu, lecz mniejszego niz n-1

        #Jesli "x" jest wieksze niz wartosc pod indeksem "i", wybierz przedzial z prawej
        if arr[i] < x:
            fib3 = fib2
            fib2 = fib1
            fib1 = fib3 - fib2
            offset = i

        #Jesli "x" jest mniejsze niz wartosc pod indeksem "i", wybierz przedzial z lewej
        elif arr[i] > x:
            fib3 = fib1
            fib2 = fib2 - fib1
            fib1 = fib3 - fib2

        # Jesli "x" jest rowne z wartoscia pod indeksem "i", zwroc indeks
        else:
            return i

    # Zwracanie poprawnego indeksu
    if fib2 == 1 and arr[offset + 1] == x:
        return offset + 1
    # Jesli "x" nie zostalo znalezione w macierzy, zwroc "-1"
    else:
        return -1


