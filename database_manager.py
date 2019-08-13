logo2 = """
 ##  #  #                 
#   # # #        
 #  # # #          
  #  ## #          
##    # ###                   
"""

import pyodbc
import pandas.io.sql
import pandas as pd
from faker import Faker
from tqdm import tqdm
from tqdm import tnrange, tqdm_notebook, trange
from time import sleep
import random

pd.set_option('display.width', 400)
pd.set_option('display.max_columns', 10)
fake = Faker('de_DE')

conn = pyodbc.connect(
    "Driver={SQL Server Native Client 11.0};"
    "Server=DESKTOP-UQK6ILU\SQLEXPRESS;"
    "Database=Doenershop;"
    "Trusted_Connection=yes")


def menu():
    logo()

    print(
        "+---------+--------------------+--+--+\n" +
        "| MenueID |      Funktion      |  |  |\n" +
        "+---------+--------------------+--+--+\n" +
        "|       1 | Daten reinschießen |  |  |\n" +
        "|       2 | Read Table         |  |  |\n" +
        "|       3 | Datenbomber        |  |  |\n" +
        "|       4 | Bestellformular    |  |  |\n" +
        "|       5 | Abg. Lebensmittel  |  |  |\n" +
        "|       6 | Nachbestellung     |  |  |\n" +
        "|       7 | Auftragsabfrage    |  |  |\n" +
        "|       8 | Lieferant fake     |  |  |\n" +
        "|       9 | Preisabfrage       |  |  |\n" +
        "|       0 | Menue schließen    |  |  |\n" +
        "+---------+--------------------+--+--+")

    loop = True

    while loop:
        eingabe = input("\nIhre Eingabe: ")

        if (eingabe == "0"):
            loop = menu_exit()


        elif (eingabe == "1"):
            write_table(conn)
            lel = input("Möchten Sie die Anwendung schließen? yes(y) or no(n)")
            if (lel == "y"):
                loop = menu_exit()

            if (lel == "n"):
                menu_laden()


        elif (eingabe == "2"):
            read_sql()
            lel = input("Möchten Sie die Anwendung schließen? yes(y) or no(n)")
            if (lel == "y"):
                loop = menu_exit()

            if (lel == "n"):
                menu_laden()


        elif (eingabe == "3"):
            atombomber(conn)
            lel = input("Möchten Sie die Anwendung schließen? yes(y) or no(n)")
            if (lel == "y"):
                loop = menu_exit()

            if (lel == "n"):
                menu_laden()


        elif (eingabe == "4"):
            bestellung()
            lel = input("Möchten Sie die Anwendung schließen? yes(y) or no(n)")
            if (lel == "y"):
                loop = menu_exit()

            if (lel == "n"):
                menu_laden()

        elif (eingabe == "5"):
            abgelaufen()
            lel = input("Möchten Sie die Anwendung schließen? yes(y) or no(n)")
            if (lel == "y"):
                loop = menu_exit()

            if (lel == "n"):
                menu_laden()

        elif (eingabe == "6"):
            diaet()
            lel = input("Möchten Sie die Anwendung schließen? yes(y) or no(n)")
            if (lel == "y"):
                loop = menu_exit()
            if (lel == "n"):
                menu_laden()

        elif (eingabe == "7"):
            auftragsabfrage()
            lel = input("Möchten Sie die Anwendung schließen? yes(y) or no(n)")
            if (lel == "y"):
                loop = menu_exit()
            if (lel == "n"):
                menu_laden()

        elif (eingabe == "8"):
            lieferant_fake()
            lel = input("Möchten Sie die Anwendung schließen? yes(y) or no(n)")
            if (lel == "y"):
                loop = menu_exit()
            if (lel == "n"):
                menu_laden()

        elif (eingabe == "9"):
            preis_abfrage()
            lel = input("Möchten Sie die Anwendung schließen? yes(y) or no(n)")
            if (lel == "y"):
                loop = menu_exit()
            if (lel == "n"):
                menu_laden()

        else:
            raw_input = input("Bitte eine Zahl zwischen 1 und 6 eingeben, drücke beliebige Taste zum fortfahren...")


def read(conn):
    logo()
    df2 = pandas.io.sql.read_sql("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES ", conn)
    print(df2)
    table2 = input("Welche Tabelle wollen Sie?")
    print("Einen Augenblick bitte, die Daten werden abgerufen")
    progress_bar()
    if (table2 == "0"):
        table = "Kunden"
        return table


    elif (table2 == "1"):
        table = "Lieferant"
        return table



    elif (table2 == "2"):
        table = "Auftrag"
        return table


    elif (table2 == "3"):
        table = "Bezahlungsart"
        return table


    elif (table2 == "4"):
        table = "Warenkorb"
        return table


    elif (table2 == "5"):
        table = "MENUE"
        return table


    elif (table2 == "6"):
        table = "Angebotsbox"
        return table

    elif (table2 == "7"):
        table = "Angebote"
        return table


    elif (table2 == "8"):
        table = "Getraenke"
        return table


    elif (table2 == "9"):
        table = "Gerichte"
        return table


    elif (table2 == "10"):
        table = "Rezept"
        return table


    elif (table2 == "11"):
        table = "Zutat"
        return table


    elif (table2 == "12"):
        table = "Zutaten"
        return table


    elif (table2 == "13"):
        table = "Lagerorte"
        return table

    elif (table2 == "14"):
        table = "ZutLieferanten"
        return table


    else:
        raw_input = input("Bitte eine Zahl zwischen 1 und 6 eingeben, drücke beliebige Taste zum fortfahren...")
        read_sql()


