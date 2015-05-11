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
<style> 
.main-box-title{
border-top: 2px solid #d93;
}
.main-box-title, .comment-reply-title, .main-box-head {
background: #fff;
color: #232323;
}
h1, h2, h3{
font-family: 'Roboto Slab';
font-weight: 400;
}
.main-box-title, .comment-reply-title {
font-size: 22px;
line-height: 25px;
text-align: center;
margin-bottom: 0;
padding: 15px 15px 18px 15px;
}


</style>
		<div id="container">
			<div id="content" role="main">
				<div id="main-box-1" class="main-box vce-border-top main-box-half" style="width:100%; height: 250px">
					<a href="" style=" text-decoration:none;"><h3 class="main-box-title cat-319">Actualité</h3></a>
				</div>
				<div style="width:100%; height: 360px;">
					<div id="main-box-2" class="main-box vce-border-top main-box-half" style="width:45%; height: 300px;float:left ">
						<a href="" style=" text-decoration:none;"><h3 class="main-box-title cat-319">T P</h3></a>
					</div>
					<div id="main-box-3" class="main-box vce-border-top main-box-half" style="width:45%; height: 300px;float:right">
						<a href="" style=" text-decoration:none;"><h3 class="main-box-title cat-319">Tuto</h3></a>
					</div>
				</div>
				<div id="main-box-4" class="main-box vce-border-top main-box-half" style="width:100%; height: 250px">
					<a href="" style=" text-decoration:none;"><h3 class="main-box-title cat-319">Média</h3></a>
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
