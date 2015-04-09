<?php get_header();?>

<?php $theme_options = get_option('Mag1'); ?>

<?php $pg_check = $_GET['m'];?>

<?php if($pg_check=='archive'){
	include(TEMPLATEPATH.'/archive_page.php');
} else if($pg_check=='contact'){
	include(TEMPLATEPATH.'/contact_page.php');
} else { ?>

<?php include('sidebar_left.php');?>

<div id="container">

	  
<!-- JS slider --> 
    
    <div id="DINAMIKA">
		<div id="slider-stripe">
			<ul id="slider-controller"><li></li></ul>
			<div class="clear"></div>
		</div>



<!-- slides -->
		<div id="slider">
    		<ul>
	
			<?php  
                $featuredPosts = new WP_Query();
                $featuredPosts->query('showposts='.$theme_options['featured_count'].'&tag=featured');             
                while ($featuredPosts->have_posts()) : $featuredPosts->the_post();
            ?>
        		<li>
    				<div class="post" id="post-<?php the_ID(); ?>">  
						<?php
                            if ( has_post_thumbnail() ) {
                            the_post_thumbnail('featured');
                
                            } else { ?>
                                <a href="<?php the_permalink(); ?>"><img src="<?php dummy_url();?>" width="525" height="220"  alt="<?php the_title();?>" /></a>
                            <?php } ?>
                        
                        
                        	<?php if($theme_options['featured_display_category']==1||$theme_options['featured_display_title']==1||$theme_options['featured_display_excerpt']==1){ ?>
                                <div class="title-layer">
                                <div class="cat-name">
                                    <?php
                                    if($theme_options['featured_display_category']==1){
                                        the_category(', ');
                                    }
                                    ?>
                                </div>
                                
                                    <?php if($theme_options['featured_display_title']==1){ ?>
                                        <h2 class="featured"><a href="<?php the_permalink();?>" title="<?php the_title();?>"><?php custom_title('','...',true,42); ?></a></h2>
                                    <?php } ?>
                                    
                                    <?php if($theme_options['featured_display_excerpt']==1){ ?>
                                        <div class="excerpt"><?php custom_excerpt('','...',true,77); ?></div>
                                    <?php } ?>
                                    
                                </div>
                            <?php } ?>	  
        			</div>
        		</li>
        		<?php endwhile; ?><!--/close loop-->
            </ul>
        </div>
	</div>




	<?php 
	/* kodi per me gjet ID'n e Tagut */
	$myTagNAME = "featured"; // <-- tagName
	$tagQuery = "
		SELECT term_id 
		FROM $wpdb->terms
		WHERE name='$myTagNAME'";
	$myTagID = $wpdb->get_var($tagQuery); //this variable now contains the given tag name's ID
	?>
    
    
    
    
	<?php
	/* funksioni per mos mi dyfishu postet */
	function post_strip($where) {
		global $myPosts, $wpdb;
		$where .= " AND $wpdb->posts.ID not in($myPosts) "; 
		return $where;
	}
	global $myPosts;
	$myPosts = '';
	?>






<!-- headlines -->
    
    <div id="headlines">
        <ul>
			<?php
            query_posts(array(tag__not_in=>array($myTagID)));
			$posti=0;
             if(have_posts()):?><?php while(have_posts()&&$posti<$theme_options['recent_home_count']): the_post();?>
             <?php $posti++;?>
            <?php $myPosts .= $post->ID . ","; ?>
            <li><a href="<?php the_permalink(); ?>"><?php custom_title('','',true, 40); ?></a></li>
            <?php endwhile;?>
            <?php wp_reset_query();?>
        </ul>
	<div style="clear:both;" ></div>
    </div>
   

   
<!-- advertisement1 -->
   
	<div class="adv" style=" width:100%; height: 75px; margin-top: 20px">
    <?php ftr_fx($theme_options['mag1_home_bann_center']);?>
    </div>
    
    
    
    
    
    
	<?php 
	$myPosts .= "0";
    add_filter('posts_where', 'post_strip');
	?>
    
    
    
    
<!-- cat-headlines -->

	<?php
	$catHeadID_array = array();
	$catHeadNAME_array = array();
	$catID = $theme_options['cat_headlines']['ID'];
	$catNAME = $theme_options['cat_headlines']['NM'];
	for($c=0; $c<count($catID); $c++) {
		if($theme_options['cat_headlines']['CB'][$catID[$c]]==1){
			array_push($catHeadID_array, $catID[$c]);
			array_push($catHeadNAME_array, $catNAME[$c]);
		}
	}

	get_catHeadlines($catHeadID_array, $catHeadNAME_array);
    ?>
   
	

	<?php 
	remove_filter('posts_where', 'post_strip');
    /* Qetu perfundojmi per qetu */ 
	?>

        
    <?php else: ?>
    <div class="post">
        <h2><?php _e('Not Found');?></h2>
    </div>
    
    <?php endif;?>
    </div>
    
    <?php get_sidebar();?>

<?php } ?>
    
    <?php get_footer();?>