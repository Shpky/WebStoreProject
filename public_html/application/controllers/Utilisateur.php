<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require APPPATH.DIRECTORY_SEPARATOR.'models'.DIRECTORY_SEPARATOR.'entity'.DIRECTORY_SEPARATOR."UtilisateurEntity.php";
class Utilisateur extends CI_Controller
{
 public function __construct()
 {
 parent::__construct();
 $this->load->helper('url');
 $this->load->model('model/UtilisateurModel');
 }
 function login(){
 $this->load->view('connexion');
 }

 function loginCheck(){
 $nomDUtilisateur = $this->input->post('nomDUtilisateur');
 $motsDePasse = $this -> input -> post('motsDePasse');
 $utilisateur = $this -> UtilisateurModel -> findByNomDUtilisateur($nomDUtilisateur);
 if ($utilisateur != null && $utilisateur -> isValidMotsDePasse($motsDePasse)) {

 $this->session->set_userdata("user",
 array("user"=>$utilisateur->getNomDUtilisateur(),
 "status"=>$utilisateur->getStatus()));
 redirect("home");
 die();
 }
 $this->load->view('accesRefuse.php');
 }

 function logout(){
 $this->session->unset_userdata("login");
 $this->session->sess_destroy();
 redirect("home");
 }
}