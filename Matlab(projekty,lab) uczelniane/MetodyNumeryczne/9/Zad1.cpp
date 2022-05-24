#include<iostream>
#include<stdlib.h>
#include<stdio.h>
#include<math.h>
using namespace std;
/*
//implementacja pochodnej 1 dos³ownie
double pochodna1(double x) {
	double wartosc = 4 * (pow(x, 3));
	return wartosc;
}
//implementacja pochodnej 2 dos³ownie
double pochodna2(double x) {
	double wartosc = 12 * (pow(x, 2));
	return wartosc;
}
*/
double funkcja(double x) // funkcja zwracajaca wartosc funkcji w punkcie
{
	double wartosc = pow(x, 4) - 625;
	//double wartosc =  exp(x - 1) + (pow(x, 2.0)) - 2;
	return wartosc;
}
// wyznaczenie 1 pochodnej korzystaj¹c z programu z Ró¿niczkowania numerycznego
double pochodna1(double x) {
	double y[100] = { 0 }; // tablica przechowuj¹ca wartoœci dla x+h*i
	double operatorroz[100][100] = { 0 }; // tablica przechowuj¹ca operatory ró¿nic zwyk³ych
	double wynik = 0;
	double wspolczynniki[100] = { 0 }; // tabela wspolczynnikow dla 1 pochodnej
	double pochodna1 = 0; //pochodna 1
	double pochodna2 = 0; // pochodna 2 
	double wspolczynniki2[100] = { 0 }; // tabela wspó³czynników dla 2 pochodnej
	int n = 8;
	double h = 0.01;


	cout << endl;

	for (int i = 0; i <= n; i++) { // obliczanie wartoœci funkcji dla x+h)
		y[i] = pow((x + i * h), 4.0) - 625;
		//y[i] =  exp((x+i*h) - 1) + (pow((x+i*h), 2.0)) - 2;
	}
	// OBLICZANIE RÓ¯NIC ZWYK£YCH Z WYKORZYSTANIEM TABLICY 2-ELEMENTOWEJ
	for (int i = 1; i <= n; i++)
	{
		for (int j = n + 1 - i; j > 0; j--)  // poruszamy siê od góry czyli nasze ró¿nice zwyk³e bêd¹ sz³y od pocz¹tku dla j=1
		{
			if (i == 1)
				operatorroz[i][j] = y[j] - y[j - 1]; // dla i == 1 t.j obliczenie pierwszego elementu
			else
				operatorroz[i][j] = operatorroz[i - 1][j + 1] - operatorroz[i - 1][j]; // ró¿nica w celu obliczenia operatora ró¿nicy zwyk³ej
		}

	}


	//LICZENIE PIERWSZEJ POCHODNEJ
	for (int i = 1; i <= n; i++) {
		wynik = ((1.0 / i)) * operatorroz[i][1]; // j=1 przechowuje operator ró¿nic zwyk³ych
		if (i == 1)
			pochodna1 = wynik; //pierwsza ró¿nica wspó³=1
		else {
			if (i % 2 == 0)
				pochodna1 = pochodna1 - wynik; // znak przy wspolczynniku
			if (i % 2 == 1)
				pochodna1 = pochodna1 + wynik; // znak przy wspolczynniku
		}
	}

	pochodna1 = pochodna1 / h;
	//cout << "Pochodna pierwsza:" << endl;
	//cout << pochodna1 << endl;
	return pochodna1;
}

// wyznaczenie 2 pochodnej korzystaj¹c  z programu z Ró¿niczkowania numerycznego
double pochodna2(double x) {
	double y[100] = { 0 }; // tablica przechowuj¹ca wartoœci dla x+h*i
	double operatorroz[100][100] = { 0 }; // tablica przechowuj¹ca operatory ró¿nic zwyk³ych
	double wynik = 0;
	double wspolczynniki[100] = { 0 }; // tabela wspolczynnikow dla 1 pochodnej
	double pochodna1 = 0; //pochodna 1
	double pochodna2 = 0; // pochodna 2 
	double wspolczynniki2[100] = { 0 }; // tabela wspó³czynników dla 2 pochodnej
	int n = 8;
	double h = 0.01;

	cout << endl;

	for (int i = 0; i <= n; i++) { // obliczanie wartoœci funkcji dla x+h)
		y[i] = pow((x + i * h), 4.0) - 625;
	}
	// OBLICZANIE RÓ¯NIC ZWYK£YCH Z WYKORZYSTANIEM TABLICY 2-ELEMENTOWEJ
	for (int i = 1; i <= n; i++)
	{
		for (int j = n + 1 - i; j > 0; j--)  // poruszamy siê od góry czyli nasze ró¿nice zwyk³e bêd¹ sz³y od pocz¹tku dla j=1
		{
			if (i == 1)
				operatorroz[i][j] = y[j] - y[j - 1]; // dla i == 1 t.j obliczenie pierwszego elementu
			else
				operatorroz[i][j] = operatorroz[i - 1][j + 1] - operatorroz[i - 1][j]; // ró¿nica w celu obliczenia operatora ró¿nicy zwyk³ej
		}

	}


	//LICZENIE PIERWSZEJ POCHODNEJ
	for (int i = 1; i <= n; i++) {
		wynik = ((1.0 / i)) * operatorroz[i][1]; // j=1 przechowuje operator ró¿nic zwyk³ych
		if (i == 1)
			pochodna1 = wynik; //pierwsza ró¿nica wspó³=1
		else {
			if (i % 2 == 0)
				pochodna1 = pochodna1 - wynik; // znak przy wspolczynniku
			if (i % 2 == 1)
				pochodna1 = pochodna1 + wynik; // znak przy wspolczynniku
		}
	}

	pochodna1 = pochodna1 / h;

	//LICZENIE WSPÓ£CZYNNIKÓW DLA 1 POCHODNEJ
	for (int i = 1; i <= n; i++) {
		wspolczynniki[i] = pow((-1.0), i + 1) / i;
	}

	// LICZENIE WSPÓ£CZYNNIKÓW Z SZEREGU DLA 2 POCHODNEJ
	for (int k = 1; k <= n; k++) { // zmienna oznaczaj¹ca nam wspó³rzedn¹ nowego szeregu
		for (int i = 1; i <= n; i++) {
			for (int j = 1; j <= n; j++) {
				if (k + 1 == j + i) // warunek oznaczaj¹cy które z poprzednich wspó³czynników maj¹ wp³yw na nowy
					wspolczynniki2[k] = wspolczynniki2[k] + wspolczynniki[i] * wspolczynniki[j]; //sumowanie
			}
		}
	}
	// LICZENIE DRUGIEJ POCHODNEJ
	for (int k = 1; k < n; k++) {
		pochodna2 = pochodna2 + wspolczynniki2[k] * operatorroz[k + 1][1]; // rozpoczynamy od drugiej ró¿nicy zupe³nej
	}
	pochodna2 = pochodna2 / (h * h);
	//cout << "Pochodna druga:" << endl;
	//cout << pochodna2 << endl;
	return pochodna2;
}


