CREATE DATABASE DoenerSHOP248;
USE DoenerSHOP248;
create table Kunden (
kundenID int IDENTITY(1,1) PRIMARY KEY,
VName varchar(255) NOT NULL,
NName varchar(255) NOT NULL,
eMail varchar(255) NOT NULL,
PLZ int NOT NULL,
Ort varchar(255) NOT NULL,
Straße varchar(255) NOT NULL,
Hausnummer int NOT NULL,
);


CREATE TABLE Lieferant(
lieferantID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
Name varchar(255) NOT NULL,
) ;

CREATE TABLE Auftrag(
auftragID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
kundenID int NOT NULL,
lieferantID int NOT NULL ,
Kommentar varchar(255) NOT NULL,
Auftragsdatum date NOT NULL,
bezahlungsID int NOT NULL,
) ;


-----------------------------------------------------------------------------

--------------------------------------------------------------------------------


CREATE TABLE Bezahlungsart(
bezahlungsID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
Bezahlungsart varchar(255) NOT NULL,
) ;

CREATE TABLE Warenkorb(
warenkorbID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
menueID int,
angebotID int,                                     
auftragID int
);


--------------------------------------------------------------------------------

--------------------------------------------------------------------------------


CREATE TABLE MENUE(
menueID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
Beschreibung varchar(255) NOT NULL,
MenuePreis money NOT NULL,
) ;

CREATE TABLE Angebotsbox(
akorbID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
menueID int NOT NULL,
angebotID int NOT NULL,
) ; 


--------------------------------------------------------------------------------

--------------------------------------------------------------------------------


CREATE TABLE Angebote(
angebotID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
Name varchar(255) NOT NULL,
Beschreibung varchar(255) NOT NULL,
APreis money NOT NULL,
Kalorien int NOT NULL,

) ;


CREATE TABLE Getraenke(
angebotID int NOT NULL,
Preis money NOT NULL,
Menge int NOT NULL,
zutLieferantID int NOT NULL,
) ;


CREATE TABLE Gerichte(
angebotID int PRIMARY KEY NOT NULL,
gerichteRef int,

);



CREATE TABLE Rezept(
rezeptID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
angebotID int NOT NULL,
zutatID int NOT NULL,
Menge int NOT NULL,
) ;

Create Table Zutat(
zutatID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
name varchar(255) NOT NULL,
)

CREATE TABLE Zutaten(
zutatenID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
zutLieferantID int NOT NULL,
lagerortID int NOT NULL ,
zutatID int References Zutat(zutatID),
zutPreis money NOT NULL,
Menge int NOT NULL,
Ablaufdatum date NOT NULL,

) ;






CREATE TABLE Lagerorte(
lagerortID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
Name varchar(255) NOT NULL,
) ;


CREATE TABLE ZutLieferanten(
zutLieferantID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
Name varchar(255) NOT NULL,
) ;

SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Kunden'
--------------------------------------------------------------------------------
ALTER TABLE Auftrag ADD FOREIGN KEY (kundenID) REFERENCES Kunden(kundenID)

ALTER TABLE Auftrag ADD FOREIGN KEY (lieferantID) REFERENCES Lieferant(lieferantID)

ALTER TABLE Auftrag ADD FOREIGN KEY (bezahlungsID) REFERENCES Bezahlungsart(bezahlungsID)


ALTER TABLE Warenkorb ADD FOREIGN KEY (menueID) REFERENCES Menue(menueID)

ALTER TABLE Warenkorb ADD FOREIGN KEY (angebotID) REFERENCES Angebote(angebotID)

ALTER TABLE Warenkorb ADD FOREIGN KEY (auftragID) REFERENCES Auftrag(auftragID)


ALTER TABLE Angebotsbox ADD FOREIGN KEY (menueID) REFERENCES Menue(menueID)

ALTER TABLE Angebotsbox ADD FOREIGN KEY (angebotID) REFERENCES Angebote(angebotID)


ALTER TABLE Getraenke ADD FOREIGN KEY (angebotID) REFERENCES Angebote(angebotID)

ALTER TABLE Getraenke ADD FOREIGN KEY (zutLieferantID) REFERENCES ZutLieferanten(zutLieferantID)


ALTER TABLE Gerichte ADD FOREIGN KEY (angebotID) REFERENCES Angebote(angebotID)

ALTER TABLE Gerichte ADD FOREIGN KEY (gerichteRef) REFERENCES Gerichte(angebotID)


ALTER TABLE Zutaten ADD FOREIGN KEY (zutLieferantID) REFERENCES ZutLieferanten(zutLieferantID)

ALTER TABLE Zutaten ADD FOREIGN KEY (lagerortID) REFERENCES Lagerorte(lagerortID)


ALTER TABLE Rezept ADD FOREIGN KEY (angebotID) REFERENCES Gerichte(angebotID)

ALTER TABLE Rezept ADD FOREIGN KEY (zutatID) REFERENCES Zutat(zutatID)

