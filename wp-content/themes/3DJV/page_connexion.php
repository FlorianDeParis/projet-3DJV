<?php

/*
Template Name: Page de connexion
*/




get_header(); 


?>

<div id="container">
	<div class="login-branding">
	    <a href="#" class="login-logo"></a>
	    <h2 class="login-desc">
	        CONNEXION
	    </h2>
	</div>
	<span class="sprt2"></span>
	<div class="login-form">
		<?php
			$args = array(
			    'redirect' => home_url(), 
			    'id_username' => 'user',
			    'id_password' => 'pass',) ;

			$uri = $_SERVER['REQUEST_URI'];
			$elms = explode('=', $uri) ;
			$value1 = $elms[1] ; // for the first parameter
			$value2 = $elms[2] ;
 
			if ( $value2 === "failed" ) {
			    echo '<p class="login-msg"><strong>Erreur:</strong> Identifiant et/ou mot de passe invalide.</p>';
			} elseif ( $value2 === "empty" ) {
			    echo '<p class="login-msg"><strong>Erreur:</strong> Identifiant et/ou mot de passe vide.</p>';
			} elseif ( $value2 === "false" ) {
			    echo '<p class="login-msg"><strong>Erreur:</strong> You are logged out.</p>';
			}

			wp_login_form( $args );
			echo '<p class="insc-desc"> SI VOUS N\'AVEZ PAS DE COMPTE VOUS POUVEZ VOUS INSCRIRE GRÂCE AU LIEN CI-DESSOUS</p>
			<a class="insc_link" href="'.get_site_url().'/?page_id=93">Inscription</a>';
		?>
	</div>
	<div id="content" role="main">

	<?php
	/*
	 * Run the loop to output the page.
	 * If you want to overload this in a child theme then include a file
	 * called loop-page.php and that will be used instead.
	 */

	?>
	</div><!-- #content -->
		</div><!-- #container -->

<?php get_sidebar(); ?>
<?php get_footer(); ?>