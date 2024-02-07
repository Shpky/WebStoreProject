<?php
defined('BASEPATH') OR exit('No direct script access allowed');
$this -> load -> helper('url');
?><!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="utf-8">
	<title>Young</title>

	<style type="text/css">
	</style>
</head>
<body>

<form action="<?=site_url("/Utilisateur/loginCheck")?>" method="post">
	<input type="text" name="nomDUtilisateur" placeholder="nom d'utilisateur">
	<input type="password" name="motsDePasse" placeholder="mots de passe">
	<input type="submit" value="Se connecter">
</form>

</body>
</html>
