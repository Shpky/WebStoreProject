<?php

require_once APPPATH.DIRECTORY_SEPARATOR.'models'.DIRECTORY_SEPARATOR.'entity'.DIRECTORY_SEPARATOR."UtilisateurEntity.php";
require APPPATH.DIRECTORY_SEPARATOR.'models'.DIRECTORY_SEPARATOR.'entity'.DIRECTORY_SEPARATOR."ProduitEntity.php";
require APPPATH.DIRECTORY_SEPARATOR.'models'.DIRECTORY_SEPARATOR.'entity'.DIRECTORY_SEPARATOR."ArticleEntity.php";
require APPPATH.DIRECTORY_SEPARATOR.'models'.DIRECTORY_SEPARATOR.'entity'.DIRECTORY_SEPARATOR."CatalogueEntity.php";
require APPPATH.DIRECTORY_SEPARATOR.'models'.DIRECTORY_SEPARATOR.'entity'.DIRECTORY_SEPARATOR."CategorieEntity.php";

class AdministrateurEntity extends UtilisateurEntity {

    public function ajouterCategorie(CatalogueEntity $catalogue, CategorieEntity $categorie)
    {
        $catalogue->ajouterCategorie(array($categorie));
    }

    public function supprimerCategorie(CatalogueEntity $catalogue, CategorieEntity $categorie)
    {
        $catalogue->supprimerCategorie($categorie);
    }

    public function supprimerProduit(ArticleEntity $article, ProduitEntity $produit)
    {
        $article->supprimerProduit($produit);
    }

    public function ajouterProduit(ArticleEntity $article, ProduitEntity $produit)
    {
        $article->ajouterProduit($produit);
    }

    public function modifierNom($objet, string $newNom) // ArticleEntity | CategorieEntity à ajouter après php8.0
    {
        if (gettype($objet)=="ArticleEntity"||gettype($objet)=="Categorie") { // if à supprimer après php8.0
            $objet->setNom($newNom);
        }
    }

}
?>