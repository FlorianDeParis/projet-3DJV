<?php get_header();?>

<?php include('sidebar_left.php');?>

<div id="container">
	<?php if(have_posts()):?><?php while(have_posts()): the_post();?>
    
    
            <span class="postmetadata">
				<?php the_category(', ') ?><br />
			</span>
	
    <div class="post" id="post-<?php the_ID(); ?>">
    	<h3><a href="<?php the_permalink();?>" title="<?php the_title();?>"><?php the_title();?></a></h3>
        
		<div class="entry-cat">
		<?php
			if ( has_post_thumbnail() )
				the_post_thumbnail( 'cat-headlines' );
		?>
		</div>
		
        <div class="entry-cat-features">
				<?php _e('By'); ?> <?php the_author_posts_link(); ?> <br />
				<?php ob_start(); the_tags( '<span class="tag-links"><span class="entry-utility-prep entry-utility-prep-tag-links">' . __('Tagged: ', 'your-theme' ) . '</span>', ", ", "</span>\n\t\t\t\t\t\t<span class=\"meta-sep\"></span>\n" ); $postTags = ob_get_contents(); ob_end_clean(); ?>
				<?php if($postTags!=null){ echo($postTags).'<br />'; } ?>
				<?php comments_popup_link('No Comments', '1 Comment', '% Comments'); ?> <?php edit_post_link('Edit', ' &#124; ', ''); ?>
		</div>
			
			
        <div class="entry" style="width:95%;">
        	<span class="excerpt"><?php custom_excerpt('','...',true,180); ?></span>
			<div class="hr"></div>			
    	</div>
		
		<div class="clear"></div>
		
    </div>
        
        
    <?php endwhile;?>
    	<div class="navigation">
        	<?php posts_nav_link();?>
        </div>
		
		<br /><br />
    
    	<?php else: ?>
    	<div class="post">
        	<h3><?php _e('Not Found');?></h3>
        </div>
    
    <?php endif;?>
</div>





<?php get_sidebar();?>

<?php get_footer();?>