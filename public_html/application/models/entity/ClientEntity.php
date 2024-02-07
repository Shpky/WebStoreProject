<?php
require_once APPPATH.DIRECTORY_SEPARATOR.'models'.DIRECTORY_SEPARATOR.'entity'.DIRECTORY_SEPARATOR."UtilisateurEntity.php";
require_once APPPATH.DIRECTORY_SEPARATOR.'models'.DIRECTORY_SEPARATOR.'entity'.DIRECTORY_SEPARATOR."AdresseEntity.php";
require_once APPPATH.DIRECTORY_SEPARATOR.'models'.DIRECTORY_SEPARATOR.'entity'.DIRECTORY_SEPARATOR."PanierEntity.php";

class ClientEntity extends UtilisateurEntity {
    private string $nom;
    private string $prenom;
    private string $adresseEmail;
    private ?AdresseEntity $adresse;
    private ?string $numeroDeTelephone;
    private PanierEntity $panier;

    public function getNom(): string
    {
        return $this->nom;
    }

    public function setNom(string $newNom)
    {
        $this->nom = $newNom;
    }


    public function getPrenom(): string
    {
        return $this->prenom;
    }

    public function setPrenom(string $newPrenom)
    {
        $this->prenom = $newPrenom;
    }

    public function getAdresseEmail(): string
    {
        return $this->adresseEmail;
    }

    public function setAdresseEmail(string $newAdresseEmail)
    {
        $this->adresseEmail = $newAdresseEmail;
    }


    public function getAdresse(): AdresseEntity
    {
        return $this->adresse;
    }

    public function ajouterAdresse(AdresseEntity $newAdresse)
    {
        $this->adresse = $newAdresse;
    }

    public function getNumeroDeTelephone(): ?string
    {
        return $this->numeroDeTelephone;
    }

    public function ajouterNumero(string $newNumero)
    {
        $this->numeroDeTelephone = $newNumero;
    }

    //public function acheterPanier()
    //{
    //    $this->panier->toutAcheter();
    //}

    //public function acheterProduit(ProduitEntity $produit)
    //{
    //    $this->panier->ajouter(produit);
    //}

    //public function consulterPanier(): array
    //{
    //    return $this->panier->consulter();
    //}


}
?>
