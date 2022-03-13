--Wyzwalacz który nie dopuszcza y wspó³pracy miêdzy zawodnikiem a druzyn¹, jeœli obecnie nie zakoñczona jest wspó³praca z inn¹ dru¿yn¹.
--Jeœli zawodnik nie jest obecenie w ¿adnej dru¿ynie wyzwalacz zezwala na dodanie go do tabeli Druzyna_Zawodnik i usuwa go z Tabeli Wolni_Agenci.
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

	IF EXISTS (SELECT 1 FROM inserted i left join deleted d on i.IdDZ=d.IdDZ where d.IdDZ is null and exists (select 1 from Druzyna_Zawodnik dz where i.Zawodnik_IdZawodnik=dz.Zawodnik_IdZawodnik and dz.do is null))
	BEGIN
			RAISERROR ('Zawodnik nale¿y w tym czasie do innej dru¿yny!', 15, 1);
			ROLLBACK;
	END
	IF EXISTS (SELECT 1 FROM inserted i left join deleted d on i.IdDZ=d.IdDZ where d.IdDZ is null and not exists (select 1 from Druzyna_Zawodnik dz where i.Zawodnik_IdZawodnik=dz.Zawodnik_IdZawodnik and dz.do is null))
	BEGIN
			DELETE FROM Wolni_Agenci where IdWA=(select Zawodnik_IdZawodnik from Inserted i where i.Zawodnik_IdZawodnik=Wolni_Agenci.IdWA);
	END
   

END
GO
