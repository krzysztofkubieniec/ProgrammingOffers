ALTER DATABASE programming_offers DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci;

INSERT INTO `programming_language` VALUES (1,'Java'),(2,'C#'),(3,'Javascript'),(4,'C++'),(5,'mySQL'),(6,'PostgreSQL'),(7,'HTML');

INSERT INTO `category` VALUES (1,'test','Strony internetowe'),(2,'test1','Serwisy, portale'),(3,'test2','Bazy danych'),(4,'test3','Grafika komputerowa'),(5,'test4','Pozycjonowanie stron');

INSERT INTO `role` VALUES (1,'Contractor with permission to add offers','contractor'),(2,'','admin');

INSERT INTO `user` VALUES (1,NULL,'2019-01-15 13:21:49','test@gmail.com','Andrzej','Kowalski','test','$2a$10$Ggd5QfGXuOVG8qiSNQoSpebQYxzJEbwQsZ6iWxa/nj/ntBYQJOLLS','123456798'),(2,NULL,'2019-01-15 13:21:49','test2@gmail.com','Donald','Trump','test2','$2a$10$Ggd5QfGXuOVG8qiSNQoSpebQYxzJEbwQsZ6iWxa/nj/ntBYQJOLLS','666666666'),(3,NULL,'2019-01-15 13:21:49','test3@gmail.com','Marianna','Sosnowska','test3','$2a$10$Ggd5QfGXuOVG8qiSNQoSpebQYxzJEbwQsZ6iWxa/nj/ntBYQJOLLS','423234234'),(4,NULL,'2019-01-15 13:21:49','test4@gmail.com','Robert','Lewandowski','test4','$2a$10$Ggd5QfGXuOVG8qiSNQoSpebQYxzJEbwQsZ6iWxa/nj/ntBYQJOLLS','654987321');

