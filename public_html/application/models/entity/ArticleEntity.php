<?php
require APPPATH.DIRECTORY_SEPARATOR.'models'.DIRECTORY_SEPARATOR.'entity'.DIRECTORY_SEPARATOR."ProduitEntity.php";

class ArticleEntity {
    private Int $ID;
    private String $nom;
    private String $description;
    private array $photosParDefaut = array(); //array<String>
    private array $produits = array(); //array<Produit>

    public function getId(): Int 
    {
        return $this->ID;
    }

    public function setID(Int $newID)
    {
        $this->ID = $newID;
    }

    public function getNom(): String
    {
        return $this->nom;
    }

    public function setNom(String $newNom)
    {
        $this->nom = $newNom;
    }

    public function getDescription(): String
    {
        return $this->description;
    }

    public function setDescription(String $newDescription)
    {
        $this->description = $newDescription;
    }

    /**
     * @return array<String>
     */
    public function getPhotoDefaut(): Array
    {
        return $this->photosParDefaut;
    }

    /**
     * @param array<String>
     */
    public function setPhotoDefaut(Array $newPhoto)
    {
        $this->photosParDefaut = $newPhoto;
    }

    /**
     * @return array<ProduitEntity>
     */
    public function getProduits(): Array
    {
        return $this->produits;
    }

    public function supprimerProduit(ProduitEntity $produit)
    {
        for ($i=0; $i<count($this->produits); $i++) {
            if ($this->produits[$i]->getID() == $produit->getID()) {
                unset($this->produits[$i]);
                sort($this->produits[$i]);
                break;
            }
        }
    }

    public function ajouterProduit(ProduitEntity $produit)
    {
        array_push($this->produits, $produit);
    }
}

?>