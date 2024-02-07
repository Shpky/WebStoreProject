<?php
require APPPATH.DIRECTORY_SEPARATOR.'models'.DIRECTORY_SEPARATOR.'entity'.DIRECTORY_SEPARATOR."ProduitEntity.php";

class PanierEntity{
    private array $produits = array();

    public function ajouter(ProduitEntity $produit){
        if ($produit -> getQuantite() < 1){
            die("Il n'y a plus d'exemplaire disponible");
        };
        $produit -> setQuantite($produit -> getQuantite() - 1);
        array_push($this -> produits, $produit);
    }

    public function supprimer(ProduitEntity $produit){
        $produit -> setQuantite($produit -> getQuantite() + 1);
        unset($this -> produits[array_search($produit, $this -> produits)]);
    }
}

?>