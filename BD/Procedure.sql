//TODO procedure produit
CREATE OR REPLACE PACKAGE add_user IS
    PROCEDURE admin (
        nomDUtilisateur   IN   VARCHAR2,
        psw     IN   varchar2
        
    );
    
    PROCEDURE client (
        nomDUtilisateur   IN   VARCHAR2,
        psw     IN   VARCHAR2,
        nom   in VARCHAR2,
        prenom    IN   VARCHAR2,
        numeroDeTel in VARCHAR2,
        adresse in VARCHAR2,
        adresseEmail in VARCHAR2
    );
    
    

END;
/
CREATE OR REPLACE PACKAGE BODY add_user IS

    PROCEDURE admin (
        nomDUtilisateur   IN   VARCHAR2,
        psw     IN   varchar2
    ) IS
    BEGIN
    declare
    cursor empCursor is
           select * from Utilisateur; 
    old_utilisateur utilisateur%ROWTYPE;
    actualid utilisateur.ID_UTI%TYPE := 0;
begin 
   open empCursor;
   loop 
            /* Accès à chacun des tuples */
        fetch empCursor into old_utilisateur; 
        exit when empCursor%NOTFOUND;

             /* traitement du tuple */
        if actualid < old_utilisateur.ID_UTI then 
                  actualid := old_utilisateur.ID_UTI; 
        end if;
             /* fin traitement tuple */
            
    end loop;
    actualid := actualid+1;
    insert into  utilisateur(ID_UTI,nomDUTILISATEUR,motDePasse) values(actualid,nomDUtilisateur,psw); 
    insert into administrateur (id_uti) values(actualid);
end; end;


PROCEDURE client(
        nomDUtilisateur   IN   VARCHAR2,
        psw     IN   VARCHAR2,
        nom   in VARCHAR2,
        prenom    IN   VARCHAR2,
        numeroDeTel in VARCHAR2,
        adresse in VARCHAR2,
        adresseEmail in VARCHAR2
    
    )   
IS
    BEGIN
    declare
    cursor empCursor is
           select * from utilisateur; 
    old_utilisateur utilisateur%ROWTYPE;
    actualid utilisateur.ID_UTI%TYPE := 0;
begin 
   open empCursor;
   loop 
            /* Accès à chacun des tuples */
        fetch empCursor into old_utilisateur; 
        exit when empCursor%NOTFOUND;

             /* traitement du tuple */
        if actualid < old_utilisateur.ID_UTI then 
                  actualid := old_utilisateur.ID_UTI; 
        end if;
             /* fin traitement tuple */
            
    end loop;
    actualid := actualid+1;
    insert into  utilisateur(ID_UTI,nomDUTILISATEUR,motDePasse) values(actualid,nomDUtilisateur,psw); 
    insert into client(id_uti,nom,prenom,numerotel,adresse,adresseemail)  values(actualid,nom,prenom,numeroDeTel,adresse,adresseEmail);
    end; 
    END;
    END;
                                                                        
/


    

   
    
--============================== TEST ==============================
execute maj_add.creer_admin('Noa','Adrien');
select * from administrateur;
select * from utilisateur;
select * from client;

execute add_user.client('Jean-Paul','Jack','Jean-Paul','Jack','0123456789','iut nantes','sql@etu.univ-nantes.fr');
select * from client;
execute add_user.admin('Oui','Non');

--==================================================================
CREATE OR REPLACE PACKAGE delete_user IS
    PROCEDURE admin (
        ID in number
        
    ); 
    PROCEDURE client (
        ID IN number
    
    );
    
    END;
    
/
CREATE OR REPLACE PACKAGE BODY delete_user is
PROCEDURE admin (
    ID in number
) is begin 
    delete administrateur where id_uti = id;
    delete utilisateur where id_uti = id;
    END;

PROCEDURE client(
    ID IN number
)is begin 
    delete client where id_uti = id;
    delete utilisateur where id_uti = id;
    END;

END;
/

execute delete_user.client(3);
select * from client;
select * from utilisateur;
select * from administrateur;
execute delete_user.admin(1);

create or replace package update_user is 
procedure admin(
    id in number,
    nomuti in varchar2,
    mdp in varchar2
    
    
    

);

procedure client(
    id in number,
    nomuti in varchar2,
    mdp in varchar2,
    new_nom in varchar2,
    new_prenom in varchar2,
    new_numerotel in varchar2,
    new_adresse in varchar2,
    new_adressemail in varchar2
    
);

END;
/
create or replace package body update_user is 
procedure admin(
    id in number,
    nomuti in varchar2,
    mdp in varchar2
    ) is BEGIN 
    
    update utilisateur set NOMDUTILISATEUR = nomuti, MOTDEPASSE = mdp where id_uti =id;
    
    
    END;
    procedure client(
    id in number,
    nomuti in varchar2,
    mdp in varchar2,
    new_nom in varchar2,
    new_prenom in varchar2,
    new_numerotel in varchar2,
    new_adresse in varchar2,
    new_adressemail in varchar2
    
    )is begin 
    update utilisateur set NOMDUTILISATEUR = nomuti, MOTDEPASSE = mdp where id_uti =id;
    update client set NOM =new_nom ,PRENOM= new_prenom,NUMEROTEL=new_numerotel,ADRESSE=new_adresse,ADRESSEEMAIL=new_adressemail where id_uti = id;   
    
    
    END;END;
/
execute update_user.admin(1,'nomdadmin','unmdpadmin');
execute update_user.client(3,'bref','bref2','bref3','bref4','123456789','adresse','email@etu.univ-nantes.fr');
desc utilisateur;
desc client;
select * from administrateur;
select *from utilisateur;
select * from client;
