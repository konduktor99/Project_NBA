select *from zawodnik;
select * from druzyna;
select* from Druzyna_zawodnik
select* from trener;
select * from druzyna_trener;
select * from wolni_agenci;
select* from budzet_mistrzow;

select imie,nazwisko,d.nazwa, data_urodzenia, dz.suma_kontrakt_mln,idZawodnik from Zawodnik z, Druzyna d, Druzyna_Zawodnik dz where Z.IdZawodnik=dz.Zawodnik_IdZawodnik and d.IdDruzyna=dz.Druzyna_IdDruzyna and year(dz.od)<=2016 and ( year(dz.do)>=2016 or dz.do is null) and
d.idDruzyna=(select Druzyna_IdDruzyna from Mistrzostwo where rok=2016);


--PREZENTACJA DZIA£ANIA PROCEDURY Z KURSOREM
--tab Druzyna_Zawodnik i Budzet_Mistrzow przed
select * from druzyna_zawodnik;
select * from Budzet_Mistrzow;
--Uruchomienie procedury
exec wer1p @rok=2016, @premia=3;
--tab Druzyna_Zawodnik i Budzet_Mistrzow po
select * from druzyna_zawodnik;
select * from Budzet_Mistrzow;

--****************************************

--PREZENTACJA DZIA£ANIA WYZWLCZA 
--tabele Druzyna_Zawodnik, Wolni_Agenci przed
select* from Wolni_Agenci;
select * from Druzyna_Zawodnik;

--próba dodania zawodnika który jest obecnie w innej druzynie(wyzwalacz nie dopuœci do tej operacji)
insert into Druzyna_Zawodnik (IDDZ,zawodnik_idzawodnik,druzyna_iddruzyna,od,do,suma_kontrakt_mln) values(20,7,1,'2019-06-19','2023-06-20',10);
--próba dodania zawodnika który nie jest obecnie w innej druzynie(wyzwalacz dopuœci dodanie wiersza i usunie wiersz dotyczacy zawodnika o ID 5 z tabeli Wolni_Agenci)
insert into Druzyna_Zawodnik (IDDZ,zawodnik_idzawodnik,druzyna_iddruzyna,od,do,suma_kontrakt_mln) values(21,5,1,'2019-06-19','2023-06-20',10);

--tabele Druzyna_Zawodnik, Wolni_Agenci po
select* from Wolni_Agenci;
select * from Druzyna_Zawodnik;


--
delete from Budzet_Mistrzow where rok=2016;