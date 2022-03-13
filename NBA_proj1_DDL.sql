

-- Table: Druzyna
CREATE TABLE Druzyna (
    IdDruzyna int  NOT NULL,
    rok_utworzenia smallint  NOT NULL,
    nazwa varchar(25)  NOT NULL,
    CONSTRAINT Druzyna_pk PRIMARY KEY  (IdDruzyna)
);

-- Table: Druzyna_Trener
CREATE TABLE Druzyna_Trener (
    IdDT int  NOT NULL,
    Trener_IdTrener int  NOT NULL,
    Druzyna_IdDruzyna int  NOT NULL,
    od smallint  NOT NULL,
    do smallint  NULL,
    CONSTRAINT Druzyna_Trener_pk PRIMARY KEY  (IdDT)
);

-- Table: Druzyna_Zawodnik
CREATE TABLE Druzyna_Zawodnik (
    IdDZ int  NOT NULL,
    Zawodnik_IdZawodnik int  NOT NULL,
    Druzyna_IdDruzyna int  NOT NULL,
    od date  NOT NULL,
    do date  NULL,
    CONSTRAINT Druzyna_Zawodnik_pk PRIMARY KEY  (IdDZ)
);

-- Table: Mistrzostwo
CREATE TABLE Mistrzostwo (
    rok smallint  NOT NULL,
    Druzyna_IdDruzyna int  NOT NULL,
    CONSTRAINT Mistrzostwo_pk PRIMARY KEY  (rok)
);

-- Table: Trener
CREATE TABLE Trener (
    IdTrener int  NOT NULL,
    data_urodzenia date  NOT NULL,
    imie varchar(25)  NOT NULL,
    nazwisko varchar(25)  NOT NULL,
    CONSTRAINT Trener_pk PRIMARY KEY  (IdTrener)
);

-- Table: Zawodnik
CREATE TABLE Zawodnik (
    idZawodnik int  NOT NULL,
    data_urodzenia date  NOT NULL,
    Wzrost smallint  NOT NULL,
    imie varchar(25)  NOT NULL,
    nazwisko varchar(25)  NOT NULL,
    pozycja varchar(25)  NOT NULL,
    CONSTRAINT Zawodnik_pk PRIMARY KEY  (idZawodnik)
);


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



