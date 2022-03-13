/*Funkcjonalność: 
Stworzenie archiwum gromadzącego informacje z historii ligi na temat kategorii
przedstawionych w encjach.

Encje zawarte w bazie daych:
Zawodnik(data urodzenia, Wzrost, imie,nazwisko,pozycja)
Trener(data urodzenia,imie,nazwisko) 
Mistrzostwo(rok)
Drużyna(data utworzenia,nazwa)
Wolni_Agenci(IdZawodnik)
Budzet_Mistrzow(rok,budzet)

tabele asocjacyjne:
Druzyna_Zawodnik(od,do+FK IdDruzyna,FK IdZawodnik)
Druzyna_Trener(od,do+FK IdDruzyna,FK IdTrener)

Każdy zawodnik w  karierze był w co najmniej jednej drużynie.
Każda drużyna ma na przestrzeni lat wielu zawodników.

Każdy trener prowadził conajmniej jedną drużynie.
Każda drużyna na przestrzeni lat miała wielu trenerów.

Mistrzostwo w danym roku trafia tylko do jednej drużyny,
ale drużyna moze miec wiele mistrzostw z różnych lat.

Każdy zawodnik który obecnie nie ma kontraktu(wartość do dotycząca go w encji Druzyna_Zawodnik nie jest NULL) staje się wolnym agentem

Przechowywane są informacje dotyczące jedynie drużyn mistrzowskich nt. sumy kwot wyplaconych kazdemu zawodnikowi, który zdobył to mistrzostwo od początku gry w tej druzynie.
*/

CREATE TABLE Druzyna (
    IdDruzyna int  NOT NULL,
    rok_utworzenia smallint  NOT NULL,
    nazwa varchar(25)  NOT NULL,
    CONSTRAINT Druzyna_pk PRIMARY KEY  (IdDruzyna)
);

CREATE TABLE Druzyna_Trener (
    IdDT int  NOT NULL,
    Trener_IdTrener int  NOT NULL,
    Druzyna_IdDruzyna int  NOT NULL,
    od smallint  NOT NULL,
    do smallint  NULL,
    CONSTRAINT Druzyna_Trener_pk PRIMARY KEY  (IdDT)
);

CREATE TABLE Druzyna_Zawodnik (
    IdDZ int  NOT NULL,
    Zawodnik_IdZawodnik int  NOT NULL,
    Druzyna_IdDruzyna int  NOT NULL,
    od date  NOT NULL,
    do date  NULL,
    suma_kontrakt_mln int NOT NULL,
    CONSTRAINT Druzyna_Zawodnik_pk PRIMARY KEY  (IdDZ)
);

CREATE TABLE Mistrzostwo (
    rok smallint  NOT NULL,
    Druzyna_IdDruzyna int  NOT NULL,
    CONSTRAINT Mistrzostwo_pk PRIMARY KEY  (rok)
);

CREATE TABLE Trener (
    IdTrener int  NOT NULL,
    data_urodzenia date  NOT NULL,
    imie varchar(25)  NOT NULL,
    nazwisko varchar(25)  NOT NULL,
    CONSTRAINT Trener_pk PRIMARY KEY  (IdTrener)
);

CREATE TABLE Zawodnik (
    idZawodnik int  NOT NULL,
    data_urodzenia date  NOT NULL,
    Wzrost smallint  NOT NULL,
    imie varchar(25)  NOT NULL,
    nazwisko varchar(25)  NOT NULL,
    pozycja varchar(25)  NOT NULL,
    CONSTRAINT Zawodnik_pk PRIMARY KEY  (idZawodnik)
);

CREATE TABLE Budzet_Mistrzow (
    rok int  NOT NULL,
	budzet int NOT NULL
    
    CONSTRAINT rok_pk PRIMARY KEY  (rok)
);
CREATE TABLE Wolni_Agenci(IdWA int  NOT NULL,CONSTRAINT Wolni_Agenci_pk PRIMARY KEY  (idWA));
--drop table Wolni_Agenci;

