<?php get_header();?>

<?php include('sidebar_left.php');?>

<div id="container">

    
	<div class="archive">
	
		<?php
		$posts_to_show = 100; //Max number of articles to display
		$debut = 0; //The first article to be displayed
		?>
		
		
		<ul>
		<?php
		$myposts = get_posts('showposts='.$posts_to_show.'&offset='.$debut);
		foreach($myposts as $post) :
		?>
		<li><?php the_time('d/m/y') ?>: <a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></li>
		
		<?php endforeach; ?>
		</ul>

		<br />
		<h3>Categories</h3><br />
		<ul><?php wp_list_cats('sort_column=name&optioncount=1') ?></ul>
		
		<br />
		<h3>Monthly Archives</h3><br />
		<ul><?php wp_get_archives('type=monthly&show_post_count=1') ?></ul>
		

	</div>			
</div>



<?php include('sidebar_post.php');?>

<?php get_footer();?>