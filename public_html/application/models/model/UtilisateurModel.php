<?php
    require_once APPPATH.DIRECTORY_SEPARATOR.'models'.DIRECTORY_SEPARATOR.'entity'.DIRECTORY_SEPARATOR."UtilisateurEntity.php";


    class UtilisateurModel extends CI_Model {
        function findAll(){
            $this->db->select('*');
            $q = $this->db->get('utilisateur');
            $reponse = $q-> custom_result_object("UtilisateurEntity");
            return $reponse;
    }
    public function findByNomDUtilisateur(string $nomDUtilisateur)
    {
    $this->db->select('*');
    $q = $this->db->get_where('utilisateur',array('nomDUtilisatuer'=>$nomDUtilisateur));
    $reponse = $q->row(0,"UtilisateurEntity");
    return $reponse;
    }
}
?>