INSERT INTO Lieferant VALUES ('Alena Schlüter GmbH & Co. KG'), ('Alica Ziggy GmbH & Co. KG'), ('Harper Ziggy GmbH'), ('Alexsandra Petri KG'), ('Harsh Otte e.K'), ('Hartmut Kischew GmbH & Co. KG'), ('Alexa Siemens GmbH & Co. KG'), ('Hardi Kischew KG'), ('Alessa Otte GmbH & Co. KG'), ('Harald Siemens KG'), ('Alexsandra Ziggy GmbH'), ('Harsh Kraut e.K'), ('Hanini Müller GmbH & Co. KG'), ('Hannes Schmidt e.K'), ('Alena Petrl GmbH & Co. KG')

INSERT INTO  Bezahlungsart VALUES ('PayPal'),('Barzahlung'),('Girokarte'),('Kreditkarte'),('Paydirekt')

insert into Kunden(VName, NName, eMail, PLZ, Ort, Straße, Hausnummer) values ('Ahmed','Ortmann', 'AhmedOrtmann@web.de', '35669', 'Sonneberg', 'Schusterweg', '19')
insert into Kunden(VName, NName, eMail, PLZ, Ort, Straße, Hausnummer) values ('Marie','Kallert', 'MarieKallert@gmail.com', '39644', 'Weißwasser', 'Wladimir-Steinberg-Weg', '02')
insert into Kunden(VName, NName, eMail, PLZ, Ort, Straße, Hausnummer) values ('Verena','Gnatz', 'VerenaGnatz@web.de', '99795', 'Kelheim', 'Ernststraße', '21')
insert into Kunden(VName, NName, eMail, PLZ, Ort, Straße, Hausnummer) values ('Friedlinde','Weitzel', 'FriedlindeWeitzel@web.de', '03394', 'Gräfenhainichen', 'Eckbauerstraße', '05')
insert into Kunden(VName, NName, eMail, PLZ, Ort, Straße, Hausnummer) values ('Irmtraud','Hübel', 'IrmtraudHübel@gmx.de', '31225', 'Schongau', 'Eigenwilligplatz', '22')
insert into Kunden(VName, NName, eMail, PLZ, Ort, Straße, Hausnummer) values ('Sophia','Möchlichen', 'SophiaMöchlichen@aol.de', '77812', 'Wurzen', 'Schachtstraße', '07')
insert into Kunden(VName, NName, eMail, PLZ, Ort, Straße, Hausnummer) values ('Kai-Uwe','Schönland', 'Kai-UweSchönland@yahoo.de', '42517', 'Jüterbog', 'Edwin-Röhricht-Straße', '28')
insert into Kunden(VName, NName, eMail, PLZ, Ort, Straße, Hausnummer) values ('Felizitas','Sauer', 'FelizitasSauer@googlemail.com', '22876', 'Eichstätt', 'Ullrichstr.', '06')
insert into Kunden(VName, NName, eMail, PLZ, Ort, Straße, Hausnummer) values ('Inge','Buchholz', 'IngeBuchholz@gmail.com', '47199', 'Bad Liebenwerda', 'Alan-Hesse-Weg', '06')
insert into Kunden(VName, NName, eMail, PLZ, Ort, Straße, Hausnummer) values ('Hans-Rudolf','Etzler', 'Hans-RudolfEtzler@aol.de', '12858', 'Dinslaken', 'Andersstraße', '05')
insert into Kunden(VName, NName, eMail, PLZ, Ort, Straße, Hausnummer) values ('Hans-J.','Schweitzer', 'Hans-J.Schweitzer@gmx.de', '53971', 'Burgdorf', 'Hans-Martin-Pruschke-Platz', '16')
insert into Kunden(VName, NName, eMail, PLZ, Ort, Straße, Hausnummer) values ('Luis','Hänel', 'LuisHänel@googlemail.com', '43147', 'Gardelegen', 'Klemtallee', '15')
insert into Kunden(VName, NName, eMail, PLZ, Ort, Straße, Hausnummer) values ('Felicitas','Hendriks', 'FelicitasHendriks@hotmail.de', '04010', 'Hannover', 'Katja-Patberg-Gasse', '01')
insert into Kunden(VName, NName, eMail, PLZ, Ort, Straße, Hausnummer) values ('Fernando','Renner', 'FernandoRenner@hotmail.de', '83896', 'Oranienburg', 'Junckengasse', '01')
insert into Kunden(VName, NName, eMail, PLZ, Ort, Straße, Hausnummer) values ('Alfredo','Kreusel', 'AlfredoKreusel@web.de', '56679', 'Gransee', 'Wagnerstr.', '19')
insert into Kunden(VName, NName, eMail, PLZ, Ort, Straße, Hausnummer) values ('Harald','Zimmer', 'HaraldZimmer@gmail.com', '07822', 'Meppen', 'Jockelstraße', '31')
insert into Kunden(VName, NName, eMail, PLZ, Ort, Straße, Hausnummer) values ('Vinko','Tschentscher', 'VinkoTschentscher@web.de', '69193', 'Neuruppin', 'Blümelstraße', '06')
insert into Kunden(VName, NName, eMail, PLZ, Ort, Straße, Hausnummer) values ('Klaus-Dieter','Speer', 'Klaus-DieterSpeer@hotmail.de', '95249', 'Hoyerswerda', 'Stiffelstraße', '08')
insert into Kunden(VName, NName, eMail, PLZ, Ort, Straße, Hausnummer) values ('Astrid','Franke', 'AstridFranke@web.de', '17554', 'Ilmenau', 'Niels-Höfig-Allee', '05')
insert into Kunden(VName, NName, eMail, PLZ, Ort, Straße, Hausnummer) values ('Zlatko','Rohleder', 'ZlatkoRohleder@yahoo.de', '16243', 'Neustadtm Rübenberge', 'Vladimir-Käster-Allee', '06')
insert into Kunden(VName, NName, eMail, PLZ, Ort, Straße, Hausnummer) values ('Agathe','Ladeck', 'AgatheLadeck@gmail.com', '30803', 'Bamberg', 'Ioannis-Löffler-Gasse', '14')
insert into Kunden(VName, NName, eMail, PLZ, Ort, Straße, Hausnummer) values ('Polina','Hermann', 'PolinaHermann@gmail.com', '47073', 'Ahaus', 'Gotthardplatz', '29')
insert into Kunden(VName, NName, eMail, PLZ, Ort, Straße, Hausnummer) values ('Lilli','Mans', 'LilliMans@aol.de', '26210', 'Grevesmühlen', 'Klaus Dieter-Kallert-Ring', '28')
insert into Kunden(VName, NName, eMail, PLZ, Ort, Straße, Hausnummer) values ('Helen','Bolzmann', 'HelenBolzmann@hotmail.de', '59569', 'Kleve', 'Pölitzgasse', '01')
insert into Kunden(VName, NName, eMail, PLZ, Ort, Straße, Hausnummer) values ('Ina','Kambs', 'InaKambs@web.de', '82736', 'Hoyerswerda', 'Gerard-Röhricht-Gasse', '13')
insert into Kunden(VName, NName, eMail, PLZ, Ort, Straße, Hausnummer) values ('Mehmet','Koch', 'MehmetKoch@googlemail.com', '03611', 'Dieburg', 'Valeria-Wiek-Platz', '02')
insert into Kunden(VName, NName, eMail, PLZ, Ort, Straße, Hausnummer) values ('Gotthilf','Täsche', 'GotthilfTäsche@yahoo.de', '33715', 'Torgau', 'Tina-Mans-Allee', '17')
insert into Kunden(VName, NName, eMail, PLZ, Ort, Straße, Hausnummer) values ('Hans-Willi','Höfig', 'Hans-WilliHöfig@hotmail.de', '58148', 'Siegen', 'Pölitzstraße', '09')
insert into Kunden(VName, NName, eMail, PLZ, Ort, Straße, Hausnummer) values ('Michel','Faust', 'MichelFaust@hotmail.de', '46039', 'Brand', 'Pauline-Klapp-Ring', '01')
insert into Kunden(VName, NName, eMail, PLZ, Ort, Straße, Hausnummer) values ('Harm','Speer', 'HarmSpeer@gmail.com', '75643', 'Kitzingen', 'Elwira-Wirth-Platz', '29')

