#include<iostream>
#include<stdlib.h>
#include<stdio.h>
#include<math.h>
using namespace std;

int main()
{
	double y[100] = { 0 }; // tablica przechowuj�ca warto�ci dla x+h*i
	double operatorroz[100][100] = { 0 }; // tablica przechowuj�ca operatory r�nic zwyk�ych
	double n;
	double h;
	double x0;
	double wynik = 0;
	double wspolczynniki[100] = { 0 }; // tabela wspolczynnikow dla 1 pochodnej
	double wynik2 = 0; //pochodna 1
	double wynik3 = 0; // pochodna 2 
	double wspolczynniki2[100] = { 0 }; // tabela wsp�czynnik�w dla 2 pochodnej
	cout << "Podaj stopien operatora roznicowego: ";
	cin >> n;
	cout << "Podaj h: ";
	cin >> h;
	cout << "Podaj x0: ";
	cin >> x0;
	cout << endl;

	for (int i = 0; i <= n; i++) { // obliczanie warto�ci funkcji dla x+h)
		y[i] = pow((x0 + i * h), 4.0);
	}
	// OBLICZANIE RӯNIC ZWYK�YCH Z WYKORZYSTANIEM TABLICY 2-ELEMENTOWEJ
	for (int i = 1; i <= n; i++)
	{
		for (int j = n + 1 - i; j > 0; j--)  // poruszamy si� od g�ry czyli nasze r�nice zwyk�e b�d� sz�y od pocz�tku dla j=1
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
			wynik2 = wynik; //pierwsza r�nica wsp�=1
		else {
			if (i % 2 == 0)
				wynik2 = wynik2 - wynik; // znak przy wspolczynniku
			if (i % 2 == 1)
				wynik2 = wynik2 + wynik; // znak przy wspolczynniku
		}
	}
	wynik2 = wynik2 / h;
	cout << "Pochodna pierwsza:" << endl;
	cout << wynik2 << endl;

	//LICZENIE WSPӣCZYNNIK�W DLA 1 POCHODNEJ
	for (int i = 1; i <= n; i++) {
		wspolczynniki[i] = pow((-1.0), i + 1) / i;
	}

	// LICZENIE WSPӣCZYNNIK�W Z SZEREGU DLA 2 POCHODNEJ
	for (int k = 1; k <= n; k++) { // zmienna oznaczaj�ca nam wsp�rzedn� nowego szeregu
		for (int i = 1; i <= n; i++) {
			for (int j = 1; j <= n; j++) {
				if (k + 1 == j + i) // warunek oznaczaj�cy kt�re z poprzednich wsp�czynnik�w maj� wp�yw na nowy
					wspolczynniki2[k] = wspolczynniki2[k] + wspolczynniki[i] * wspolczynniki[j]; //sumowanie
			}
		}
	}
	// LICZENIE DRUGIEJ POCHODNEJ
	for (int k = 1; k < n; k++) {
		wynik3 = wynik3 + wspolczynniki2[k] * operatorroz[k + 1][1]; // rozpoczynamy od drugiej r�nicy zupe�nej
	}
	wynik3 = wynik3 / (h * h);
	cout << "Pochodna druga:" << endl;
	cout << wynik3 << endl;
	system("pause");
	return 0;
}

