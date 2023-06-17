# Blood Donor

<!-- TABLE OF CONTENTS -->
## Spis treści

* [O projekcie](#o-projekcie)
* [Funkcje](#funkcje)
* [Użyte technologie](#użyte-technologie)
* [Przyszłe plany](#przyszle-plany)

<!-- ABOUT THE PROJECT -->
## O projekcie

Bezpośrednim celem projektu jest przygotowanie aplikacji mobilnej, która przy pomocy metod gamifikacji ma zachęcić dawców krwi i kandydatów na krwiodawców do regularnego oddawania krwi. Aplikacja włączy się do propagacji idei honorowego krwiodawstwa poprzez gamifikację procesu donacji oraz popularyzację akcji krwiodawstwa wśród kandydatów na krwiodawców. Dodatkową motywacją do oddawania krwi będzie wizualizacja postępów użytkownika w zakresie donacji, a także intuicyjne i szybkie dodawanie logów (donacji) krwi. Użytkownik otrzyma również wsparcie w okresach pomiędzy donacjami, poprzez udostępniane informacje o dacie kolejnej możliwej donacji. Dodatkową funkcjonalnością będzie również wyświetlanie aktualnych stanów grup krwi, tak aby krwiodawca znał aktualne niedobory krwi i jej składników w swoim regionalnym centrum krwiodawstwa i mobilizował kolejnych potencjalnych krwiodawców do donacji.

![alt text](https://github.com/goodwill-ninjas/ios/blob/main/Blood%20Donor%20App.gif)


## Funkcjonalności
   - **Strona główna** - użytkownik po uruchomieniu aplikacji może podejrzeć ilość oddanej krwi i datę następnej donacji
     - **Kalkulator donacji** - aplikacja na podstawie ostatnich donacji użytkownika wyświetla następną datę możliwej donacji danego typu.
   - **Ekran dodawania donacji i dyskwalifikacji** - użytkownik ma możliwość zapisa dokonanej donacji bądź dyskwalifikacji, z możliwością rozwinięcia formularza o dodatkowe informacje.
   - **Dziennik donacji** - ekran wyświetlający listę wszystkich dodanych donacji i dyskwalifikacji
   - **Logowanie i Rejestracja** - formularze pozwalające na rejestrację nowego użytkownika i zalogowanie do aplikacji.
   - **Lista placówek RCKiK** - aplikacja umożliwia dostęp do listy placówek RCKiK wraz ze stanami krwi.
     - **Szczegóły placówki** - wyświetlenie szczegółów adresowych i kontaktowych, a także wyświetlenie stanów krwi w formie graficznej.
   - **Profil użytkownika**	- przeglądanie profilu i odznak Użytkownika, a także możliwość sprawdzenia postępu w aktualnie odbywanej misji w aplikacji

## Użyte technologie

* Swfift
* SwiftUI
* Dekoder JWT(JSON Web Token) dla iOS, macOS - [JWTDecode](https://github.com/auth0/JWTDecode.swift).
* XCTest

## Przyszłe plany
* **Blokada na dodawanie przedwczesnych donacji** - system dokonuje sprawdzenia daty ostatniej donacji i weryfikuje datę wprowadzoną aktualnie przez Użytkownika pod kątem czasu, który upłynął od ostatniego pobrania krwi lub innego składnika.
* **Kalendarz donacji** - aplikacja prezentuje kalendarz, otwarty w aktualnym miesiącu. Przewijanie kalendarza wstecz i wprzód, pokazuje donacje w przeszłości jak i te przyszłe możliwe donacje w kolejnych miesiącach.
* **Przesyłanie powiadomień** - aplikacja przesyła Użytkownikowi powiadomienia o przypominające o nadchodzących terminach donacji.
* **Statystyki donacji Użytkownika** - użytkownik może przeglądać statystyki donacji w zakresach ilości donacji jak i ilości oddanej krwi i jej produktów.
* **Udostępnianie  treści w mediach społecznościowych** - aplikacja umożliwia udostępnienie treści w kontekście krwiodawczym w mediach społecznościowych.
* **Personalizacja Aplikacji** - aplikacja umożliwia wybór wersji kolorystycznej oraz zmianę awatarów Użytkownika.
