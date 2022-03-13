Create PROCEDURE SBDproj1proc @rok INT, @premia INT
	
	
AS
BEGIN

declare @budzetTmp int
 insert into Budzet_Mistrzow (rok,budzet) values(@rok,isnull(@budzetTmp,0))

	SET NOCOUNT ON;
DECLARE kurs CURSOR FOR
select imie,nazwisko,d.nazwa, data_urodzenia, dz.suma_kontrakt_mln,idZawodnik from Zawodnik z, Druzyna d, Druzyna_Zawodnik dz where Z.IdZawodnik=dz.Zawodnik_IdZawodnik and d.IdDruzyna=dz.Druzyna_IdDruzyna and year(dz.od)<=@rok and ( year(dz.do)>=@rok or dz.do is null) and
d.idDruzyna=(select Druzyna_IdDruzyna from Mistrzostwo where rok=@rok);

DECLARE @imie varchar(25), @nazwisko VARCHAR(25), @nazwa varchar(25),@data_urodzenia date,@suma_kontrakt_mln int,@idZ int
OPEN kurs
FETCH NEXT FROM kurs INTO @imie, @nazwisko, @nazwa, @data_urodzenia,@suma_kontrakt_mln,@idZ
WHILE @@FETCH_STATUS = 0
BEGIN
	  IF year(@data_urodzenia)>(@rok-25)
	  BEGIN
		  UPDATE Druzyna_Zawodnik SET suma_kontrakt_mln = @suma_kontrakt_mln+@premia WHERE Zawodnik_IdZawodnik=@idZ
		  PRINT 'Zawodnik o imieniu ' +@imie + ' ' + @nazwisko+' z '+ @nazwa+ ' zdobywa premiê za zdobycie mistrzostwa jako m³ody zawodnik w '+ CAST(@rok as VARCHAR)+' roku w wysokosci '+CAST(@premia as VARCHAR)
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
