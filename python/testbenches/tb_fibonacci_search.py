from modules import fibonacci_search
import unittest

# Weryfikacja poprawnego dziala funckji fibonacci_arr_value za pomoca unitestow
class Testowanie(unittest.TestCase):

    # Weryfikacja pozytywnego testu, gdzie wartosci sa zgodne
    def test_pozytywny(self):
        x = 100
        arr = [0,1,5,7,8,9,11,17,56,59,67,84,100]
        y1 = fibonacci_search.fibonacci_arr_value(arr, x)
        y2 = arr.index(x)
        print(y1,y2)
        self.assertEqual(y1, y2)

    # Weryfikacja negatywnego testu, gdzie wartosci sa rozne
    def test_negatywny_rozne_wartosci(self):
        x = 5
        arr = [0,1,5,7,8,9,11,17,56,59,67,84,100]
        y1 = fibonacci_search.fibonacci_arr_value(arr, x)
        y2 = arr.index(x) + 100
        print(y1, y2)
        self.assertNotEqual(y1, y2)

    # Weryfikacja negatywnego testu, gdzie wartosc nie wystepuje w macierzy
    def test_negatywny_nie_wystepuje(self):
        x = 69
        arr = [0,1,5,7,8,9,11,17,56,59,67,84,100]
        y = fibonacci_search.fibonacci_arr_value(arr, x)
        self.assertEqual(y, -1)             # poniewaz funkcja zwraca "-1"
        print(y)

if __name__ == '__main__':
    unittest.main()




