<div class="sidebar">

    <!-- video box -->
    
    <?php 
	   $theme_options = get_option('Mag1');
	if ($theme_options["mag1_home_video"] == 1) {
	?>
    
        <div class="box" id="video-box">
            
            <div class="header">
            	<div class="title">Video</div>
                <div class="controls"><span id="videoprev"><a href="javascript:void(0);">&laquo;</a></span>&nbsp;&nbsp;<span id="videonext"><a href="javascript:void(0);">&raquo;</a></span></div>
            </div>

			<div id="video-slider">
			<ul class="content">
            
				<li>
                
                	<table cellpadding="0" cellspacing="0" border="0">
             			<tr>
             
                     
    					<?php  
    					    $videoPosts = new WP_Query();
							$secPost = 0;
    					    $videoPosts->query('showposts=10&category_name=video');
    					    while ($videoPosts->have_posts()) : $videoPosts->the_post();
    					?>
	
    					<?php $secPost++; ?>
				
       
						<?php if($secPost==3){
                            $secPost=0;
                            echo ('</tr></table></li><li><table cellpadding="0" cellspacing="0" border="0"><tr>');
                        } ?>
                        
                        
						 <?php  if($secPost==0 || $secPost==1) {
                            $secPost=1;            	
                            echo '<td class="left">';
                         } else {
                            echo '<td class="right">'; 
                         } ?>
                        
						<?php
						ob_start();
							if ( has_post_thumbnail() ) {
 								the_post_thumbnail('video');
							} else { ?>
                                <a href="<?php the_permalink(); ?>" title="<?php the_title();?>"><img src="<?php dummy_url();?>" width="100" height="52" alt="<?php the_title();?>" /></a>
						<?php }
						$total_thumb = ob_get_contents();
						ob_end_clean();
						
						get_vid_thumb($total_thumb, 'video-thumb');
						?>
							
            			<p><a href="<?php the_permalink();?>" title="<?php the_title();?>"><?php custom_title('','',true,19);?></a></p>
                            
                        </td>
            				

        				<?php endwhile; ?><!--/close loop-->
					                      
    		
        			
                        </tr>
                    </table>
               </li> 
	        </ul>
        </div>

    </div>
        
    <?php } ?>
            
           
            
            
          
            
<!-- most popular articles box --> 
            
        <?php 
        if ($theme_options["mag1_home_tabs"] == 1) {
        	get_tabs();
		}
		?> 
          
          
            
        
        
<!-- tags box -->          
	
    <?php 
    if ($theme_options["mag1_home_tags"] == 1) {
    get_tagCloud();
	} ?>

            
            
         <?php if ( function_exists('dynamic_sidebar') && dynamic_sidebar('Right Widgets Home') ) : else : ?><?php endif;?>
        
    
    
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
