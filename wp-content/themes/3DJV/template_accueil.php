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
					<ul>
						<?php
						$actu_args = array( 'posts_per_page' => 10, 'order'=> 'ASC', 'orderby' => 'title', 'category' => 4, 'posts_per_page' => 5, 'offset'=> 1 );
						$postslist = get_posts( $actu_args );
						foreach ( $postslist as $post ) :
						  setup_postdata( $post ); ?> 
							<li>
								<!--<?php the_date(); ?>-->
								<p><?php the_title(); ?></p>
								<p class="main-box-content_excerpt"><?php the_excerpt(); ?></p>
								
							</li>
						<?php
						endforeach; 
						wp_reset_postdata();
						?>
						<li><a href="?cat=4">VOIR PLUS</a></li>
					</ul>
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
						<?php
						$tp_args = array( 'posts_per_page' => 10, 'order'=> 'ASC', 'orderby' => 'title', 'category' => 7, 'posts_per_page' => 5, 'offset'=> 1 );
						$postslist = get_posts( $tp_args );
						foreach ( $postslist as $post ) :
						  setup_postdata( $post ); ?> 
							<li>
								<?php the_date(); ?>
								<br />
								<?php the_title(); ?>   
								<?php the_excerpt(); ?>
							</li>
						<?php
						endforeach; 
						wp_reset_postdata();
						?>
						<li><a href="?cat=7">VOIR PLUS</a></li>
					</div>
				</div><div id="main-box-3" class="main-box vce-border-top main-box-half">
					<div class="main-box-header">
						<span class="sprt"></span>
						<a href=""><h3 class="main-box-title cat-319">Tutos</h3></a>
						<span class="sprt"></span>
					</div>
					<div class="main-box-content">
						<p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
						"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
					"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</p>
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
