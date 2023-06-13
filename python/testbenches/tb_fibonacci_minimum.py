from modules import fibonacci_minimum
from scipy.optimize import minimize
import unittest

# Funkcja wykorzystujaca bliblioteke scipy do wyszukiwania minimum lokalnego
def znajdz_minimum_lokalne(a, b, c, d, x0, x1, eps):
    def funkcja(x):
        return a * x ** 3 + b * x ** 2 + c * x + d

    przedzial = (x0, x1)
    minimum = minimize(funkcja, x0=0, bounds=[przedzial])

    return minimum.x[0]


# Weryfikacja poprawnego dziala funckji fibonacci_arr_value za pomoca unitestow
class Testowanie(unittest.TestCase):
    # Weryfikacja pozytywnego testu, gdzie wartosci sa zgodne z scipy
    def test_pozytywny(self):
        a = 1
        b = -2
        c = 5
        d = 0
        x0 = -1
        x1 = 1
        eps = 0.0001

        y1 = znajdz_minimum_lokalne(a, b, c, d, x0, x1, eps)
        y1a = y1 - 2*eps
        y1b = y1 + 2*eps
        #print("Minimum lokalne wynosi: (SCIPY)", y1)
        y2 = fibonacci_minimum.fibonacci_function_min(a,b,c,d,x0,x1,eps)
        #print("Minimum lokalne wynosi: (Fibonacci)", y1)
        # if((y2>y1a)&(y2 < y1b)):
        #     print("Wynik poprawny",y1a,y2,y1b)
        # else:
        #     print("Wynik niepoprawny",y1a,y2,y1b)
        self.assertLess(y2,y1b,"Mniejszy niz gorna granica")
        self.assertGreater(y2, y1a, "Wiekszy niz dolna granica")

    # Weryfikacja pozytywnego testu, gdzie wartosci sa zgodne z scipy (pojedyncze przyblizenie)
    def test_negatywny_poza_zakresem(self):
        a = 1
        b = -2
        c = 5
        d = 0
        x0 = -1
        x1 = 1
        eps = 0.0001

        y1 = znajdz_minimum_lokalne(a, b, c, d, x0, x1, eps)
        y1a = y1 - 1*eps
        y1b = y1 + 1*eps
        #print("Minimum lokalne wynosi: (SCIPY)", y1)
        y2 = fibonacci_minimum.fibonacci_function_min(a,b,c,d,x0,x1,eps)
        #print("Minimum lokalne wynosi: (Fibonacci)", y1)
        if((y2>y1a)&(y2 < y1b)):
            print("Wynik poprawny",y1a,y2,y1b)
        else:
            print("Wynik niepoprawny",y1a,y2,y1b)
