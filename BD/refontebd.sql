/*ALTER TABLE administrateur DISABLE CONSTRAINT pk_admin;
ALTER TABLE panier DISABLE CONSTRAINT pk_panier;
ALTER TABLE Liste_ExemplairePanier DISABLE CONSTRAINT fk_Liste_ExemplairePanier1;
ALTER TABLE Liste_ExemplairePanier DISABLE CONSTRAINT fk_Liste_ExemplairePanier2;
ALTER TABLE Exemplaire DISABLE CONSTRAINT fk_exemplaire;
ALTER TABLE Exemplaire DISABLE CONSTRAINT fk_exemplaire1;
ALTER TABLE categorie DISABLE CONSTRAINT fk_categorie;
ALTER TABLE categorie DISABLE CONSTRAINT fk_categorie1;
ALTER TABLE photo DISABLE CONSTRAINT fk_photo;
ALTER TABLE photo DISABLE CONSTRAINT fk_photo1;
ALTER TABLE adresse DISABLE CONSTRAINT fk_adresse;
*/
drop table administrateur;
drop table client;
drop table utilisateur;
drop table exemplaire;
drop table liste_categorie;
drop table liste_exemplairepanier;
drop table panier;
drop table liste_photo;
drop table produit;
drop table categorie;
drop table adresse;
drop table photo;
drop table taille;

--////////////////////////////////////////////////////
-- TABLE Utilisateur
--////////////////////////////////////////////////////
create table Utilisateur(
    ID_Uti NUMBER NOT NULL,
    nomutilisateur VARCHAR2(15) NOT NULL,
    mdp VARCHAR2(15) NOT NULL,
    CONSTRAINT pk_utilisateur PRIMARY KEY ( ID_Uti)
);
--////////////////////////////////////////////////////
-- TABLE Administrateur
--////////////////////////////////////////////////////
create table Administrateur(
    ID_Uti NUMBER NOT NULL,
    ID_Admin NUMBER NOT NULL,
    CONSTRAINT pk_admin PRIMARY KEY ( ID_Admin)

);

--////////////////////////////////////////////////////
-- TABLE Client
--////////////////////////////////////////////////////
create table Client (
    ID_Uti NUMBER NOT NULL,
    ID_Client NUMBER NOT NULL,
    ID_Adresse NUMBER ,
    nom VARCHAR2(20),
    prenom VARCHAR2(20),
    numeroTel VARCHAR2(10),
    adresseMail VARCHAR2(50),
    CONSTRAINT pk_client PRIMARY KEY ( ID_Client)
    
);
--////////////////////////////////////////////////////
-- TABLE Panier
--////////////////////////////////////////////////////
create table Panier(
ID_Panier NUMBER NOT NULL,
ID_Client NUMBER,
PayerOuNon VARCHAR2(1),
CONSTRAINT pk_Panier PRIMARY KEY (ID_Panier)
);
--////////////////////////////////////////////////////
-- TABLE Liste_ExemplairePanier
--////////////////////////////////////////////////////
create table Liste_ExemplairePanier(
ID_Panier NUMBER,
ID_Exemplaire NUMBER,
Quantite NUMBER,
CONSTRAINT pk_Liste_ExemplairePanier_ PRIMARY KEY ( ID_Panier,ID_Exemplaire)

);
--////////////////////////////////////////////////////
-- TABLE Produit
--////////////////////////////////////////////////////
create table Produit(
    ID_Produit NUMBER NOT NULL,
    ID_Client NUMBER NOT NULL,
    Nom VARCHAR2(20) NOT NULL,
    Descriptions VARCHAR2(2000) NOT NULL,
    DateAjout Date,
    CONSTRAINT pk_Produit PRIMARY KEY ( ID_Produit )
    
);

