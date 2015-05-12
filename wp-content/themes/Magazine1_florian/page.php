<?php get_header();?>

<?php include('sidebar_left.php');?>

<div id="container">
	<?php if(have_posts()):?><?php while(have_posts()): the_post();?>
    
    
    <div class="post" id="post-<?php the_ID(); ?>">
    	<h2><?php the_title();?></h2>
        
        <div class="entry">
        
        	<?php the_content();?>
            <?php link_pages('<p><strong>Pages:</strong>','</p>','number');?>
            <?php edit_post_link('Edit','<p>','</p>');?>
            
    	</div>
    </div>
        
        
    <?php endwhile;?>

    
    	<?php else: ?>
    	<div class="post">
        	<h2><?php _e('Not Found');?></h2>
        </div>
    
    <?php endif;?>
</div>





<?php include('sidebar_post.php');?>

<?php get_footer();?>