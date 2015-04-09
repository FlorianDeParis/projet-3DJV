<div class="sidebar_left">

<div class="menu">

    <ul id="menu">
        <li <?php if ( is_home() ) { echo ' class="current"'; } ?>><a href="<?php blogInfo('url'); ?>">Home</a></li>
           
        <?php wp_list_cats('orderby=id&optioncount=0&depth=3&exclude=1,'.get_cat_id('Video').','.get_cat_id('photos'));?>
    </ul>
    
    <ul class="pages">
    	<?php 
		$args = array(
			'exclude'      => 2,
			'title_li'     => __(''),
			'echo'         => 1,
			'sort_column'  => 'menu_order, post_title',
			);
		wp_list_pages($args);
		?>
        
        <?php
        wp_list_cats("include=".get_cat_id('video'));
        wp_list_cats("include=".get_cat_id('photos'));
        ?>
        <li <?php if($pg_check=='archive'){echo ' class="cat-item current-cat"';} ?>><a href="<?php blogInfo('url');?>/?m=archive">Archive</a></li>
    </ul>
	
</div>

    <br /><br />

	<div class="adv-sidebar-left">
    	<span>Advertisement</span>
        <?php ftr_fx($theme_options['mag1_home_bann_left']); ?>
    </div>
	
    <br /><br />

</div>