INSERT INTO Angebote
(Name, Kalorien, APreis, Beschreibung)
VALUES ('Doener',763, 3.80, 'Lecker und Saftig' ), ('Doenerteller', 1308, 3.80, 'Lecker und Saftig'), ('Doenerbox',808, 3.80, 'Lecker und Saftig'), 
('Big Doener', 918, 3.80, 'Lecker und Saftig'),
('Jumbo XXL Doener',1090, 3.80, 'Lecker und Saftig'), ('Bauernsalat', 26, 3.80, 'Lecker und Saftig'), ('Gurkensalat', 30, 3.80, 'Lecker und Saftig'), 
('Tomatensalat', 25, 3.80, 'Lecker und Saftig'), ('Feta-Kaese Salat', 80, 3.80, 'Lecker und Saftig'), ('Krautsalat', 20, 3.80, 'Lecker und Saftig'), 
('Pommes',341, 3.80, 'Lecker und Saftig'), ('Pommes-rot-weiß', 400, 3.80, 'Lecker und Saftig'), ('Pommes-weiß', 370, 3.80, 'Lecker und Saftig'),
('Pommes-rot',370, 3.80, 'Lecker und Saftig'), ('Pommes-Oriental', 400, 3.80, 'Lecker und Saftig'),('Boerek',420, 3.80, 'Lecker und Saftig'),
('Feta-Kaese Boerek',600, 3.80, 'Lecker und Saftig'), ('Spinat-Kaese Boerek', 560, 3.80, 'Lecker und Saftig'), ('Mett-Boerek',700, 3.80, 'Lecker und Saftig'), 
('Duruemrolle', 681, 3.80, 'Lecker und Saftig'), ('Lahmacun',285, 3.80, 'Lecker und Saftig'), ('Lahmacun mit Salat', 394, 3.80, 'Lecker und Saftig'),
('Lahmacun mit Fleisch',566, 3.80, 'Lecker und Saftig'), ('Lahmacun mit Salat und Fleisch', 655, 3.80, 'Lecker und Saftig')

