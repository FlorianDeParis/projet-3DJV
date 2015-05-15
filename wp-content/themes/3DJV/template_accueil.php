<?php
/**
 * Template Name: accueil page
 * Template for displaying accueil page
 *
 * This is the template that displays all pages by default.
 * Please note that this is the WordPress construct of pages
 * and that other 'pages' on your WordPress site will use a
 * different template.
 *
 * @package WordPress
 * @subpackage Twenty_Ten
 * @since Twenty Ten 1.0
 */

get_header(); ?>
	<div id="container">
		<div id="content" role="main">
			<div id="main-box-1" class="main-box vce-border-top main-box-half">
				<div class="main-box-header">
					<span class="sprt"></span>
					<a href=""><h3 class="main-box-title cat-319">Actualité</h3></a>
					<span class="sprt"></span>
				</div>
				<div class="main-box-content">
					test box 1
				</div>
			</div>
			<div class="main-box-middle">
				<div id="main-box-2" class="main-box vce-border-top main-box-half">
					<div class="main-box-header">
						<span class="sprt"></span>
						<a href=""><h3 class="main-box-title cat-319">TP</h3></a>
						<span class="sprt"></span>
					</div>
					<div class="main-box-content">
						test box 2
					</div>
				</div>
				<div id="main-box-3" class="main-box vce-border-top main-box-half">
					<div class="main-box-header">
						<span class="sprt"></span>
						<a href=""><h3 class="main-box-title cat-319">Tutos</h3></a>
						<span class="sprt"></span>
					</div>
					<div class="main-box-content">
						text box 3
					</div>
				</div>
			</div>
			<div id="main-box-4" class="main-box vce-border-top main-box-half">
				<div class="main-box-header">
					<span class="sprt"></span>
					<a href=""><h3 class="main-box-title cat-319">Médias</h3></a>
					<span class="sprt"></span>
				</div>
				<div class="main-box-content">
					text box 4
				</div>
			</div>
			<?php
			/*
			 * Run the loop to output the page.
			 * If you want to overload this in a child theme then include a file
			 * called loop-page.php and that will be used instead.
			 */
			//get_template_part( 'loop', 'page' );
			?>
		</div><!-- #content -->
	</div><!-- #container -->
<?php get_sidebar(); ?>
<?php get_footer(); ?>