ALTER TABLE Wolni_Agenci ADD CONSTRAINT Zawodnik_Wolni_Agenci FOREIGN KEY (IdWA)REFERENCES Zawodnik (IdZawodnik);
-- foreign keys
-- Reference: Druzyna_Trener_Druzyna (table: Druzyna_Trener)
ALTER TABLE Druzyna_Trener ADD CONSTRAINT Druzyna_Trener_Druzyna
    FOREIGN KEY (Druzyna_IdDruzyna)
    REFERENCES Druzyna (IdDruzyna);

-- Reference: Druzyna_Trener_Trener (table: Druzyna_Trener)
ALTER TABLE Druzyna_Trener ADD CONSTRAINT Druzyna_Trener_Trener
    FOREIGN KEY (Trener_IdTrener)
    REFERENCES Trener (IdTrener);

-- Reference: Druzyna_Zawodnik_Druzyna (table: Druzyna_Zawodnik)
ALTER TABLE Druzyna_Zawodnik ADD CONSTRAINT Druzyna_Zawodnik_Druzyna
    FOREIGN KEY (Druzyna_IdDruzyna)
    REFERENCES Druzyna (IdDruzyna);

-- Reference: Druzyna_Zawodnik_Zawodnik (table: Druzyna_Zawodnik)
ALTER TABLE Druzyna_Zawodnik ADD CONSTRAINT Druzyna_Zawodnik_Zawodnik
    FOREIGN KEY (Zawodnik_IdZawodnik)
    REFERENCES Zawodnik (idZawodnik);

-- Reference: Mistrzostwo_Druzyna (table: Mistrzostwo)
ALTER TABLE Mistrzostwo ADD CONSTRAINT Mistrzostwo_Druzyna
    FOREIGN KEY (Druzyna_IdDruzyna)
    REFERENCES Druzyna (IdDruzyna);


INSERT INTO Druzyna (IdDruzyna, rok_utworzenia, nazwa) VALUES (1, 1970, 'Cleveland Cavaliers');
INSERT INTO Druzyna (IdDruzyna, rok_utworzenia, nazwa) VALUES (2, 1947, 'Los Angeles Lakers');
INSERT INTO Druzyna (IdDruzyna, rok_utworzenia, nazwa) VALUES (3, 1966, 'Chicago Bulls');
INSERT INTO Druzyna (IdDruzyna, rok_utworzenia, nazwa) VALUES (4, 1946, 'Golden State Warriors');
INSERT INTO Druzyna (IdDruzyna, rok_utworzenia, nazwa) VALUES (5, 1967, 'San Antonio Spurs');

INSERT INTO mistrzostwo (Rok, druzyna_iddruzyna) VALUES (2016,1);
INSERT INTO mistrzostwo (Rok, druzyna_iddruzyna) VALUES (2017,4);
INSERT INTO mistrzostwo (Rok, druzyna_iddruzyna) VALUES (2018,4);
INSERT INTO mistrzostwo (Rok, druzyna_iddruzyna) VALUES (1996,3);
INSERT INTO mistrzostwo (Rok, druzyna_iddruzyna) VALUES (1997,3);
INSERT INTO mistrzostwo (Rok, druzyna_iddruzyna) VALUES (1991,3);
INSERT INTO mistrzostwo (Rok, druzyna_iddruzyna) VALUES (1992,3);
INSERT INTO mistrzostwo (Rok, druzyna_iddruzyna) VALUES (1993,3);
INSERT INTO mistrzostwo (Rok, druzyna_iddruzyna) VALUES (1998,3);
INSERT INTO mistrzostwo (Rok, druzyna_iddruzyna) VALUES (1949,2);
INSERT INTO mistrzostwo (Rok, druzyna_iddruzyna) VALUES (1950,2);
INSERT INTO mistrzostwo (Rok, druzyna_iddruzyna) VALUES (1952,2);
INSERT INTO mistrzostwo (Rok, druzyna_iddruzyna) VALUES (1953,2);
INSERT INTO mistrzostwo (Rok, druzyna_iddruzyna) VALUES (2000,2);
INSERT INTO mistrzostwo (Rok, druzyna_iddruzyna) VALUES (2001,2);
INSERT INTO mistrzostwo (Rok, druzyna_iddruzyna) VALUES (2002,2);
INSERT INTO mistrzostwo (Rok, druzyna_iddruzyna) VALUES (2009,2);
INSERT INTO mistrzostwo (Rok, druzyna_iddruzyna) VALUES (2010,2);

