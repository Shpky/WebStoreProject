<?php

require APPPATH.DIRECTORY_SEPARATOR.'models'.DIRECTORY_SEPARATOR.'entity'.DIRECTORY_SEPARATOR."SousCategorieEntity.php";

class CategorieEntity{
    private string $nom;
    private array $sousCategories = array(); // array<SousCategorieEntity>

    public function getNom()
    {
        return $this->nom;
    }

    public function setNom(string $newNom)
    {
        $this->nom = $newNom;
    }

    /**
     * @return array<SousCategorieEntity>
     */
    public function getSousCategories(): array
    {
        return $this->sousCategories;
    }

    /**
     * @param array<SousCategorieEntity>
     */
    public function ajouterSousCategorie(array $newSousCategorie)
    {
        for ($i=0;$i<count($newSousCategorie);$i++) {
            if (gettype($newSousCategorie[$i]) == "SousCategorieEntity") {
                array_push($this->sousCategories, $newSousCategorie[$i]);
            }
        }
    }

    public function supprimerSousCategorie(SousCategorieEntity $sousCategorie)
    {
        for ($i=0; $i<count($this->sousCategories); $i++) {
            if ($this->sousCategories[$i]->getNom() == $sousCategorie->getNom()) {
                unset($this->sousCategories[$i]);
                sort($this->sousCategories[$i]);
                break;
            }
        }
    }
}
?>