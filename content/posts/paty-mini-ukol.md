+++
date = '2025-11-15T16:10:45+02:00'
draft = false
title = 'Mini úkol 5'
+++

##### Návrh a programování obvodu s mikrokontrolerem

Pro tento mini úkol jsem se rozhodl navrhnout maketu obvodu, který bych mohl využít v mém semestrálním projektu, kde potřebuji nějaké uživatelské rozhraní se samotným zařízením. Pro účel tohoto mini úkolu jsem se rozhodl, že komunikace zařízení s uživatelem bude zprostředkována LCD displejem, potenciometrem, dvěma tlačítky a LED diodou. Na displeji bude zobrazen "tlak v pneumatikách" a optimální tlak, který je nastaven pomocí potenciometru. Jelikož v programu Tinkercad není manometr musel jsem ho nahradit potenciometrem. Dvě tlačítka slouží ke změně tlaku v nádrži a LED svítí pokud je "tlak v pneumatikách" stejný jako optimální tlak.

<img src="/267339_ZPC_2025/images/zapojenyobvod.png" alt="Hrubý schématický návrh systému" style="float">

Arduino kód:
```cpp
// maketa uživatelského rozhraní

// LCD piny: RS, DB5, DB4, DB3, DB2
#include <LiquidCrystal.h>
LiquidCrystal lcd(12, 11, 5, 4, 3, 2);

// funkce pro desetinná čísla
float mapFloat(float x, float in_min, float in_max, float out_min, float out_max) {
  return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}

// piny
int MANOMETR = A1;
int OPT_TLAK = A0;
int PLUS_TLAK = 7;
int MINUS_TLAK = 8;
int LED = 13;

// systém
unsigned long t;

unsigned long posledniZobrazeni = 0;
bool zpravaZobrazena = false;
int PERIODA_ZPRAVY = 1500;
int PERIODA_bezZPRAVY = 5000;

unsigned long posledniZmena_PLUS = 0;
unsigned long posledniZmena_MINUS = 0;

// tlačítka
bool NATLAKOVANI = false;
bool UPUSTITTLAK = false;
float DELTA_TLAK = 0.0; // integer odpovídající NATLAKOVÁNÍ + UPUSTITTLAK
int INTERVAL_ZMENY = 500; // čas za, který se ubere/přidá hodnota

// "manometr"
int MANOMETR_VAL;
float TLAK_NADOBY;
float TLAK_NADOBYzaokr;
float TLAK_NADOBYzaokr_DELTA;

// nastavení optimálního tlaku
float POT_OPT;
float TLAK_OPTIMALNI;
float TLAK_OPTIMALNIzaokr;

void setup()
{
  //setup pinů a lcd
  pinMode (PLUS_TLAK, INPUT_PULLUP);
  pinMode (MINUS_TLAK, INPUT_PULLUP);
  pinMode (LED, OUTPUT);
  lcd.begin(16, 2);
  lcd.print("Startuji");
  delay(1000);
  lcd.clear();
}

void loop()
{
  t = millis();
  
  // přečtení a mapování hodnoty "manometru" na příslušné jednotky (bary)
  MANOMETR_VAL = analogRead(MANOMETR);
  float TLAK_NADOBY = mapFloat(MANOMETR_VAL, 0, 1023, 0.0, 5.0);
  float TLAK_NADOBYzaokr = round(TLAK_NADOBY*10.0)/10.0; //zaokrouhlení hodnoty na 1 desetinné místo
  
  // přečtení a mapování hodnoty potenciometru pro nastavení optimálního tlaku na příslušné jednotky (bary)
  POT_OPT = analogRead(OPT_TLAK);
  float TLAK_OPTIMALNI = mapFloat(POT_OPT, 0, 1023, 0, 5);
  float TLAK_OPTIMALNIzaokr = round(TLAK_OPTIMALNI*10.0)/10.0; //zaokrouhlení hodnoty na 1 desetinné místo
  
  // stav tlačítek
  NATLAKOVANI = !digitalRead(PLUS_TLAK);
  UPUSTITTLAK = !digitalRead(MINUS_TLAK);
  
  // pokud je zmačknuto natlakování k delta se přídává 0.1 každý interval
  if ((NATLAKOVANI == HIGH) && (t - posledniZmena_PLUS >= INTERVAL_ZMENY)) {
    DELTA_TLAK += 0.1;
    posledniZmena_PLUS = t;
  	}
  
  // pokud je zmačknuto upustittlak od delta se odebírá 0.1 každý interval
  if ((UPUSTITTLAK == HIGH) && (t - posledniZmena_MINUS >= INTERVAL_ZMENY)) {
    DELTA_TLAK -= 0.1;
    posledniZmena_MINUS = t;
  	}
  
  // sečtení delta a tlaku nadoby
  TLAK_NADOBYzaokr_DELTA = TLAK_NADOBYzaokr + DELTA_TLAK;
  
  // zobrazení zprávy Nastavení tlaku
  if (!zpravaZobrazena && (t - posledniZobrazeni >= PERIODA_bezZPRAVY)){
    lcd.clear();
    lcd.setCursor(0, 0);
  	lcd.print("Nastaveni tlaku"); // uvede funkci zařízení
    zpravaZobrazena = true;
    posledniZobrazeni = t; // reset časovače
    }  
  
  // odstranění zprávy a zobrazení tlaků
  if (zpravaZobrazena && (t - posledniZobrazeni >= PERIODA_ZPRAVY)){
    lcd.clear();
    
    // zobrazení řádku s tlakem
    lcd.setCursor(0, 0);
    lcd.print("Tlak:");
    lcd.setCursor(10, 0);
    lcd.print(TLAK_NADOBYzaokr_DELTA, 1);
    lcd.setCursor(13, 0);
    lcd.print("bar");
    
    // zobrazení řádku s optimálním tlakem
    lcd.setCursor(0, 1);
    lcd.print("Opt.tlak:");
    lcd.setCursor(10, 1);
    lcd.print(TLAK_OPTIMALNIzaokr, 1);
    lcd.setCursor(13, 1);
    lcd.print("bar");
    
    zpravaZobrazena = false;
    posledniZobrazeni = t; // reset časovače
  	}  
  
  // zobrazení tlaků pro ostatní cykly
  if (!zpravaZobrazena){
    
    // zobrazení řádku s tlakem
  	lcd.setCursor(0, 0);
    lcd.print("Tlak:");
    lcd.setCursor(10, 0);
    lcd.print(TLAK_NADOBYzaokr_DELTA, 1);
    lcd.setCursor(13, 0);
    lcd.print("bar");
    
    // zobrazení řádku s optimálním tlakem
    lcd.setCursor(0, 1);
    lcd.print("Opt.tlak:");
    lcd.setCursor(10, 1);
    lcd.print(TLAK_OPTIMALNIzaokr, 1);
    lcd.setCursor(13, 1);
    lcd.print("bar");
    }
  
  // uprava hodnot pro lepší porovnání
  int tlak_nadoby = int(TLAK_NADOBYzaokr_DELTA*10);
  int tlak_optimalni = int(TLAK_OPTIMALNIzaokr*10);
  
  // rozsvícení LED, když je tlak v nadobě = optimálnímu tlaku
  if (tlak_nadoby == tlak_optimalni){
  	digitalWrite(LED, HIGH);
    }else{
    digitalWrite(LED, LOW);
    }
}
```

Odkaz na Tinkercad návrh: https://www.tinkercad.com/things/iEnRcbqYND6-glorious-blad/editel?returnTo=https%3A%2F%2Fwww.tinkercad.com%2Fdashboard