INSERT INTO `orders` VALUES (NULL,'Zlecę projekt procesu tworzenia raportów z wykorzystaniem języka SQL. Termin skorzystania z oferty możliwy od zaraz. Proszę o oferty',NOW() - INTERVAL 1 DAY,NOW() + INTERVAL 5 HOUR,'Projekt procesu tworzenia raportów z wykorzystaniem języka SQL',NULL,1,NULL),(NULL,'Aplikacja umożliwia słuchanie kanałów Radia Chrześcijanin. Jest tylko jeden problem, że po ok. 5-10 minutach słuchania zatrzymuje się. Chcąc słuchać dalej, należy ponownie kliknąć play.Zapytanie dotyczy usunięcia tego problemu.',NOW() - INTERVAL 1 DAY,NOW() + INTERVAL 1 DAY,'Zlecenia na modyfikację aplikacji mobilnej',NULL,2,NULL),(NULL,'Stworzenie aplikacji która będzie obsługiwać rowery/hulajnogi elektryczne (GPS, pobór opłat od abonentów itd.)',NOW() - INTERVAL 1 DAY,NOW() + INTERVAL 7 DAY,'Zlecenia na programowanie od nowa aplikacji mobilnej',NULL,1,NULL),(NULL,'poszukuje osoby, która na stałe podejmie się od strony programistycznej (WebAPI)',NOW() - INTERVAL 1 DAY,NOW() + INTERVAL 7 DAY,'Poszukuję programisty',NULL,1,NULL),(NULL,'wykonanie platformy i bazy danych dla klientów',NOW() - INTERVAL 1 DAY,NOW() + INTERVAL 2 DAY,'Zlecenia na programowanie od nowa bazy danych',NULL,1,NULL),(NULL,'Zlecę wykonanie obrazków tematycznych na stronę internetową/ facebooka. Tematyka wielkanocna, karnawałowa, walentynkowa, dzień kobiet, dzień mężczyzn, tłusty czwartek. Motywem przewodnim ma być żaba.',NOW() - INTERVAL 1 DAY,NOW() + INTERVAL 7 DAY,'Wykonanie obrazków tematycznych na stronę internetową',NULL,3,NULL),(NULL,'- dodanie załącznika do istniejącej strony kosmetycznej - sprzedaż urządzeń, zaprojektowanie katalogu do tych samych urządzeń, wydruk katalogu',NOW() - INTERVAL 1 DAY,NOW() + INTERVAL 7 DAY,'Zlecenie dla grafika komputerowego',NULL,1,NULL),(NULL,'Zlecę napisanie programu w C, algorytm Problem wydawania reszty, ale musi to być metoda brute force. Nie zachłanna, ani nie programowanie dynamiczne.',NOW() - INTERVAL 1 DAY,NOW() + INTERVAL 3 DAY,'Napisanie programu w C, algorytm Problem wydawania reszty',NULL,4,NULL),(NULL,'Firma, która intensyfikuje swoje działania w kierunku działalności deweloperskiej poszukuje wykonawcy strony internetowej stanowiącej portfolio swoich inwestycji. Zapytanie dotyczy – na ten moment 5 inwestycji mieszkalnych (2 etap inwestycji – 6 lokali mieszkalnych (3 „bliźniaki”) oraz 3 etap 196 lokali mieszkalnych), 9 lokali mieszkalnych w rewitalizowanej kamienicy, 6 apartamentów w przyszłości 120 działek wraz z lokalami mieszkalnymi. Poza funkcjonalnością jaką będzie prezentacja danej inwestycji – lokalizacja, cechy, opis etc. , wyszukiwarka mieszkań, istotnym elementem będzie interaktywne pole rezerwacji lokali na stronie – wyszukiwarka graficzna/makieta/aplikacja VR - po najechaniu kursorem na dany lokal – wyświetlą się adekwatne statusy nieruchomości tj. dostępny – „opcja rezerwuj oraz szczegóły”, rezerwacja oraz niedostępny – analogicznie do np. Zainteresowanych proszę o przedstawienie oferty 2 rozwiązań: -stworzenie pełnej strony internetowej wraz z interaktywnym modułem- Stworzenie interaktywnego, wyżej opisanego, modułu do umieszczenia na własnej stronie internetowej',NOW() - INTERVAL 1 DAY,NOW() + INTERVAL 4 DAY,'Zlecę wykonanie strony www i aplikacji VR nieruchomości',NULL,3,NULL),(NULL,'Zlecę dodawanie pruduktów (mebli, dodatków do mebli) do internetowego sklepu meblowego opartego na serwisie Magento.Praca polega na wprowadzaniu nowych produktów wraz z atrybutami: wymiary, cena, waga (znajdują się na stronach naszych producentów) oraz na utworzeniu krótkiego opisu do każdego produktu, ok. 4/5 zdań – dlatego poszukujemy osoby z umiejętnościami copywriterskimi.Odpowiednio obrobione w programie zdjęcia mamy już przygotowane w drzewie plików.Do dodania kilka tysięcy produktów w przeciągu najbliższych 2/3 miesięcy.',NOW() - INTERVAL 1 DAY,NOW() + INTERVAL 5 DAY,'Dodawanie produktów do internetowego sklepu meblowego',NULL,1,NULL),(NULL,'Zlecę zrobienie strony wizytówki na asap , grafiki są gotowe teksty też tylko wszystko przekleić najlepiej zebby byla na prostym szablonie , mam na to taki budzet jedynie także prosze o kontakt tylko osoby które są zainteresowane taką kwotą',NOW() - INTERVAL 1 DAY,NOW() + INTERVAL 6 DAY,'Prosta strona wizytówka gotowe teksty i grafiki tylko skleić',NULL,2,NULL),(NULL,'Zlecę zrobienie stronę internetowej ze szkoleniami online. Będa one w formie wideo jak i tekstowej które będą dostępne na stronie. Strona w bardzo prostej formie, strona główna z informacjami o szkoleniach i grafikami oraz blog. Każdy po zakupie szkolenia będzie miał możliwość zalogowania się do swojego panelu. W panelu tym dostępne będzie 30 lekcji dostępnych na serwerze strony. Użytkownik będzie miał możliwość wymiany wiadomości ze mną. Lekcje ponumerowane w pionowej tabelce po kliknięciu ukazuje się wideo na serwerze strony a nad nim i pod wideo mój tekst. Do tego możliwość dołączenia do grupy na Facebooku. Chciałbym aby istniała także możliwość dodania wideo/zdjęcia  w wymianie wiadomości. Po kliknięciuknięciu w przycisk odpowiadający za kupno szkolenia ukażą się 3 opcje. Ćwiczenia, konsultacja Skype oraz szkolenie indywidualne . W tych dwóch ostatnich kupujący ma do wypełnienia ankietę w której napisze jaki ma problem. Użytkownik wypełnia formularz i może kupić je poprzez dotpay, przelew i PayPal. . Strona wizualnie w klimatach strony Mateusza Grzesiaka. Im prostsza tym lepsza. Na stronie głównej nowe osoby widzą tylko stronę głowną i blog. Blog w prostej formie tekstowej z możliwością dodawania załączników. Na stronie głownej banner z opisem szkoleń i z możliwością zakupu, pod nim kolejny banner z tekstem i darmową pierwszą lekcją. Uśżytkownik po kliknięciu w przycisk kup szkolenie do wyboru ma 3 opcje, każda z inną ceną i opisem. Po wyborze opcji użytkownik wypełnia profil użytkownika, nick, imię, lokalizacja (ale nie musi jej wypełniać), dotychczasowe doświadczenie (nie musi wypełniać), akceptuje regulamin, przechodzi do płatności i po zaksięgowaniu płatności tworzy się jego profil, który jest wazny bezterminowo, jedynie możliwość wymiany wiadomości od tej pory jest ważna 30 dni. Po upływie 30 dni w miejscu napisania wiadomości pojawia się przycisk (przedłuż abonament), gdzie po zaksięgowaniu płatności może przedłużyć go o kolejno 30 dni, 6 miesięcy, rok. Użytkownik który korzysta z darmowej lekcji tworzy w taki sam sposób konto z pominięciem płatności i dostaje dostęp do 1 lekcji, bez dostępu grupy na fb, wymiany wiadomości. Pod nią przycisk "kup abonament".  Wymiana wiadomosci w prosty sposób albo jak w messengerze. Możliwość wymiany wiadomości tylko dla zarejestrowanych tzn dla tych którzy zapłacili za usługę, dołączenie na grupę to zwykły likebox.',NOW() - INTERVAL 1 DAY,NOW() + INTERVAL 7 DAY,'Strona internetowa ze szkoleniami',NULL,4,NULL),(NULL,'Zlęcę import danych do wordpressa z pliku xml do szablonu. Szablon zakupiony na themeforest. Import danych nie wykonuje się poprawnie. Wgrywane są dane ale obrazy nie. Adresy plików obrazów w pliku xml są poprawne.',NOW() - INTERVAL 1 DAY,NOW() + INTERVAL 8 DAY,'Import danych z pliku do wordpress',NULL,1,NULL),(NULL,'Zlecę wykonanie stworzenia strony, internetowje, czatu internetowego.. Wchodzimy logujemy się, piszemy z innymi osobami, zapraszamy na priv, wysylamy zdjecia, itp (bardziej rozbudowany interfejs , plus opcje,) oraz nadawanie wlasnego obrazu z kamerki. Mozliwosc umieszczenia reklamy, pewnych opcji płatnych. Pod w/w witryne chcialbym podpiac forum, na ktorym uzytkownicy mogliby zakladac wlasne tematy do rozmow. Pozniejsza wspolpraca z wykonawca, usuwanie usterek, nanoszenie poprawek, obsluga serwisu. Witryna powinna byc obslugiwana przez popularne przegladarki. Forme platnosci za wykonanie zlecenia proponuje wystawienie wczesniej aukcji specjalnie dla mnie, na ktorej klikam kup teraz. Po zakonczonym projekcie nastepuje zaplata za calosc, lub spisanie wczesniej umowy. Jakakolwiek mozliwa dostepna forma platnosci, bez zaliczek.   Nie wplacam zaliczek.',NOW() - INTERVAL 1 DAY,NOW() + INTERVAL 9 DAY,'Komunikator internetowy, czat, strona www c++ programista php java',NULL,3,NULL),(NULL,'Zlęcę import danych do wordpressa z pliku xml do szablonu. Szablon zakupiony na themeforest. Import danych nie wykonuje się poprawnie. Wgrywane są dane ale obrazy nie. Adresy plików obrazów w pliku xml są poprawne.',NOW() - INTERVAL 1 DAY,NOW() + INTERVAL 10 DAY,'Import danych z pliku do wordpress',NULL,1,NULL),(NULL,'Szukamy wykonawcy systemu do sterowania prezentacją za pomocą gestów - mogą być wykorzystane znaczniki aktywne lub pasywne, ale musi to dać się założyć prezenterowi w sposób mało inwazyjny. Dla zobrazowania ułożenia lokalizacji ekranu najlepiej podać przykład kina. Mamy publiczność, scenę, ekran. Takie same warunki planujemy tutaj. Publiczność, Scena na której mamy prelegenta z czujnikami a za nim ekran LED, powierzchnia min. 4 x 2m. Sterowanie obrazem na ekranie za pomocą gestów powinno działać do 12m od ekranu na szerokości 10m.',NOW() - INTERVAL 1 DAY,NOW() + INTERVAL 11 DAY,'System sterowania gestami',NULL,2,NULL),(NULL,'Zlecę dorobienie responsywności w działającym serwisie ogłoszeni owym. Proszę o oferty. Ponadto, ponieważ większość ofert jest wysyłana bez przeczytania zlecenia podaję, że mój kot ma na imię Miki - proszę koniecznie w ofercie to wspomnieć. Kod jest napisany w gołym PHP z umiarkowanym użyciem JS oraz CSS, w standardzie MVC. Liczę na miłą i korzystną dla obu stron współpracę',NOW() - INTERVAL 1 DAY,NOW() + INTERVAL 12 DAY,'Przerobienie serwisu ogłoszeniowego na RWD - tylko z doświadczeniem',NULL,4,NULL),(NULL,'Zlecimy obsługę informatyczną firmy dotyczącą narzędzi sprzedaży e-commerce, interesuje nas długofalowa współprca, abonament miesięczny. Przybliżony zakres działań:- postawienie sklepów internetowych (Magento, Presta, inne ew. wg propozycji o ile ciekawe) - w tym multisklepy,- integracja sklepów z hurtowniami - dostawcami, ebay, allegro, fb, marketplace''s- integracja z programem magazynowym (SQL),- pozycjonowanie, social media itp dodatkowo:- wprowadzanie produktów (dajemy zdjęcia, lub zdjęcia i opis, jeśli produkt unikalny),- wystawianie aukcji allegro, ebay, marketplace, porównywarki cen, inne rozwiązania wg propozycji.Do zadań Zleceniobiorcy będzie należało dbanie o sprawne udostępnianie oferty online, oraz jej promowanie w internecie za pomocą uzgodnionych narzędzi.Oferty z portfolio, dodatkowe pytania proszę wysyłać na email: pozyczkowy (malpa) gmail.com . Szczegły wyślemy mailem zwrotnym. Budzet do ustalenia.',NOW() - INTERVAL 1 DAY,NOW() + INTERVAL 13 DAY,'Sprzedaż e-commerce, sklep internetowy, pozycjonowanie',NULL,1,NULL),(NULL,'Zlecę wykonanie licznika odwiedzin do spacerów wirtualnych. Przykład spaceru: http://multimedialnespacery.pl/folwarkhutta/spacer.html Licznik powinien być widoczny na wierzchu spaceru oraz posiadać możliwość przesówania go w osiach x i y(w kodzie). Przykładowy spacer: multimedialnespacery.pl/test/s pacer.html Pliki spaceru do pobrania : multimedialnespacery.pl/Downlo ad/test.rar Spacer działa wyłącznie ONLINE. Offline można po prostu spojrzeć w pliki',NOW() - INTERVAL 1 DAY,NOW() + INTERVAL 14 DAY,'Licznik odwiedzin',NULL,1,NULL),(NULL,'Dzień dobry, Szukam programistów potrafiących realizować zmiany wizualno-funkcjonalne w sklepach opartych o silniki Shoper. Interesuje mnie stała współpraca z osobami/firmami mogącymi wystawiać faktury VAT23 oraz nie mają problemu z podpisaniem NDA.',NOW() - INTERVAL 1 DAY,NOW() + INTERVAL 15 DAY,'Programista Shoper',NULL,1,NULL),(NULL,'Zlecę wykonanie serwisu/systemu on-line, który umożliwi mi gromadzenie informacji nt. danych kontaktowych i zapytań, które otrzymujemy od naszych Klientów. Całość powinna być wykonana wg naszych szczegółowych wytycznych. Będzie to coś w formie CRM tylko stworzony konkretnie dla nas. Chcemy, aby posiadał funkcje dodatkowe jak np. opcję przypomnienia co kilka dni czy oznaczania jako temat zakończony. Główne zadania programu to: tworzenie bazy danych Klientów i ich zapytań - chcę mieć dostęp on-line, przypominanie o niezrealizowanym zapytaniu - pracownik musi dostawać przypomnienie o ponownym kontakcie za określoną ilosć dni, gromadzeniu danych nt. przebiegu współpracy - chcę mieć dostęp do każdego zapytania, które wprowadził mój pracownik do systemu, kontroli pracowników „otwartych tematów” Szczegółową rozpiskę nt. moich oczekiwań wyślę na maila osobom zainteresowanym.',NOW() - INTERVAL 1 DAY,NOW() + INTERVAL 9 HOUR,'Zlecę napisanie programu do zarządzania klientami',NULL,1,NULL),(NULL,'Zlecę wykonanie przelicznika z promili na mg/L',NOW() - INTERVAL 1 DAY,NOW() + INTERVAL 15 DAY,'przelicznik z promili na mg/L',NULL,1,NULL),(NULL,'Zlecę wykonanie katalogu firm. Podstawowe moduły:1. Nazwa firmy 2. Logo firmy. 3. Kategorie do wyboru. Jedna kategoria jest darmowa oraz obowiązkowa. Pod kategoriami dajemy opcje dodaj do kolejnej kategorii płatne (do ustawienia w adminie)zł miesięcznie ( ustawienie cen proszę dodać w adminie mogą się zmieniać) użytkownik może dodać firmę do dowolnej liczmy kategorii oczywiście każda kolejna płatna (do ustawienia w adminie)zł. 4. Opis firmy 5. Adres siedziby z mapą pozostaje bez zmian. 6. Godziny pracy. 7. Galerie możliwość dodania zdjęcia każde płatne (do ustawienia w adminie)zł miesięcznie. 8 Opcja „polecane firmy” z informacja ze firma będzie pokazywana jako polecana na górze listy firm w kategorii płatne (do ustawienia w adminie)zł miesięcznie 9. Opcja firma na stronie głównej płatne (do ustawienia w adminie)zł miesięcznie. 10. Prezentacja wideo z możliwością wklejenia filmu z youtube płatne (do ustawienia w adminie)zł miesięcznie. 11. Import oferty z XML płatne (do ustawienia w adminie)gr. miesięcznie (to co jest tylko to dodać tu Każdą z tych opcji można włączyć i wyłączyć w każdej chwili dlatego płatności musza być pobierane za każdy element oddzielnie funkcja odpalana z crona. -  Widok na mapce google (dostosowanej graficznie) - Opcja wysuwającego zaczepiacza, czyli po 10 sekundach oglądania oferty firmy wysunie się okienko z widgetem z odpowiednią formułką.',NOW() - INTERVAL 1 DAY,NOW() + INTERVAL 15 DAY,'Zlecę wykonanie katalogu firm.',NULL,2,NULL);

INSERT INTO `orders_category` VALUES (1,1),(2,2),(2,3),(3,3),(3,4),(4,1),(5,2),(6,1),(7,5),(8,4),(9,3),(9,5),(10,1),(10,2),(11,5),(12,5),(13,4),(13,4),(14,3),(15,5),(16,4),(17,3),(17,5),(17,2),(18,3),(18,2),(19,5),(20,5),(21,2),(22,3),(23,4);

INSERT INTO `orders_programming_language` VALUES (1,1),(2,2),(2,3),(3,3),(3,4),(4,2),(5,1),(6,1),(7,5),(8,6),(9,7),(9,5),(10,3),(10,5),(11,4),(12,5),(13,2),(13,4),(14,3),(15,1),(16,4),(17,3),(17,5),(17,2),(18,4),(18,2),(19,5),(20,5),(21,3),(22,3),(23,4);