def abgelaufen():
    year = input("Bitte geben Sie das aktuelle Jahr ein: ")
    month = input("Bitte geben Sie den aktuellen Monat ein: ")
    day = input("Bitte geben Sie den aktuellen Tag ein: ")
    print("Folgende Lebensmittel sind abgelaufen: ")
    df2 = pandas.io.sql.read_sql("SELECT Zutat.Name, SUM(Menge) AS 'Anzahl vergammelter Lebensmittel' FROM Zutat JOIN Zutaten ON Zutat.zutatID=Zutaten.zutatenID WHERE Ablaufdatum < '" + year + "-" + month + "-" + day + "' GROUP BY Name, Menge ORDER BY 'Anzahl vergammelter Lebensmittel' DESC", conn)  # -- Vergleicht die Anzahl der abgelaufenen Lebensmittel und listet sie absteigend der Anzahl nach
    print(df2)


def lieferant_fake():
    fake = Faker('tr_TR')
    atombombe = int(input("Wie viele Fahrer willst du reinschießen?"))
    for _ in range(atombombe):
        name= fake.first_name()
        cursor = conn.cursor()
        cursor.execute("insert into Lieferant(Name) values ('" + name + "')")
        conn.commit()
    read_sql()



def auftragsabfrage():
    print("Folgende Auftraege sind vorhanden: ")
    df2 = pandas.io.sql.read_sql(
        "SELECT AuftragID, KundenID, LieferantID, Kommentar, Auftragsdatum, bezahlungsart FROM Auftrag INNER JOIN Bezahlungsart ON Auftrag.bezahlungsID = Bezahlungsart.bezahlungsID ", conn)
    print(df2)


def bestellung():
    print("echte Daten(0) oder Fakedaten(1)")
    eingabe = input("Ihre Eingabe: ")
    check = eingabe.isdigit()
    if (check == True):
        if (eingabe == "0"):
            write_table(conn)

        elif (eingabe == "1"):
            fake_insert(conn)
        else:
            bestellung()
    else:
        bestellung()


def menu_laden():
    print("Menu wird geladen")
    progress_bar()
    menu()


def menu_exit():
    print("Anwendung wird geschlossen")
    progress_bar()
    print("Anwendung wurde geschlossen")
    loop = False
    return loop


def fake_insert(conn):  # faked Kundendaten
    print("Die Daten werden jetzt gefaket....")
    progress_bar()
    vname = fake.first_name()
    nname = fake.last_name()
    strasse = fake.street_name()
    hnr = fake.day_of_month()
    plz = fake.postcode()
    ort = fake.city()
    email = vname + nname + "@" + fake.free_email_domain()
    cursor = conn.cursor()
    cursor.execute(
        "insert into Kunden(VName, NName, eMail, PLZ, Ort, Straße, Hausnummer) values ('" + vname + "','" + nname + "', '" + email + "', '" + plz + "', '" + ort + "', '" + strasse + "', '" + hnr + "')")
    conn.commit()
    print(
        "Ihre Daten lauten wiefolgt:\n Vorname: " + vname + "\n Nachname: " + nname + "\n Strasse: " + strasse + "\n Hausnummer: " + hnr + "\n Wohnort: " + ort + "\n E-MAIL: " + email + "\n")
    read_sql()


def vname_insert():
    l = True
    while (l):
        vname = str(input("Bitte geben Sie Ihren Vornamen ein: "))
        check = vname.isalpha()  # Methode prüft, ob die Zeichenkette nur aus alphabetischen Zeichen besteht.
        if (check == True):
            l = False
            return vname
        else:
            print("Bitte nochmal eingeben")


def nname_insert():
    l = True
    while (l):
        nname = input("Bitte geben Sie Ihren Nachnamen ein: ")
        check = nname.isalpha()  # Methode prüft, ob die Zeichenkette nur aus alphabetischen Zeichen besteht
        if (check == True):
            l = False
            return nname
        else:
            print("Bitte nochmal eingeben")


def strasse_insert():
    l = True
    while (l):
        street = input("Bitte geben Sie Ihre Straße ein ein: ")
        check = street.isalpha()  # Methode prüft, ob die Zeichenkette nur aus alphabetischen Zeichen besteht
        if (check == True):
            l = False
            return street
        else:
            print("Bitte nochmal eingeben")