INSERT INTO zawodnik (idzawodnik,data_urodzenia,wzrost,imie,nazwisko,pozycja) VALUES (1,'1984-12-30',206,'LeBron', 'James','niski skrzydlowy');
INSERT INTO zawodnik (idzawodnik,data_urodzenia,wzrost,imie,nazwisko,pozycja) VALUES (2,'1963-02-17',198,'Michael', 'Jordan','rzucajacy obronca');
INSERT INTO zawodnik (idzawodnik,data_urodzenia,wzrost,imie,nazwisko,pozycja) VALUES (3,'1992-03-23',188,'Kyrie', 'Irving','rozgrywajacy');
INSERT INTO zawodnik (idzawodnik,data_urodzenia,wzrost,imie,nazwisko,pozycja) VALUES (4,'1978-08-23',198,'Kobe', 'Bryant','rzucajacy obronca');
INSERT INTO zawodnik (idzawodnik,data_urodzenia,wzrost,imie,nazwisko,pozycja) VALUES (5,'1994-03-16',213,'Joel', 'Embiid','center');
INSERT INTO zawodnik (idzawodnik,data_urodzenia,wzrost,imie,nazwisko,pozycja) VALUES (6,'1991-06-29',201,'Kawhi', 'Leonard','niski skrzydlowy');
INSERT INTO zawodnik (idzawodnik,data_urodzenia,wzrost,imie,nazwisko,pozycja) VALUES (7,'1988-09-07',203,'Kevin', 'Love','silny skrzydlowy');

INSERT INTO druzyna_zawodnik (IDDZ,zawodnik_idzawodnik,druzyna_iddruzyna,od,do,suma_kontrakt_mln) VALUES (1,1,1,'2003-06-26','2010-07-01',110);
INSERT INTO druzyna_zawodnik (IDDZ,zawodnik_idzawodnik,druzyna_iddruzyna,od,do,suma_kontrakt_mln) VALUES (2,2,3,'1984-06-19','1993-06-20',85);
INSERT INTO druzyna_zawodnik (IDDZ,zawodnik_idzawodnik,druzyna_iddruzyna,od,do,suma_kontrakt_mln) VALUES (3,3,1,'2011-06-23','2018-06-13',80);
INSERT INTO druzyna_zawodnik (IDDZ,zawodnik_idzawodnik,druzyna_iddruzyna,od,do,suma_kontrakt_mln) VALUES (4,4,2,'1996-07-02','2016-04-13',200);
INSERT INTO druzyna_zawodnik (IDDZ,zawodnik_idzawodnik,druzyna_iddruzyna,od,do,suma_kontrakt_mln) VALUES (5,6,5,'2011-06-24','2018-07-18',80);
INSERT INTO druzyna_zawodnik (IDDZ,zawodnik_idzawodnik,druzyna_iddruzyna,od,do,suma_kontrakt_mln) VALUES (6,1,2,'2018-07-01',null,150);
INSERT INTO druzyna_zawodnik (IDDZ,zawodnik_idzawodnik,druzyna_iddruzyna,od,do,suma_kontrakt_mln) VALUES (7,7,1,'2014-08-23',null,140);

