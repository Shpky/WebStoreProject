<?php
require APPPATH.DIRECTORY_SEPARATOR.'models'.DIRECTORY_SEPARATOR.'entity'.DIRECTORY_SEPARATOR."CouleurEntity.php";
    class ProduitEntity{
        private int $ID;
        private CouleurEntity $couleur;
        private $taille;
        private int $quantite;
        private int $prixDeBase;
        private ?int $prix;
        private ?array $photos;

        public function getID(): int
        {
            return $this->ID;
        }

        public function getQuantite(): int
        {
            return $this->quantite;
        }

        public function setQuantite(int $newQuantite)
        {
            $this->quantite = $newQuantite;
        }

        public function ajouterPromotion(int $nouveauPrix): void{
            $this -> prix = $nouveauPrix;
        }

        public function supprimerPromotion(): void{
            $this -> prix = null;
        }

        public function ajouterPhoto(string $photoUrl): void{
            if (is_null($this -> photos)){
                $this -> photos = array($photoUrl);
                return;
            };
            array_push($this -> photos, $photoUrl);
        }

        public function supprimerPhoto($photoUrl): void{
            try{
                unset($this -> photos[array_search($photoUrl, $this -> photos)]);
                
            }
            catch(error $error){
            }
        }
    }