INSERT INTO Angebote (Name, Kalorien, APreis, Beschreibung) VALUES ('Cola',420,2.00,'verdammt kühl'), ('Fanta',420,2.00,'verdammt kühl'), 
('Sprite',420,2.00,'verdammt kühl'), ('Pils',300,1.50,'verdammt kühl'), ('Wasser',0,1.00,'verdammt kühl'), ('Aryan',200,1.00,'verdammt kühl'), 
('Cola light',0,2.00,'verdammt kühl')

INSERT INTO ZutLieferanten VALUES ('Harsh Grürk KG'), ('Hanini Schmidt GmbH'), ('Alica Kischew KG'), ('Alexsandra Otte GmbH'), ('Alica Nelle GmbH'), 
('Hardi Simen GmbH & Co. KG'), ('Harper Grürk GmbH'), ('Alexis Voss KG'), ('Aleha Petri GmbH'), ('Aleha Siemens GmbH & Co. KG'), ('Hanno Kraut KG'), 
('Alexis Schlüter GmbH'), ('Alea Petri GmbH'), ('Alexis Otte KG'), ('Hans Ziggy GmbH')

INSERT INTO Getraenke VALUES (29, '16.54', 28, 4), (29, '26.70', 36, 13), (26, '25.15', 12, 6), (28, '15.27', 39, 12),
(28, '15.99', 7, 6), (30, '19.26', 21, 10), (31, '21.18', 5, 7), (31, '13.28', 21, 7), (27, '12.3', 30, 5), 
(29, '16.79', 32, 4), (29, '23.92', 8, 6), (27, '16.51', 15, 4), (27, '15.97', 39, 2), (29, '29.27', 4, 9), (29, '12.7', 16, 10), 
(28, '13.67', 7, 5), (27, '13.73', 1, 5), (31, '23.21', 20, 12), (26, '14.65', 9, 12), (31, '22.49', 30, 5)


INSERT INTO Lagerorte VALUES ('Kühlschrank'), ('Kühltruhe'), ('Besenkammer'), ('Unter der Theke'), ('Keller'), ('Eisschrank')
INSERT INTO Zutat Values ('Dönerbrot'),('Tomaten'),('Gurken'),('Zwiebeln'),('Weißkraut'), ('Rotkraut'),('Tsatsiki'),('Cocktailsoße'),
			('scharfe Soße'), ('Pommes'), ('Salat'), ('Feta'), ('Ketchup'), ('Mayo'), ('Orientalisch'), ('Blätterteig'),
			 ('Spinat'),('Lamacun')
INSERT INTO Zutaten VALUES (11, 5, 5, '21.76', 790, '21-10-2019'), (12, 4, 4, '18.16', 5335, '18-10-2019'), (13, 2, 12, '22.60', 609, '22-11-2019'), (6, 3, 13, '27.49', 8218, '13-11-2019'), (5, 2, 8, '27.5', 6810, '24-11-2019'), (1, 6, 12, '20.63', 4174, '15-10-2019'), (9, 2, 3, '25.30', 4268, '13-10-2019'), (3, 1, 12, '19.34', 1008, '18-11-2019'), (9, 5, 6, '29.67', 9560, '20-11-2019'), (4, 1, 7, '28.46', 5723, '13-10-2019'), (6, 4, 8, '21.22', 7378, '23-11-2019'), (1, 1, 3, '29.43', 2363, '24-10-2019'), (14, 4, 14, '16.28', 8985, '24-11-2019'), (9, 6, 6, '24.4', 6781, '29-11-2019'), (1, 2, 9, '26.43', 9487, '21-11-2019'), (10, 1, 6, '18.73', 3587, '22-11-2019'), (14, 3, 11, '26.48', 641, '18-10-2019'), (11, 6, 11, '16.28', 7519, '13-10-2019'), (10, 5, 11, '20.79', 5982, '23-11-2019'), (4, 3, 2, '15.2', 7000, '11-11-2019'), (10, 2, 15, '29.59', 9991, '28-10-2019'), (6, 1, 5, '13.35', 3615, '25-10-2019'), (5, 6, 1, '17.77', 4572, '21-11-2019'), (13, 4, 9, '15.86', 9770, '22-10-2019'), (10, 4, 13, '20.53', 5579, '14-11-2019'), (7, 1, 7, '29.70', 9276, '13-10-2019'), (2, 4, 15, '16.55', 6149, '25-10-2019'), (2, 2, 4, '27.65', 9115, '11-11-2019'), (5, 2, 16, '16.4', 4580, '17-10-2019'), (5, 1, 4, '12.31', 6628, '15-11-2019'), (10, 4, 9, '28.30', 7025, '28-10-2019'), (14, 3, 1, '25.7', 9886, '10-11-2019'), (13, 6, 6, '17.14', 9723, '23-11-2019'), (3, 5, 11, '14.20', 1983, '27-11-2019'), (5, 2, 13, '10.80', 3544, '12-11-2019'), (11, 6, 6, '23.68', 6016, '11-10-2019'), (9, 1, 4, '15.80', 5585, '15-11-2019'), (12, 3, 11, '13.19', 8481, '16-10-2019'), (5, 4, 11, '25.21', 8564, '27-10-2019'), (11, 6, 15, '12.82', 2357, '11-10-2019'), (6, 1, 9, '23.91', 4771, '12-10-2019'), (8, 2, 4, '15.92', 2609, '19-11-2019'), (6, 2, 9, '28.19', 3822, '24-10-2019'), (6, 2, 9, '13.73', 878, '23-10-2019'), (12, 3, 8, '16.46', 1460, '27-11-2019'), (10, 5, 6, '21.10', 6590, '24-11-2019'), (7, 4, 12, '10.19', 8667, '25-10-2019'), (12, 6, 14, '21.96', 8249, '27-11-2019'), (13, 3, 3, '26.99', 3323, '16-10-2019'), (9, 1, 15, '21.99', 2152, '20-11-2019'), (14, 3, 12, '22.1', 8671, '10-10-2019'), (2, 2, 5, '25.96', 7792, '19-11-2019'), (8, 6, 14, '18.30', 8831, '11-10-2019'), (11, 2, 8, '11.23', 8172, '29-11-2019'), (11, 5, 2, '21.67', 619, '10-11-2019'), (4, 2, 6, '26.1', 9814, '27-11-2019'), (6, 4, 2, '15.38', 5921, '14-10-2019'), (10, 2, 16, '19.77', 8687, '24-10-2019'), (1, 1, 4, '29.42', 1863, '28-11-2019'), (7, 2, 16, '25.33', 9311, '10-10-2019'), (5, 4, 10, '15.60', 1545, '19-10-2019'), (1, 6, 2, '29.18', 6794, '13-11-2019'), (10, 4, 9, '10.13', 5063, '23-10-2019'), (4, 3, 7, '29.45', 3044, '25-10-2019'), (7, 5, 9, '19.18', 6098, '22-11-2019'), (2, 3, 6, '19.13', 4910, '24-10-2019'), (11, 5, 15, '15.80', 1796, '19-10-2019'), (5, 6, 2, '12.90', 8998, '17-11-2019'), (14, 6, 1, '10.86', 1210, '28-10-2019'), (11, 4, 2, '15.20', 6419, '22-11-2019')