INSERT INTO trener (idTrener, data_urodzenia,imie,nazwisko) VALUES (1,'1965-09-27','Steve','Kerr');
INSERT INTO trener (idTrener, data_urodzenia,imie,nazwisko) VALUES (2,'1977-05-03','Tyron','Lue');
INSERT INTO trener (idTrener, data_urodzenia,imie,nazwisko) VALUES (3,'1980-03-28','Luke','Walton');
INSERT INTO trener (idTrener, data_urodzenia,imie,nazwisko) VALUES (4,'1945-09-17','Phill','Jackson');
INSERT INTO trener (idTrener, data_urodzenia,imie,nazwisko) VALUES (5,'1949-01-28','Gregg','Popovitch');

INSERT INTO druzyna_trener (IDDT,trener_idTrener,druzyna_iddruzyna,od,do) VALUES (1,1,4,2014,null);
INSERT INTO druzyna_trener (IDDT,trener_idTrener,druzyna_iddruzyna,od,do) VALUES (2,2,1,2016,2019);
INSERT INTO druzyna_trener (IDDT,trener_idTrener,druzyna_iddruzyna,od,do) VALUES (3,3,2,2016,2019);
INSERT INTO druzyna_trener (IDDT,trener_idTrener,druzyna_iddruzyna,od,do) VALUES (4,4,3,1987,1998);
INSERT INTO druzyna_trener (IDDT,trener_idTrener,druzyna_iddruzyna,od,do) VALUES (5,5,5,1996,null);
INSERT INTO druzyna_trener (IDDT,trener_idTrener,druzyna_iddruzyna,od,do) VALUES (6,4,2,1999,2004);

insert into Wolni_Agenci (IdWA) values(2);
insert into Wolni_Agenci (IdWA) values(4);
insert into Wolni_Agenci (IdWA) values(5);

--PROCEDURA KTÓRA POZWALA NA PRZYZNANIE WSTECZ PREMII ZA MISTRZOSTWO W DANYM ROKU ZAWODNIKOM, KTÓRZY W CZASIE ZDOBYCIA MISTRZOSTWA MIELI MNIEJ NIZ 25 LAT
--(ROK I WYSOKOSC PREMII PODANE W PARAMETRACH)
--DODATKOWO PO POWYZSZEJ OPERACJI PROCEDURA UZUPEŁNIA TABELE Budzet_Mistrzow PRZECHOWUJACA SUME PIENIEDZY WYPŁACONYCH OBECNYM ZAWONIKOM MISTRZOWSKIEJ DRUZYNY.
Create PROCEDURE SBDproj1proc @rok INT, @premia INT
	
	
AS
BEGIN

declare @budzetTmp int
 insert into Budzet_Mistrzow (rok,budzet) values(@rok,isnull(@budzetTmp,0))

	SET NOCOUNT ON;
DECLARE kurs CURSOR FOR
select imie,nazwisko,d.nazwa, data_urodzenia, dz.suma_kontrakt_mln,idZawodnik from Zawodnik z, Druzyna d, Druzyna_Zawodnik dz 
where Z.IdZawodnik=dz.Zawodnik_IdZawodnik and d.IdDruzyna=dz.Druzyna_IdDruzyna and year(dz.od)<=@rok and ( year(dz.do)>=@rok or dz.do is null) and
d.idDruzyna=(select Druzyna_IdDruzyna from Mistrzostwo where rok=@rok);

DECLARE @imie varchar(25), @nazwisko VARCHAR(25), @nazwa varchar(25),@data_urodzenia date,@suma_kontrakt_mln int,@idZ int
OPEN kurs
FETCH NEXT FROM kurs INTO @imie, @nazwisko, @nazwa, @data_urodzenia,@suma_kontrakt_mln,@idZ
WHILE @@FETCH_STATUS = 0
BEGIN
	  IF year(@data_urodzenia)>(@rok-25)
	  BEGIN
		  UPDATE Druzyna_Zawodnik SET suma_kontrakt_mln = @suma_kontrakt_mln+@premia WHERE Zawodnik_IdZawodnik=@idZ
		  PRINT 'Zawodnik o imieniu ' +@imie + ' ' + @nazwisko+' z '+ @nazwa+ ' zdobywa premię za zdobycie mistrzostwa jako młody zawodnik w '+ CAST(@rok as VARCHAR)+' roku w wysokosci '+CAST(@premia as VARCHAR)
		  UPDATE Budzet_Mistrzow SET  budzet=budzet +isnull(@suma_kontrakt_mln+@premia,0) 
	  END
	  ELSE
	  BEGIN
		 UPDATE Budzet_Mistrzow SET  budzet=budzet +isnull(@suma_kontrakt_mln,0) 
	  END
      FETCH NEXT FROM kurs INTO @imie, @nazwisko, @nazwa, @data_urodzenia,@suma_kontrakt_mln,@idZ
