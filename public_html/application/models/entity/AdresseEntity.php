<?php


class AdresseEntity{
    private int $numero;
    private string $rue;
    private int $codePostal;
    private string $ville;


    public function getNumero():int{
        return $this -> numero;
    }

    public function setNumero(int $numero){
        if ($numero < 1){
            die("Le numero d'adresse doit être positif");
        }
        $this -> numero = $numero;
    }


    public function getRue(): string{
        return $this -> rue;
    }

    public function setRue(string $rue){
        if (strlen($rue) < 5){
            die("La taille de l'adresse semble incorrect");
        }
        $this -> rue = $rue;
    }


    public function getCodePostal(): int{
        return $this -> codePostal;
    }

    public function setCodePostal(int $codePostal){
        if (strlen($codePostal) != 5){
            die("le code postal est invalide");
        }
        $this -> codePostal = $codePostal;
    }

    public function getVille(): string{
        return $this -> ville;
    }

    public function setville(string $ville){
        if (strlen($this->codePostal) < 3){
            die("le code postal est invalide");
        }
        $this -> ville = $ville;
    }

    public function obtenirAdresseComplete(): string{
        return $this -> numero." ".$this -> rue." / ".$this -> codePostal." / ".$this -> ville;
    }
}
?>