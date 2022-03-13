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

INSERT INTO druzyna_zawodnik (IDDZ,zawodnik_idzawodnik,druzyna_iddruzyna,od,do) VALUES (1,1,1,'2003-06-26','2010-07-01');
INSERT INTO druzyna_zawodnik (IDDZ,zawodnik_idzawodnik,druzyna_iddruzyna,od,do) VALUES (2,2,3,'1984-06-19','1993-06-20');
INSERT INTO druzyna_zawodnik (IDDZ,zawodnik_idzawodnik,druzyna_iddruzyna,od,do) VALUES (3,3,1,'2011-06-23','2018-06-13');
INSERT INTO druzyna_zawodnik (IDDZ,zawodnik_idzawodnik,druzyna_iddruzyna,od,do) VALUES (4,4,2,'1996-07-02','2016-04-13');
INSERT INTO druzyna_zawodnik (IDDZ,zawodnik_idzawodnik,druzyna_iddruzyna,od,do) VALUES (5,6,5,'2011-06-24','2018-07-18');
INSERT INTO druzyna_zawodnik (IDDZ,zawodnik_idzawodnik,druzyna_iddruzyna,od,do) VALUES (6,1,2,'2018-07-01',null);
INSERT INTO druzyna_zawodnik (IDDZ,zawodnik_idzawodnik,druzyna_iddruzyna,od,do) VALUES (7,7,1,'2014-08-23',null);

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