INSERT INTO Auftrag VALUES (10, 10, 'weniger Ketchup', '25-10-2019', 4), (28, 7, 'ich liebe  Ketchup', '23-11-2019', 4), (16, 11, 'ohne Gurken', '10-11-2019', 3), (12, 11, 'mit extra viel scharfe Soße', '22-11-2019', 4), (5, 14, 'nur bisschen Zwiebeln', '13-11-2019', 4), (2, 1, 'ohne Lamacun', '13-10-2019', 2), (11, 10, 'weniger Zwiebeln', '23-10-2019', 4), (2, 13, 'ohne Rotkraut', '26-10-2019', 1), (10, 10, 'weniger Pommes', '29-11-2019', 1), (1, 11, 'weniger Rotkraut', '13-11-2019', 2), (8, 10, 'leckör Orientalisch', '19-11-2019', 3), (3, 2, 'ich liebe  Rotkraut', '26-11-2019', 4), (17, 4, 'leckör scharfe Soße', '24-10-2019', 4), (15, 11, 'nur bisschen Weißkraut', '14-10-2019', 1), (3, 11, 'nur bisschen Tsatsiki', '17-10-2019', 1), (8, 14, 'weniger Weißkraut', '16-11-2019', 1), (23, 10, 'ohne Blätterteig', '20-11-2019', 4), (27, 9, 'nur bisschen Zwiebeln', '28-11-2019', 2), (8, 13, 'ich liebe  Tomaten', '17-11-2019', 4), (12, 4, 'nur bisschen Orientalisch', '12-10-2019', 4), (3, 3, 'ohne Weißkraut', '22-11-2019', 4), (2, 8, 'weniger Tsatsiki', '22-10-2019', 3), (20, 9, 'ohne Dönerbrot', '22-11-2019', 1), (13, 14, 'nur bisschen Pommes', '21-10-2019', 1), (10, 13, 'weniger Rotkraut', '27-11-2019', 2), (25, 8, 'ich liebe  Zwiebeln', '16-11-2019', 4), (28, 5, 'leckör Tomaten', '21-10-2019', 4), (21, 3, 'ohne scharfe Soße', '25-11-2019', 4), (9, 11, 'leckör Pommes', '10-11-2019', 3), (12, 14, 'ich liebe  Tsatsiki', '12-10-2019', 4), (16, 3, 'leckör Tsatsiki', '16-10-2019', 3), (2, 13, 'nur bisschen Feta', '21-11-2019', 2), (23, 6, 'nur bisschen Tsatsiki', '26-11-2019', 1), (6, 14, 'ich liebe  Dönerbrot', '28-10-2019', 2), (17, 7, 'nur bisschen Cocktailsoße', '19-11-2019', 1), (11, 7, 'ich liebe  Pommes', '28-11-2019', 3), (15, 4, 'ohne Mayo', '28-10-2019', 4), (2, 6, 'ohne Tomaten', '29-10-2019', 3), (6, 8, 'mit extra viel Pommes', '17-11-2019', 2), (25, 11, 'ohne scharfe Soße', '19-11-2019', 4), (15, 4, 'nur bisschen Zwiebeln', '27-10-2019', 1), (21, 8, 'nur bisschen Gurken', '17-10-2019', 2), (3, 6, 'ohne Feta', '22-11-2019', 1), (2, 7, 'nur bisschen scharfe Soße', '11-11-2019', 2), (2, 9, 'ich liebe  Weißkraut', '16-11-2019', 4), (26, 10, 'mit extra viel Mayo', '27-11-2019', 2), (8, 1, 'mit extra viel Weißkraut', '24-10-2019', 1), (24, 13, 'weniger Salat', '27-10-2019', 1), (15, 6, 'nur bisschen Gurken', '13-11-2019', 3), (25, 4, 'ich liebe  Pommes', '11-11-2019', 4), (21, 6, 'weniger Salat', '14-11-2019', 1), (19, 11, 'weniger Rotkraut', '22-11-2019', 1), (4, 5, 'ich liebe  Rotkraut', '18-11-2019', 4), (17, 3, 'leckör Pommes', '22-11-2019', 4), (6, 8, 'leckör Tomaten', '10-10-2019', 4), (6, 1, 'weniger Dönerbrot', '17-11-2019', 1), (7, 13, 'ohne Zwiebeln', '28-10-2019', 2), (1, 4, 'ohne Orientalisch', '14-11-2019', 1), (12, 9, 'ich liebe  Salat', '16-11-2019', 4), (11, 10, 'mit extra viel Pommes', '25-11-2019', 3), (8, 8, 'ich liebe  Dönerbrot', '25-10-2019', 2), (6, 7, 'ohne Rotkraut', '16-10-2019', 2), (26, 5, 'nur bisschen Gurken', '17-10-2019', 1), (9, 9, 'weniger Cocktailsoße', '29-11-2019', 3), (29, 2, 'nur bisschen scharfe Soße', '23-10-2019', 4), (26, 2, 'mit extra viel Tsatsiki', '19-10-2019', 2), (29, 5, 'mit extra viel Feta', '18-10-2019', 2), (3, 2, 'mit extra viel Tomaten', '28-11-2019', 4), (14, 2, 'mit extra viel Tsatsiki', '20-11-2019', 3), (26, 7, 'ohne Zwiebeln', '24-10-2019', 3), (13, 9, 'leckör Ketchup', '25-11-2019', 4), (24, 10, 'leckör Rotkraut', '26-10-2019', 4), (27, 6, 'leckör Dönerbrot', '11-10-2019', 1), (25, 9, 'ohne Pommes', '18-11-2019', 1), (17, 1, 'nur bisschen Blätterteig', '22-11-2019', 4), (12, 14, 'ich liebe  Tomaten', '24-10-2019', 2), (13, 8, 'nur bisschen Salat', '22-10-2019', 4), (10, 14, 'leckör Rotkraut', '28-10-2019', 3), (6, 7, 'leckör Rotkraut', '29-11-2019', 4), (3, 10, 'leckör Feta', '15-10-2019', 4)




