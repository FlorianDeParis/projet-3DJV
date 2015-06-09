<?php
/**
 * Template Name: filtre données
 */

get_header(); 
$cat = $_GET['cat'];
$user = $current_user->display_name ;
echo "Vous êtes dans la catégorie ".$cat." et vous vous nommez ".$user ;
?>
<div>
	PAGE DU FILTRAGE DE DONNEES
</div>
<?php get_sidebar(); ?>
<?php get_footer(); ?>