--////////////////////////////////////////////////////
-- TABLE EXEMPLAIRE
--////////////////////////////////////////////////////
create table Exemplaire(
ID_Exemplaire NUMBER NOT NULL,
ID_Produit NUMBER,
Couleur VARCHAR2(10),
Taille VARCHAR2(5) NOT NULL,
Quantite NUMBER NOT NULL,
Reduction FLOAT,
PrixDeBase FLOAT NOT NULL,
CONSTRAINT pk_Exemplaire PRIMARY KEY ( ID_Exemplaire)
);
--////////////////////////////////////////////////////
-- TABLE Liste_catégorie
--////////////////////////////////////////////////////
create table liste_categorie(
Nom_cat VARCHAR2(20) NOT NULL,
CONSTRAINT pk_liste_cat PRIMARY KEY ( Nom_cat)

);

--////////////////////////////////////////////////////
-- TABLE catégorie
--////////////////////////////////////////////////////

create table categorie(
nom_cat VARCHAR2(20),
ID_Exemplaire NUMBER, 
CONSTRAINT pk_categorie PRIMARY KEY ( nom_cat,ID_Exemplaire)
);
--////////////////////////////////////////////////////
-- TABLE photo
--////////////////////////////////////////////////////
create table Photo(
ID_Photo Number NOT NULL,
ID_Exemplaire NUMBER,
ID_Produit NUMBER,
Lien VARCHAR2(2000),
Estledefault NUMBER(1),
CONSTRAINT pk_Photo PRIMARY KEY ( ID_Photo)
);
--////////////////////////////////////////////////////
-- TABLE TAILLE
--////////////////////////////////////////////////////
CREATE TABLE taille (
    lettre VARCHAR2(5),
    constraint pk_taille primary key (lettre)
);
--////////////////////////////////////////////////////
-- TABLE Adresse
--////////////////////////////////////////////////////
create table Adresse(
ID_Adresse NUMBER NOT NULL,
Numero Number,
Rue VARCHAR2(150),
CodePostal NUMBER,
Ville VARCHAR2(150),
CONSTRAINT pk_adresse PRIMARY KEY ( ID_Adresse)
);
--////////////////////////////////////////////////////
-- TABLE Adresse
--////////////////////////////////////////////////////
create table liste_photo (
    ID_Photo Number Not null,
    photo VARCHAR2(2000),
    ID_Exemplaire NUMBER NOT NULL,
    CONSTRAINT pk_liste_photo PRIMARY KEY ( ID_Photo)
);
--////////////////////////////////////////////////////
-- TABLE MODIFICATION DES TABLES
--////////////////////////////////////////////////////

alter table administrateur add CONSTRAINT fk_admin FOREIGN KEY ( ID_Uti) REFERENCES utilisateur ( ID_Uti );

alter table client add CONSTRAINT fk_client FOREIGN KEY ( ID_Uti) REFERENCES utilisateur ( ID_Uti );
alter table client add CONSTRAINT fk_client_adresse FOREIGN KEY ( ID_Adresse) REFERENCES Adresse ( ID_Adresse );

alter table panier add constraint fk_panier foreign key (ID_Client) REFERENCES client (ID_Client);

alter table Liste_ExemplairePanier add CONSTRAINT fk_Liste_ExemplairePanier1 FOREIGN KEY ( ID_Panier) REFERENCES Panier ( ID_Panier );
alter table Liste_ExemplairePanier add CONSTRAINT fk_Liste_ExemplairePanier2 FOREIGN KEY ( ID_Exemplaire) REFERENCES Exemplaire ( ID_Exemplaire );

alter table Exemplaire add CONSTRAINT fk_exemplaire foreign key (ID_Produit) references Produit (ID_Produit);
alter table Exemplaire add CONSTRAINT fk_exemplaire1 foreign key (taille) references taille (lettre);

alter table categorie add constraint fk_categorie foreign key (ID_Exemplaire) references Exemplaire (ID_Exemplaire);
alter table categorie add constraint fk_categorie1 foreign key (nom_cat) references liste_categorie (nom_cat);

alter table photo add constraint fk_photo foreign key ( ID_Exemplaire) REFERENCES Exemplaire ( ID_Exemplaire );