INSERT INTO Gerichte VALUES (1,NULL), (2, 1), (3, 1), (4, 1), (5, 1), (6, NULL), (7, 6), (8, 6), (9, 6), (10, 6), (11, NULL), (12, 11), (13, 11), (14, 11), (15,11), (16, NULL), (17, 16), (18, 16), (19, 16), (20, NULL), (21, NULL), (22, 21), (23, 21), (24, 21)
SELECT * FROM Gerichte;
INSERT INTO MENUE VALUES ('DönerSpecial', 8.00), ('DönertellerSpecial', 10.00), ('DoenerboxSpecial', 9.00), ('BigDoeneristderBeste', 12.00), ('DerWahnsinn', 13.00), ('WahnsinnsSpecial', 12.00), ('SalatistGesund', 4.88), ('LAMMCOLA', 5.00), ('FETA', 7.60), ('KRAUTSPECIAL', 6.00), ('POMMESPECIAL', 4.50)

INSERT INTO Angebotsbox VALUES (1, 1), (1, 17), (1, 25), (2, 2), (2, 25), (3, 3), (3, 25), (4, 4), (4, 10), (4, 27), (5, 5), (5, 25), (5, 12), (6, 1), (6, 25), (6, 16), (7, 6), (7, 25), (8, 21), (8, 25), (9, 16), (9, 26), (9, 12), (10, 11), (10, 25), (11, 22), (11, 29)