def hnr_insert():
    l = True
    while (l):
        hnr = input("Bitte geben Sie Ihre Hausnummer ein: ")
        check = hnr.isdigit()  # prüft, ob die Zeichenkette nur aus Ziffern besteht
        if (check == True):
            l = False
            return hnr
        else:
            print("Bitte nochmal eingeben")


def plz_insert():
    l = True
    while (l):
        plz = input("Bitte geben Sie Ihre Postleitzahl ein: ")
        check = plz.isdigit()  # prüft, ob die Zeichenkette nur aus Ziffern besteht
        if (check == True):
            l = False
            return plz
        else:
            print("Bitte nochmal eingeben")


def city_insert():
    l = True
    while (l):
        city = input("Bitte geben Sie Ihren Wohnort ein: ")
        check = city.isalpha()  # Methode prüft, ob die Zeichenkette nur aus alphabetischen Zeichen besteht
        if (check == True):
            l = False
            return city
        else:
            print("Bitte nochmal eingeben")


def email_insert():
    email = input("Bitte geben Sie Ihre Email-Adresse ein: ")
    return email


def write_table(conn):
    logo()
    progress_bar()
    vname = vname_insert()
    nname = nname_insert()
    email = email_insert()
    strasse = strasse_insert()
    hnr = hnr_insert()
    plz = plz_insert()
    ort = city_insert()
    print("Ihre Daten lauten wiefolgt:\n Vorname: " + str(
        vname) + "\n Nachname: " + nname + "\n Strasse: " + strasse + "\n Hausnummer: " + hnr + "\n Wohnort: " + ort + "\n E-MAIL: " + email + "\n Sind die Daten korrekt?")
    korrekt = input("Ja (y) oder Nein(n)")
    if (korrekt == "y"):
        cursor = conn.cursor()
        cursor.execute(
            "insert into Kunden(VName, NName, eMail, PLZ, Ort, Straße, Hausnummer) values ('" + vname + "','" + nname + "', '" + email + "', '" + plz + "', '" + ort + "', '" + strasse + "', '" + hnr + "')")
        conn.commit()
        print("Die Daten wurden reingeschrieben \n")
        read_sql()
    else:
        print("Ich schmeiß dir die BRÜGEL RAUS, GIB DIE DATEN NOMMA NEU EIN")
        bestellung()


def atombomber(conn):
    logo()
    atombombe = int(input("Wie viele Daten willst du reinschießen?"))
    print("Die Daten werden reingeschrieben \n")
    progress_bar()
    for _ in range(atombombe):
        vname = fake.first_name()
        nname = fake.last_name()
        strasse = fake.street_name()
        hnr = fake.day_of_month()
        plz = fake.postcode()
        ort = fake.city()
        email = vname + nname + "@" + fake.free_email_domain()
        cursor = conn.cursor()
        cursor.execute(
            "insert into Kunden(VName, NName, eMail, PLZ, Ort, Straße, Hausnummer) values ('" + vname + "','" + nname + "', '" + email + "', '" + plz + "', '" + ort + "', '" + strasse + "', '" + hnr + "')")
        conn.commit()
        print(
            "Ihre Daten lauten wiefolgt:\n Vorname: " + vname + "\n Nachname: " + nname + "\n Strasse: " + strasse + "\n Hausnummer: " + hnr + "\n Wohnort: " + ort + "\n E-MAIL: " + email + "\n")
    read_sql()


def test_insert():
    column = read(conn)
    df2 = pandas.io.sql.read_sql(
        "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '" + column + "'", conn)
    print(df2)


def read_sql():
    table = read(conn)
    df = pandas.io.sql.read_sql("select * from " + table, conn)
    print(df)
    print("\n\nDie Anzahl der Elemente des Tables " + table +":")
    df2 = pandas.io.sql.read_sql("SELECT count(*) FROM " + table, conn)
    print(df2)


def logo():
    print(logo2)


def diaet():
    print("Die folgenden Lebensmittel müssen Nachbestellt werden: ")
    df= pandas.io.sql.read_sql("SELECT Zutat.Name, SUM(Zutaten.Menge),'JA' AS Nachbestellung  FROM Zutat JOIN Zutaten ON Zutat.ZutatID=Zutaten.zutatID GROUP BY Zutat.Name HAVING SUM(Zutaten.Menge)<=5000 union SELECT Zutat.Name, SUM(Zutaten.Menge),'Nein' AS Nachbestellung  FROM Zutat JOIN Zutaten ON Zutat.ZutatID=Zutaten.zutatID GROUP BY Zutat.Name HAVING SUM(Zutaten.Menge)>=5000", conn)
    print(df)


def progress_bar():
    bar = trange(10)
    for i in bar:
        sleep(0.1)
    if not (i % 3):
        tqdm.write("\n")

def preis_abfrage():
    print("Angebotsliste: ")
    df = pandas.io.sql.read_sql("SELECT Angebote.Name AS 'Angebotsname',Angebote.APreis AS 'Angebotspreis' FROM Angebote ORDER BY Angebote.angebotID ", conn)
    print(df)

    
menu()
