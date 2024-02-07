<?php

require APPPATH.DIRECTORY_SEPARATOR.'models'.DIRECTORY_SEPARATOR.'entity'.DIRECTORY_SEPARATOR."SousCategorieEntity.php";

class CatalogueEntity {
    private array $categories = array(); // array<CategorieEntity>

    /**
     * @return array<CategorieEntity>
     */
    public function getCategories(): array
    {
        return $this->categories;
    }

    public function ajouterCategorie(array $newCategories)
    {
        for ($i=0;$i<count($newCategories);$i++) {
            if (gettype($newCategories[$i]) == "CategorieEntity"){
                array_push($this->sousCategories, $newCategories[$i]);
            }
        }
    }

    public function supprimerCategorie(CategorieEntity $categorie)
    {
        for ($i=0; $i<count($this->categories); $i++) {
            if ($this->sousCategories[$i]->getNom() == $categorie->getNom()) {
                unset($this->sousCategories[$i]);
                sort($this->sousCategories[$i]);
                break;
            }
        }
    }
}
?>