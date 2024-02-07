<?php

require_once APPPATH.DIRECTORY_SEPARATOR.'models'.DIRECTORY_SEPARATOR.'entity'.DIRECTORY_SEPARATOR."ArticleEntity.php";

class SousCategorieEntity {
    private string $nom;
    private array $articles = array(); //array<ArticleEntity>

    public function getNom(): string
    {
        return $this->nom;
    }

    public function setNom(string $newNom)
    {
        $this->nom = $newNom;
    }

    /**
     * @return array<ArticleEntity>
     */
    public function getArticles(): array
    {
        return $this->articles;
    }

    /**
     * @param array<ArticleEntity>
     */
    public function ajouterArticle(array $newArticles)
    {
        for ($i=0;$i<count($newArticles);$i++) {
            if (gettype($newArticles[$i]) == "ArticleEntity") {
                array_push($this->articles, $newArticles[$i]);
            }
        }
    }

    public function supprimerArticle(ArticleEntity $article)
    {
        for ($i=0; $i<count($this->articles); $i++) {
            if ($this->articles[$i]->getID() == $article->getID()) {
                unset($this->articles[$i]);
                sort($this->articles[$i]);
                break;
            }
        }
    }
}

?>