<?php
defined('BASEPATH') OR exit('No direct script access allowed');
$this -> load -> helper('url');
?><!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="utf-8">
	<title>Young</title>

	<style type="text/css"> </style>
</head>
<body>
<form action="<?php echo(site_url("/Utilisateur/login/"))?>">
    <input type="submit" value="Se connecter">
</form>
<?php echo phpinfo();?>
</body>
</html>