insert into Rezept(ZutatID, AngebotID, Menge) values( 14, 9, 57)
insert into Rezept(ZutatID, AngebotID, Menge) values( 14, 12, 80)
insert into Rezept(ZutatID, AngebotID, Menge) values( 13, 4, 73)
insert into Rezept(ZutatID, AngebotID, Menge) values( 9, 5, 56)
insert into Rezept(ZutatID, AngebotID, Menge) values( 4, 6, 55)
insert into Rezept(ZutatID, AngebotID, Menge) values( 11, 8, 89)
insert into Rezept(ZutatID, AngebotID, Menge) values( 7, 21, 77)
insert into Rezept(ZutatID, AngebotID, Menge) values( 1, 19, 75)
insert into Rezept(ZutatID, AngebotID, Menge) values( 7, 8, 98)
insert into Rezept(ZutatID, AngebotID, Menge) values( 10, 22, 83)
insert into Rezept(ZutatID, AngebotID, Menge) values( 15, 5, 74)
insert into Rezept(ZutatID, AngebotID, Menge) values( 12, 16, 76)
insert into Rezept(ZutatID, AngebotID, Menge) values( 15, 20, 67)
insert into Rezept(ZutatID, AngebotID, Menge) values( 1, 3, 86)
insert into Rezept(ZutatID, AngebotID, Menge) values( 15, 18, 50)
insert into Rezept(ZutatID, AngebotID, Menge) values( 11, 5, 80)
insert into Rezept(ZutatID, AngebotID, Menge) values( 17, 14, 94)
insert into Rezept(ZutatID, AngebotID, Menge) values( 5, 7, 73)
insert into Rezept(ZutatID, AngebotID, Menge) values( 16, 6, 73)
insert into Rezept(ZutatID, AngebotID, Menge) values( 15, 4, 67)
insert into Rezept(ZutatID, AngebotID, Menge) values( 17, 21, 78)
insert into Rezept(ZutatID, AngebotID, Menge) values( 4, 7, 81)
insert into Rezept(ZutatID, AngebotID, Menge) values( 8, 21, 90)
insert into Rezept(ZutatID, AngebotID, Menge) values( 4, 8, 55)
insert into Rezept(ZutatID, AngebotID, Menge) values( 3, 10, 83)
insert into Rezept(ZutatID, AngebotID, Menge) values( 12, 10, 86)
insert into Rezept(ZutatID, AngebotID, Menge) values( 5, 17, 92)
insert into Rezept(ZutatID, AngebotID, Menge) values( 3, 2, 90)
insert into Rezept(ZutatID, AngebotID, Menge) values( 7, 16, 101)
insert into Rezept(ZutatID, AngebotID, Menge) values( 6, 6, 57)
insert into Rezept(ZutatID, AngebotID, Menge) values( 14, 19, 99)
insert into Rezept(ZutatID, AngebotID, Menge) values( 2, 21, 64)
insert into Rezept(ZutatID, AngebotID, Menge) values( 9, 11, 50)
insert into Rezept(ZutatID, AngebotID, Menge) values( 11, 15, 86)
insert into Rezept(ZutatID, AngebotID, Menge) values( 7, 1, 64)
insert into Rezept(ZutatID, AngebotID, Menge) values( 11, 8, 89)
insert into Rezept(ZutatID, AngebotID, Menge) values( 4, 24, 55)
insert into Rezept(ZutatID, AngebotID, Menge) values( 6, 17, 101)
insert into Rezept(ZutatID, AngebotID, Menge) values( 12, 17, 78)
insert into Rezept(ZutatID, AngebotID, Menge) values( 11, 19, 68)
insert into Rezept(ZutatID, AngebotID, Menge) values( 1, 7, 79)
insert into Rezept(ZutatID, AngebotID, Menge) values( 13, 15, 80)
insert into Rezept(ZutatID, AngebotID, Menge) values( 11, 9, 72)
insert into Rezept(ZutatID, AngebotID, Menge) values( 6, 10, 57)
insert into Rezept(ZutatID, AngebotID, Menge) values( 11, 24, 66)
insert into Rezept(ZutatID, AngebotID, Menge) values( 14, 14, 95)
insert into Rezept(ZutatID, AngebotID, Menge) values( 15, 9, 93)
insert into Rezept(ZutatID, AngebotID, Menge) values( 5, 7, 89)
insert into Rezept(ZutatID, AngebotID, Menge) values( 6, 19, 85)
insert into Rezept(ZutatID, AngebotID, Menge) values( 3, 8, 86)
insert into Rezept(ZutatID, AngebotID, Menge) values( 4, 21, 66)
insert into Rezept(ZutatID, AngebotID, Menge) values( 15, 8, 91)
insert into Rezept(ZutatID, AngebotID, Menge) values( 10, 6, 89)
insert into Rezept(ZutatID, AngebotID, Menge) values( 11, 13, 96)
insert into Rezept(ZutatID, AngebotID, Menge) values( 8, 11, 87)
insert into Rezept(ZutatID, AngebotID, Menge) values( 11, 3, 61)
insert into Rezept(ZutatID, AngebotID, Menge) values( 4, 18, 66)
insert into Rezept(ZutatID, AngebotID, Menge) values( 15, 4, 85)
insert into Rezept(ZutatID, AngebotID, Menge) values( 16, 9, 77)
insert into Rezept(ZutatID, AngebotID, Menge) values( 9, 2, 93)
insert into Rezept(ZutatID, AngebotID, Menge) values( 17, 19, 90)
insert into Rezept(ZutatID, AngebotID, Menge) values( 16, 18, 86)
insert into Rezept(ZutatID, AngebotID, Menge) values( 8, 1, 64)
insert into Rezept(ZutatID, AngebotID, Menge) values( 5, 10, 57)
insert into Rezept(ZutatID, AngebotID, Menge) values( 3, 15, 65)
insert into Rezept(ZutatID, AngebotID, Menge) values( 7, 7, 62)
insert into Rezept(ZutatID, AngebotID, Menge) values( 12, 17, 80)
insert into Rezept(ZutatID, AngebotID, Menge) values( 7, 11, 75)
insert into Rezept(ZutatID, AngebotID, Menge) values( 1, 23, 73)
insert into Rezept(ZutatID, AngebotID, Menge) values( 12, 2, 101)
insert into Rezept(ZutatID, AngebotID, Menge) values( 7, 1, 60)
insert into Rezept(ZutatID, AngebotID, Menge) values( 14, 23, 73)
insert into Rezept(ZutatID, AngebotID, Menge) values( 14, 15, 74)
insert into Rezept(ZutatID, AngebotID, Menge) values( 16, 23, 79)
insert into Rezept(ZutatID, AngebotID, Menge) values( 4, 9, 61)
insert into Rezept(ZutatID, AngebotID, Menge) values( 8, 24, 78)
insert into Rezept(ZutatID, AngebotID, Menge) values( 14, 18, 87)
insert into Rezept(ZutatID, AngebotID, Menge) values( 5, 1, 85)
insert into Rezept(ZutatID, AngebotID, Menge) values( 2, 8, 60)
insert into Rezept(ZutatID, AngebotID, Menge) values( 8, 13, 70)

