#include<iostream>
#include<stdlib.h>
#include<stdio.h>
#include<math.h>
using namespace std;

double silnia(double n) {   // OBLICZANIE SILNI DLA N
	double silnia = 1;
	for (int i = 1; i <= n; i++) {
		silnia = silnia * i;
	}
	return silnia;
}

int main()
{
	double y[100] = { 0 }; // tablica przechowuj�ca warto�ci dla x+h*i
	double operatorroz[100][100] = { 0 }; // tablica przechowuj�ca operatory r�nic zwyk�ych
	int modyfikacja = 0;
	int n;
	double epsilon;
	double h;
	double x0;
	double wynik = 0;
	double wynik2 = 0; //pochodna 1
	double blad = 0;
	cout << "Podaj stopien operatora roznicowego: ";
	cin >> n;
	cout << "Podaj h: ";
	cin >> h;
	x0 = 1;
	cout << "Podaj dokladnosc: ";
	cin >> epsilon;
	cout << endl;
	do {
		for (int i = 0; i <= n + 1; i++) { // obliczanie warto�ci funkcji dla x+h)
			y[i] = log(x0 + h * i); // funkcja analityczna logx0
		}
		// OBLICZANIE RӯNIC ZWYK�YCH Z WYKORZYSTANIEM TABLICY 2-ELEMENTOWEJ DLA N+1
		for (int i = 1; i <= n + 1; i++) // dodanie 1 w celu obliczenia n+1 r�nicy zwyk�ej
		{
			for (int j = n + 2 - i; j > 0; j--)  // poruszamy si� od g�ry czyli nasze r�nice zwyk�e b�d� sz�y od pocz�tku dla j=1 // ulepszenie programu 1 poprzez dodanie do j "1" w celu obliczenia n+1 r�nicy zwyk�ej
			{
				if (i == 1)
					operatorroz[i][j] = y[j] - y[j - 1]; // dla i == 1 t.j obliczenie pierwszego elementu
				else
					operatorroz[i][j] = operatorroz[i - 1][j + 1] - operatorroz[i - 1][j]; // r�nica w celu obliczenia operatora r�nicy zwyk�ej
			}

		}

		//LICZENIE PIERWSZEJ POCHODNEJ
		for (int i = 1; i <= n; i++) {
			wynik = ((1.0 / i)) * operatorroz[i][1]; // j=1 przechowuje operator r�nic zwyk�ych
			if (i == 1)
				wynik2 = wynik; //pierwsza r�nica
			else {
				if (i % 2 == 0)
					wynik2 = wynik2 - wynik; // znak przy wspolczynniku
				if (i % 2 == 1)
					wynik2 = wynik2 + wynik; // znak przy wspolczynniku
			}
		}
		cout << "Delta [n+1][1] : "; // wy�wietlenie n+1 delty
		cout << operatorroz[n + 1][1] << endl;
		wynik2 = wynik2 / h;
		if (modyfikacja == 0) {
			cout << "Wybor opcji" << endl << "1 modyfikacja n" << endl << "2 modyfikacja h" << endl;
			cin >> modyfikacja;
		}
		blad = (operatorroz[n + 1][1]) / (silnia(n) * h);
		if (modyfikacja == 1) // WYBRANIE OPCJI W ZALEZNOSCI CO MODYFIKUJEMY 1,2
			cout << "n:" << n << endl;  // W CELU SPRAWDZENIA DZIA�ANIA
		if ((abs(blad) > epsilon))
			n = n + 1;    // ZMIANA N O 1
		if (modyfikacja == 2)
			cout << "h:" << h << endl; // W CELU SPRAWDZENIA DZIA�ANIA
		if ((abs(blad) > epsilon))
			h = h - 0.1; // ZMIANA KROKU O -0.1
		cout << "Blad: " << blad << endl; // WYSWIETLENIE BLEDU
	} while (abs(blad) > epsilon);
	cout << "Pochodna:" << endl;
	cout << wynik2 << endl;
	if (modyfikacja == 1) {
		cout << "Ko�cowe n :";
		cout << n;
	}
	if (modyfikacja == 2) {
		cout << "Ko�cowe h :";
		cout << h;
	}
	cout << endl;
	system("pause");
	return 0;
}
*/