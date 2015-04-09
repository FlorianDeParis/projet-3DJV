<div class="sidebar">
<?php $theme_options = get_option('Mag1');?>

      
    <!-- Latest articles -->
        
        
    <?php if($theme_options['mag1_post_latest']){?>
		<div class="box">
            <div class="header"><div class="title">Latest entries</div></div>
            <ul class="recent">                
                <?php wp_get_archives('title_li=&type=postbypost&limit=3'); ?>
            </ul>
		</div>
	<?php } ?>


            
<!-- most popular articles box --> 
            
	<?php 
	if($theme_options['mag1_post_tabs']){
	get_tabs();
	}
	?>
            
        
        
        
        
        
<!-- tags box -->          
  
    <?php
	if($theme_options['mag1_post_tags']){
	get_tagCloud();
	}
	?>
            
            
            
            
            
            
            
         <?php if ( function_exists('dynamic_sidebar') && dynamic_sidebar('Right Widgets Post') ) : else : ?><?php endif;?>
        
                
            
    
    	
		<ul>
		
			<li><h2>Archives</h2>
				<ul>
				<?php wp_get_archives('type=monthly'); ?>
				</ul>
			</li>

		</ul>
		<ul>
				<?php wp_list_bookmarks(); ?>

				<li><h2>Meta</h2>
				<ul>
					<?php wp_register(); ?>
					<li><?php wp_loginout(); ?></li>
					<li><a href="http://validator.w3.org/check/referer" title="This page validates as XHTML 1.0 Transitional">Valid <abbr title="eXtensible HyperText Markup Language">XHTML</abbr></a></li>
					<li><a href="http://wordpress.org/" title="Powered by WordPress, state-of-the-art semantic personal publishing platform.">WordPress</a></li>
					<?php wp_meta(); ?>
				</ul>
				</li>

		</ul>
        <br />
   

</div>
