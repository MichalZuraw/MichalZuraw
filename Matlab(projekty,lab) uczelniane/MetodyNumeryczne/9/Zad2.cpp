#include<math.h>
#include<iostream>
#include<stdlib.h>
#include<stdio.h>
int main()
{
	int n;
	double e = 0.0000001;

	std::cout << "podaj stopien wielomianu\n";
	std::cin >> n;

	double* wspol = new double[n + 1];//stworzenie dynamicznej tablicy wspolczynnikow wiekszej o jeden od n
	std::cout << "Wprowadz wspolczynniki (od najwiekszego indeksu)\n";
	for (int i = 0; i <= n; i++) {
		std::cin >> wspol[i]; //wypelnienie tablicy wspolczynnikow
	}

	double* y = new double[n]; //tablica przechowujaca y
	y[0] = 1;
	int v;
	for (int i=1; i<n; i++){
	v = rand() % 100;
		y[i] = v;
	}
	
	std::cout << "Wektor poczatkowy: \n";
	
	for (int i = 0; i < n; i++){
		std::cout << y[i] << "\n";
	}
	std::cout << "dokladnosc epsilon=" <<e <<"\n"<< std::endl;

	double* pomoc = new double[n];//zmienna pomocnicza 
	
	for (int i = 0; i < n; i++) { 
		pomoc[i] = 0; //zerowanie zmiennej pomocniczej
	}

	//zdefiniowanie zmiennych potrzebnych do metody
	int dok = 0; //dokladnosc |xnas-xpop|<e
	int ile = 0; //ilosc petli
	int pierw = n; //ilosc pierwiastkow
	double xnas = 0.0;
	double xpop = 0.0;
	double wynik = 0.0;


	for (int i = 0; i < n; i++){ //algorytm stosujacy metode Bernoulliego
	
		if (i < n - 1) { //szukanie ostatniego pierwiastka
			// zerowanie i jedynkowanie zmiennych po obliczeniu pierwiastka o najwiekszym module
			ile = 1;
			dok = 1;
			xnas = 0.0;  
			xpop = 0.0;
			
			while (ile <= 50 && dok == 1){ //warunek stopu przekroczenie 50 iteracji lub osiagniecie odpowiedniej dokladnosci dla danego wielomianu
				xpop = xnas; // przepisanie starej wartosci do x poprzedniego w celu obliczenia x nastepnego
				wynik = 0.0;
				
				for (int j = 0; j < n - i; j++){
					wynik -= wspol[j + 1] * y[j]; //odejmowanie od wyniku wspolczynnika pomnozonego przez element wektora zgodnie z wzorem
				}
				
				for (int j = n - 1 - i; j > 0; j--){
					y[j] = y[j - 1]; // przesuniecie wartosci w wektorze, poniewaz nie potrzebujemy ostatniej wartosci
				}
				
				y[0] = wynik / wspol[0]; //obliczenie nowej wartosci i wprowadzenie jej do wektora
				xnas = y[0] / y[1]; // obliczenie x zgodnie z wzorem
				std::cout << "x" << ile << " = " << xnas << std::endl;
				ile++; // zwiekszenie licznika
				
				if (fabs(xnas - xpop) < e) // sprawdzenie warunku dokladnosci
					dok = 0; //kryterium stopi
			}
		}
		else{
			xnas = -wspol[1] / wspol[0]; // obliczenie ostatniego x
		}
		
		for (int j = 1; j <= n - i; j++){
			wspol[j] = wspol[j] + xnas * wspol[j - 1]; //zastosowanie schematu hornera z cwiczenia nr 2
		}
		
		if (fabs(wspol[n - i]) > 0.1){ //sprawdzenie x czy jest pierwiasktiem
			pierw = i; 
			break;
		}
		pomoc[i] = xnas; //wpisanie pierwiastka do tablicy pomocniczej
	}
	
	std::cout<<"Ilosc iteracji: "<<ile<<"\n"<<std::endl;
	std::cout << "Ilosc pierwiastkow " << pierw << "\n" << std::endl;
	
	for (int j = 0; j < pierw; j++){
		std::cout << pomoc[j] << std::endl;
	}
	
	delete[] pomoc;
	delete[] y;
	delete[] wspol;
}