<?php get_header();?>

<?php $theme_options = get_option('Mag1'); ?>

<?php include('sidebar_left.php');?>

<div id="container">
	<?php if(have_posts()):?><?php while(have_posts()): the_post();?>
    
    
    
    <?php 
	ob_start();
		the_ID();
		$post_id = ob_get_contents();
	ob_end_clean();
	m1cnt_install($post_id);
	?>
    
    
    
    <div class="post" id="post-<?php the_ID(); ?>">
	
	<?php you_are_here();?>
	
    	<h2><?php the_title();?></h2>
		
		<div class="hr"></div>
		
            <p class="postmetadata">
				<?php _e('By'); ?> <?php the_author_posts_link(); ?><?php edit_post_link('Edit', ' &#124; ', ''); ?><br />
				Published: <?php the_date(); ?>
			</p>
			<br />
			
            <?php
				if ( has_post_thumbnail() )
 				the_post_thumbnail('featured' );
			?>
        
        <div class="entry">
        	<?php the_content();?>
            <?php link_pages('<p><strong>Pages:</strong>','</p>','number');?>
    	</div>
		
        <div class="entry-features">
		
		    <div id="related" style="display:none">
				<div class="title">Related posts</div>
				<div class="content" id="box-related"></div>
   			</div>

				
    	</div>
		<div class="clear"></div>
		
		<br /><br />
		
        <?php 
				
		$relCnt = 0;
		
		$tags = wp_get_post_tags($post->ID);
		if ($tags) {
		  $first_tag = $tags[0]->term_id;
		  $args=array(
			'tag__in' => array($first_tag),
			'post__not_in' => array($post->ID),
			'showposts'=>5,
			'caller_get_posts'=>1
		   );
		  $my_query = new WP_Query($args);
		  if( $my_query->have_posts() ) {
			while ($my_query->have_posts()) : $my_query->the_post(); ?>
            	
                <?php $relCnt++;?>

				<input type="hidden" id="relPer<?php echo $relCnt;?>" value="<?php the_permalink(); ?>" />
                <input type="hidden" id="relTit<?php echo $relCnt;?>" value="<?php the_title(); ?>" />
				
			  <?php
			endwhile;
			wp_reset_query();?>
			
            <?php 
		  }
		  ?>
		  <input type="hidden" id="relTotal" value="<?php echo $relCnt; ?>" />
		  <?php
		}
		
		?>
        
        
        
        
<!-- social bookmarks links -->
		<?php get_sb(); ?>
        
        
        
        <div class="comments-template"><br />
        	<?php comments_template();?>
        </div>
        
    </div>
        
        
        
    <?php endwhile;?>
    
    	<div class="navigation2">
        	<a href="#header">_Back to top</a>
        </div>
    
    	<?php else: ?>
    	<div class="post">
        	<h2><?php _e('Not Found');?></h2>
        </div>
    
    <?php endif;?>
</div>





<?php include('sidebar_post.php');?>


<?php get_footer();?>