int main()
{
	// METODA SIECZNYCH
	cout << "Metoda siecznych" << endl;
	double a, b;
	double epsilon;
	cout << "Podaj dolna granice przedzialu poczatkowego : ";
	cin >> a;
	cout << "Podaj gorn¹ granice przedzialu poczatkowego :";
	cin >> b;
	cout << "Podaj dokladnosc epsilon : ";
	cin >> epsilon;
	double x;
	int i = 0;
	

	if (funkcja(a) * pochodna2(a) > 0) { // warunek wyboru punktu sta³ego
		cout << "Punkt a jest punktem stalym : " << a << endl;
		do {
			x = (b - (funkcja(b) * (a - b) / (funkcja(a) - funkcja(b)))); // wyliczanie kolejnych przybli¿eñ pierwiastka
			cout << "Przyblizenie: " << x << endl;
			b = x; // zawê¿anie przedzia³u
			i++; // zwiêkszenie liczby iteracji
		} while (fabs(funkcja(x)) > epsilon); // warunek stopu
	}
	else
		if (funkcja(b) * pochodna2(b) > 0) { // warunek wyboru punktu sta³ego
			cout << "Punkt b jest punktem stalym : " << b << endl;
			do {
				x = (a - (funkcja(a) * (b - a) / (funkcja(b) - funkcja(a)))); // wyliczanie kolejnych przybli¿eñ pierwiastka
				cout << "Przyblizenie: " << x << endl;
				a = x; // zawê¿anie przedzia³u
				i++; // zwiêkszenie liczby iteracji
			} while (fabs(funkcja(x)) > epsilon); // warunek stopu
		}
	cout << "Ilosc iteracji :" << i << endl;
	cout << "Przyblizenie koncowe :" << x << endl;


	// METODA STYCZNYCH
// WARUNEK ROZWI¥ZUJ¥CY SYTUACJÊ GDY F(A) = F(B)
	cout << "Metoda stycznych" << endl;
	cout << "Podaj dolna granice przedzialu poczatkowego : ";
	cin >> a;
	cout << "Podaj gorn¹ granice przedzialu poczatkowego :";
	cin >> b;
	cout << "Podaj dokladnosc epsilon : ";
	cin >> epsilon;
	i = 0;

	if (funkcja(a) * pochodna2(a) > 0) { // warunek wyboru punktu startowego
		cout << "Punkt a jest punktem stalym : " << a << endl;
		do {
			x = a - funkcja(a) / pochodna1(a); // wyliczanie kolejnych przybli¿eñ pierwiastka
			cout << "Przyblizenie: " << x << endl;
			a = x; // zawê¿anie przedzia³u
			i++; // zwiêkszenie liczby iteracji
		} while (fabs(funkcja(x)) > epsilon); // warunek stopu
	}
	else
		if (funkcja(b) * pochodna2(b) > 0) { // warunek wyboru punktu startowego
			cout << "Punkt b jest punktem stalym : " << b << endl;
			do {
				x = b - funkcja(b) / pochodna1(b); // wyliczanie kolejnych przybli¿eñ pierwiastka
				cout << "Przyblizenie: " << x << endl;
				b = x; // zawê¿anie przedzia³u
				i++; // zwiêkszenie liczby iteracji
			} while (fabs(funkcja(x)) > epsilon); // warunek stopu
		}
	cout << "Ilosc iteracji :" << i << endl;
	cout << "Przyblizenie koncowe :" << x << endl;
}