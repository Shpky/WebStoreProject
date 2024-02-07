--###################### TABLE UTILISATEUR --######################--
CREATE TABLE utilisateur (
    id_uti            NUMBER NOT NULL,
    nomdutilisateur   VARCHAR2(15),
    motDePasse          VARCHAR2(15),
    CONSTRAINT pk_utilisateur PRIMARY KEY ( id_uti )
);
/

--###################### TABLE ADMINNISTRATEUR --######################--

CREATE TABLE administrateur (
    id_uti NUMBER NOT NULL,
    CONSTRAINT pk_administrateur PRIMARY KEY ( id_uti )
);
/

--###################### TABLE CLIENT --######################--

CREATE TABLE client (
    id_uti         NUMBER NOT NULL,
    nom            VARCHAR2(20),
    prenom         VARCHAR2(15),
    numerotel      VARCHAR2(10),
    adresse        VARCHAR2(600),
    adresseemail   VARCHAR2(200),
    CONSTRAINT pk_client PRIMARY KEY ( id_uti )
);
/

--###################### TABLE PANIER --######################--

CREATE TABLE panier (
    id_panier    NUMBER NOT NULL,
    id_uti       NUMBER,
    id_prod      NUMBER,
    quantitepa   INT,
    CONSTRAINT pk_panier PRIMARY KEY ( id_panier )
);
/

--###################### TABLE SOUSCATEGORIE --######################--

CREATE TABLE souscategorie (
    nomscat VARCHAR2(20) NOT NULL,
    CONSTRAINT pk_souscategorie PRIMARY KEY ( nomscat )
);
/

--###################### TABLE CATEGORIE --######################--

CREATE TABLE categorie (
    nomcat VARCHAR2(20) NOT NULL,
    CONSTRAINT pk_categorie PRIMARY KEY ( nomcat )
);
/

--###################### TABLE ARTICLE --######################--

CREATE TABLE article (
    id_arti       NUMBER NOT NULL,
    nom           VARCHAR2(20),
    descrip       VARCHAR(500),
    photodefaut   VARCHAR(200),
    nomcat        VARCHAR2(20),
    nomscat       VARCHAR2(20),
    CONSTRAINT pk_article PRIMARY KEY ( id_arti )
);
/

--###################### TABLE PRODUIT --######################--

CREATE TABLE produit (
    id_prod      NUMBER NOT NULL,
    couleur      VARCHAR2(25),
    taille       VARCHAR2(3),
    quantitepr   INT,
    prixbase     FLOAT,
    prix         FLOAT,
    photos       VARCHAR2(200),
    id_arti      NUMBER,
    CONSTRAINT pk_produit PRIMARY KEY ( id_prod )
);
/

--###################### TABLE HISTOVENTE --######################--

CREATE TABLE histovente (
    id_vente    NUMBER NOT NULL,
    id_uti      NUMBER,
    id_prod     NUMBER,
    dateachat   VARCHAR2(8),
    CONSTRAINT pk_histovente PRIMARY KEY ( id_vente )
);
/

--###################### CLEFS ETRANGERES --######################--

ALTER TABLE ADMINNISTRATEUR
    ADD CONSTRAINT fk_ADMINISTRATEUR1 FOREIGN KEY ( id_uti )
        REFERENCES UTILISATEUR ( id_uti );

ALTER TABLE CLIENT
    ADD CONSTRAINT fk_CLIENT1 FOREIGN KEY ( id_uti )
        REFERENCES UTILISATEUR ( id_uti );
/

ALTER TABLE panier
    ADD CONSTRAINT fk_panier1 FOREIGN KEY ( id_uti )
        REFERENCES client ( id_uti );

ALTER TABLE panier
    ADD CONSTRAINT fk_panier2 FOREIGN KEY ( id_prod )
        REFERENCES produit ( id_prod );
/

ALTER TABLE article
    ADD CONSTRAINT fk_article1 FOREIGN KEY ( nomcat )
        REFERENCES categorie ( nomcat );

ALTER TABLE article
    ADD CONSTRAINT fk_article2 FOREIGN KEY ( nomscat )
        REFERENCES souscategorie ( nomscat );
/

ALTER TABLE produit
    ADD CONSTRAINT fk_produit1 FOREIGN KEY ( id_arti )
        REFERENCES article ( id_arti );
/

ALTER TABLE histovente
    ADD CONSTRAINT fk_histovente1 FOREIGN KEY ( id_uti )
        REFERENCES client ( id_uti );

ALTER TABLE histovente
    ADD CONSTRAINT fk_histovente2 FOREIGN KEY ( id_prod )
        REFERENCES produit ( id_prod );
/