SELECT count(*) FROM Menue;
##Lieferschein##
 SELECT Kunden.NName AS 'Nachname',Kunden.VName AS 'Vorname',Kunden.Ort,Kunden.PLZ,Kunden.Straße,Kunden.Hausnummer,Lieferant.Name,Menue.Beschreibung AS 'Menübeschreibung',Menue.MenuePreis AS 'Menüpreis',Angebote.Name AS 'Angebotsname',Angebote.APreis AS 'Angebotspreis',Bezahlungsart.Bezahlungsart
 FROM Kunden JOIN Auftrag ON Kunden.kundenID=Auftrag.kundenID  
 JOIN Bezahlungsart ON Bezahlungsart.bezahlungsID=Auftrag.bezahlungsID
 JOIN Lieferant ON Lieferant.lieferantID=Auftrag.lieferantID
 JOIN Warenkorb ON Warenkorb.auftragID=Auftrag.auftragID 
 JOIN MENUE ON Menue.MenueID=Warenkorb.MenueID
 JOIN Angebote ON Warenkorb.AngebotID=Angebote.AngebotID
 ORDER BY Warenkorb.warenkorbID;

 ##Jeder 10.Döner ist Gratis##

 SELECT Kunden.kundenID AS 'Kundennummer',COUNT(Warenkorb.angebotID) AS 'Anzahl Döner'
 FROM Warenkorb JOIN Auftrag ON Warenkorb.angebotID= 1 AND Warenkorb.auftragID=Auftrag.auftragID
 JOIN Kunden ON Auftrag.kundenID=Kunden.kundenID
 GROUP BY Kunden.kundenID
 ORDER BY Kunden.kundenID;
 SELECT * FROM Getraenke;

 ##Abfrage des aktuellen Warenkorbs##
 SELECT MENUE.Beschreibung AS 'Menü', Menue.MenuePreis AS 'Menüpreis', Angebote.Beschreibung AS 'Angebotsbeschreibung',Angebote.APreis AS 'Angebotspreis'
 FROM Warenkorb JOIN MENUE ON Warenkorb.menueID=MENUE.menueID
 JOIN Angebote ON Warenkorb.angebotID=Angebote.angebotID


##Ob die Ware in Zutaten 
 SELECT Name, Menge AS 'Anzahl vergammelter Lebensmittel' FROM Zutaten WHERE Ablaufdatum < '10-11-2019' GROUP BY Name, Menge ORDER BY 'Anzahl vergammelter Lebensmittel' DESC  -- Vergleicht die Anzahl der abgelaufenen Lebensmittel und listet sie absteigend der Anzahl nach

#Abfrage der Menge der Zutaten im Lager + Nachbestllung erforderlich

SELECT Zutat.Name, SUM(Zutaten.Menge),'JA' AS Nachbestellung  FROM Zutat JOIN Zutaten ON Zutat.zutatID=Zutaten.zutatID where Menge<=10
GROUP BY Name
union
SELECT Zutaten.Menge, SUM(Zutaten.Menge),'NEIN' AS Nachbestellung  FROM Zutaten where Menge>=10
GROUP BY Zutat.name
;

##Ausgabe des ANgebotes mit Namen & Preis
SELECT Angebote.Name AS 'Angebotsname',Angebote.APreis AS 'Angebotspreis','Angebot' AS Typ 
FROM Getraenke JOIN Angebote ON Angebote.angebotID=Getraenke.angebotID SET 'Getränk' AS Typ

JOIN Angebote ON An
ORDER BY Angebote.angebotID

