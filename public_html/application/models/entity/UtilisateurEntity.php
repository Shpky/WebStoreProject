<?php
    abstract class UtilisateurEntity
    {
        private int $ID;
        private string $nomDUtilisateur;
        private string $motsDePasse;



        public function getID(): int{
            return $this -> ID;
        }

        public function setID(int $ID){
            $this -> ID = $ID;
        }
        public function isValidMotsDePasse(string $motsDePasse):bool {
            return password_verify($motsDePasse, $this->motsDePasse);
        }
        

        /**
         * @return string
         */
        public function getnomDUtilisateur(): string
        {
            return $this->nomDUtilisateur;
        }


        /**
        * @param string $nomDUtilisateur
        */
        public function setnomDUtilisateur(string $nomDUtilisateur): void
        {
            $this->nomDUtilisateur = $nomDUtilisateur;
        }


        /**
        * @return false|string|null
        */
        public function getMotsDePasse(): string
        {
            return $this->motsDePasse;
        }


        /**
        * @param false|string|null $motsDePasse
        */
        public function setMotsDePasse(string $motsDePasse): void
        {
            $this->motsDePasse = password_hash($motsDePasse, PASSWORD_DEFAULT);
        }


        /**
        * @param false|string|null $motsDePasse
        */
        public function setEncryptedMotsDePasse(string $motsDePasse): void
        {
            $this->motsDePasse = $motsDePasse;
        }
    }
?>