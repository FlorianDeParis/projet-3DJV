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
						$actu_args = array( 'posts_per_page' => 10, 'order'=> 'ASC', 'orderby' => 'title', 'category' => 4, 'posts_per_page' => 5, 'offset'=> 0 );
						$postslist = get_posts( $actu_args );
						foreach ( $postslist as $post ) :
						  setup_postdata( $post ); ?> 
							<li>
								<a href="<?php the_permalink();?>" class="no_underline no_hover article_link">
									<!--<?php the_date(); ?>-->
									<p><?php the_title(); ?></p>
									<p><?php the_excerpt(); ?></p>
								</a>
							</li>
						<?php
						endforeach; 
						wp_reset_postdata();
						?>
						<li><a href="?cat=4" class="no_hover">VOIR PLUS</a></li>
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
						$tp_args = array( 'posts_per_page' => 10, 'order'=> 'ASC', 'orderby' => 'title', 'category' => 7, 'posts_per_page' => 5, 'offset'=> 0 );
						$postslist = get_posts( $tp_args );
						foreach ( $postslist as $post ) :
						  setup_postdata( $post ); ?> 
							<li>
								<a href="<?php the_permalink();?>" class="no_underline no_hover article_link">
									<!--<?php the_date(); ?>-->
									<p><?php the_title(); ?></p>
									<p><?php the_excerpt(); ?></p>
								</a>
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
						<?php
						$tp_args = array( 'posts_per_page' => 10, 'order'=> 'ASC', 'orderby' => 'title', 'category' => 5, 'posts_per_page' => 5, 'offset'=> 0 );
						$postslist = get_posts( $tp_args );
						foreach ( $postslist as $post ) :
						  setup_postdata( $post ); ?> 
							<li>
								<a href="<?php the_permalink();?>" class="no_underline no_hover article_link">
									<!--<?php the_date(); ?>-->
									<p><?php the_title(); ?></p>
									<p><?php the_excerpt(); ?></p>
								</a>
							</li>
						<?php
						endforeach; 
						wp_reset_postdata();
						?>
						<li><a href="?cat=5">VOIR PLUS</a></li>
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
					<?php
						$tp_args = array( 'posts_per_page' => 10, 'order'=> 'ASC', 'orderby' => 'title', 'category' => 6, 'posts_per_page' => 5, 'offset'=> 0 );
						$postslist = get_posts( $tp_args );
						foreach ( $postslist as $post ) :
						  setup_postdata( $post ); ?> 
							<li>
								<a href="<?php the_permalink();?>" class="no_underline no_hover article_link">
									<!--<?php the_date(); ?>-->
									<p><?php the_title(); ?></p>
									<p><?php the_excerpt(); ?></p>
								</a>
							</li>
						<?php
						endforeach; 
						wp_reset_postdata();
						?>
						<li><a href="?cat=6">VOIR PLUS</a></li>
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
