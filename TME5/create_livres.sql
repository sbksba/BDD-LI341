CREATE TABLE LIVRE (
        COTE    CHAR(6),
        TITRE    VARCHAR(255) NOT NULL,
        CATEGORIE    VARCHAR(30) NOT NULL,
        AUTEUR    VARCHAR(128),
        CONSTRAINT clef_livre PRIMARY KEY (COTE),
        CONSTRAINT categorie_livre CHECK (CATEGORIE in 
('Policier','Littérature','Divers', 'Essai', 'BD', 'SF') )
);

CREATE TABLE LECTEUR(
    NOLECTEUR SMALLINT NOT NULL,
    NOM VARCHAR(128),
    ADRESSE VARCHAR(255),
    CONSTRAINT lecteur PRIMARY KEY(NOLECTEUR)
);

CREATE TABLE PRET (
    COTE    CHAR(6),
    NOLECTEUR    INT,
    DATEEMPRUNT date NOT NULL,
    DATELIMITE date NOT NULL,
    RENDU CHAR(3) NOT NULL,
    CONSTRAINT pret UNIQUE(COTE,NOLECTEUR),
    CONSTRAINT pret_ref_cote FOREIGN KEY(COTE) REFERENCES LIVRE,
    CONSTRAINT pret_ref_lecteur FOREIGN KEY(NOLECTEUR) REFERENCES LECTEUR,
    CONSTRAINT pret_dates check (DATEEMPRUNT < DATELIMITE),
    CONSTRAINT pret_rendu check (RENDU in ('oui','non'))
);