END

CLOSE kurs
DEALLOCATE kurs
END
GO

--PREZENTACJA DZIAŁANIA PROCEDURY Z KURSOREM
--tab Druzyna_Zawodnik i Budzet_Mistrzow przed
select * from druzyna_zawodnik;
select * from Budzet_Mistrzow;
--Uruchomienie procedury
exec wer1p @rok=2016, @premia=3;
--tab Druzyna_Zawodnik i Budzet_Mistrzow po
select * from druzyna_zawodnik;
select * from Budzet_Mistrzow;


--Wyzwalacz który nie dopuszcza rozpoczęcia współpracy między zawodnikiem a druzyną, jeśli obecnie nie zakończona jest współpraca z inną drużyną.
--Jeśli zawodnik nie jest obecenie w żadnej drużynie wyzwalacz zezwala na dodanie go do tabeli Druzyna_Zawodnik i usuwa go z Tabeli Wolni_Agenci.
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER TRIGGER SBDproj1trig
   ON  Druzyna_Zawodnik
   FOR INSERT,DELETE
AS 
BEGIN
	
	SET NOCOUNT ON;

	IF EXISTS (SELECT 1 FROM inserted i left join deleted d on i.IdDZ=d.IdDZ where d.IdDZ is null and 
	exists (select 1 from Druzyna_Zawodnik dz where i.Zawodnik_IdZawodnik=dz.Zawodnik_IdZawodnik and dz.do is null))
	BEGIN
			RAISERROR ('Zawodnik należy w tym czasie do innej drużyny!', 15, 1);
			ROLLBACK;
	END
	IF EXISTS (SELECT 1 FROM inserted i left join deleted d on i.IdDZ=d.IdDZ where d.IdDZ is null and 
	not exists (select 1 from Druzyna_Zawodnik dz where i.Zawodnik_IdZawodnik=dz.Zawodnik_IdZawodnik and dz.do is null))
	BEGIN
			DELETE FROM Wolni_Agenci where IdWA=(select Zawodnik_IdZawodnik from Inserted i where i.Zawodnik_IdZawodnik=Wolni_Agenci.IdWA);
	END
   

END
GO



--PREZENTACJA DZIAŁANIA WYZWALACZA 
--tabele Druzyna_Zawodnik, Wolni_Agenci przed
select* from Wolni_Agenci;
select * from Druzyna_Zawodnik;

--próba dodania zawodnika który jest obecnie w innej druzynie(wyzwalacz nie dopuści do tej operacji)
insert into Druzyna_Zawodnik (IDDZ,zawodnik_idzawodnik,druzyna_iddruzyna,od,do,suma_kontrakt_mln) values(20,7,1,'2019-06-19','2023-06-20',10);
--próba dodania zawodnika który nie jest obecnie w innej druzynie(wyzwalacz dopuści dodanie wiersza i usunie wiersz dotyczacy zawodnika o ID 5 z tabeli Wolni_Agenci)
insert into Druzyna_Zawodnik (IDDZ,zawodnik_idzawodnik,druzyna_iddruzyna,od,do,suma_kontrakt_mln) values(21,5,1,'2019-06-19','2023-06-20',10);

--tabele Druzyna_Zawodnik, Wolni_Agenci po
select* from Wolni_Agenci;
select * from Druzyna_Zawodnik;