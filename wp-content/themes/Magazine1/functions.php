<?php
require_once(TEMPLATEPATH.'/options/options.php');
$cpanel = new ControlPanel();


add_theme_support('post-thumbnails');
set_post_thumbnail_size(90, 65, true); // Normal post thumbnails
add_image_size('featured', 525, 220, true); // Permalink thumbnail size
add_image_size('video', 100, 52, true); // Permalink thumbnail size
add_image_size('cat-headlines', 175, 70, true); // Permalink thumbnail size
add_image_size('photos', 50, 40, true); // Permalink thumbnail size


if ( function_exists('register_sidebar') )
	register_sidebar(array(
		'name' => 'Right Widgets Home',
		'before_widget' => '<div class="box-widget">',
	'after_widget' => '</div>',
	'before_title' => '<div class="header"><div class="title">',
	'after_title' => '</div></div>',
	));
	

if ( function_exists('register_sidebar'))
	register_sidebar(array(
		'name' => 'Right Widgets Post',
		'before_widget' => '<div class="box-widget">',
		'after_widget' => '</div>',
		'before_title' => '<div class="header"><div class="title">',
		'after_title' => '</div></div>',
	));
	

add_filter( 'post_thumbnail_html', 'my_post_image_html', 10, 3 );
	function my_post_image_html( $html, $post_id, $post_image_id ) {
		$html = '<a href="' . get_permalink( $post_id ) . '" title="' . esc_attr( get_post_field( 'post_title', $post_id ) ) . '">' . $html . '</a>';
		return $html;
	}
	
function ftr_fx($string){
	$string = str_replace('\\','',$string);
	echo $string;
}
	
function dummy_url(){
	bloginfo('template_url');
	echo('/images/bg_dummy.gif');
}	

function custom_title($before = '', $after = '', $echo = true, $length = false) {
	$title = get_the_title();
	if ( $length && is_numeric($length) ) {
		$title = substr( $title, 0, $length );
	}
	if ( strlen($title)> 0 ) {
		$title = apply_filters('custom_title', $before . $title . $after, $before, $after);
		if ( $echo ){
		echo $title;
		} else {
		return $title;
		}
	}
}



function custom_excerpt($before = '', $after = '', $echo = true, $length = false) {
	$excerpt = get_the_excerpt();
	if ( $length && is_numeric($length) ) {
		$excerpt = substr( $excerpt, 0, $length );
	}
	if ( strlen($excerpt)> 0 ) {
		$excerpt = apply_filters('custom_excerpt', $before . $excerpt . $after, $before, $after);
		if ( $echo )
		echo $excerpt;
		else
		return $excerpt;
	}
}















function get_tabs(){ ?>

    <div class="box" id="TABS">
        <ul id="TABS-buttons">
        
        <li id="tabsButton1" class="TABoff" onclick="setTabs(1);" >Popular</li>
        <li id="tabsButton2" class="TABoff" onclick="setTabs(2);" >Most commented</li>
            
        </ul><div class="clear"></div>
     
     
        <ul id="TABS-content">
        	
            
            
             			<?php
						
							$tabs = array("popular", "commented");
							$tabsCount = count($tabs);
							
    					    $tabPosts = new WP_Query();							
							
						for($t=0; $t<$tabsCount; $t++){?>
							
                            <li id="tabsContent<?php echo $t+1;?>"><ul>
							
                            
                            
  								<?php
								
								if($t==1){
									global $wpdb;
									$popular_posts = $wpdb->get_results("SELECT id,post_title FROM {$wpdb->prefix}posts WHERE post_status = 'publish' AND post_type = 'post' ORDER BY comment_count DESC LIMIT 0,5");
									
									foreach($popular_posts as $post) {
										print "<li><a href='". get_permalink($post->id) ."'>".$post->post_title."</a></li>";
									}
								} else {
								
                               		global $wpdb;
									$popular_posts = $wpdb->get_results("SELECT id,post_title FROM {$wpdb->prefix}posts WHERE post_status = 'publish' ORDER BY postCounter DESC LIMIT 0,5");
									
									foreach($popular_posts as $posti) {
										print "<li><a href='". get_permalink($posti->id) ."'>".$posti->post_title."</a></li>";
									}
							   
							   }?><!-- close loop --> 
                                
                                
                                
                                
                            </ul></li>
                        
                        <?php } ?>
                        
        </ul>
    </div>
    
    
    
    
<script type="javascript">
//<![CDATA[
function setupTabs() {
	for(i=1; i<3; i++){
		if(i==1){
			document.getElementById('tabsButton'+i).className = "TABon";
			document.getElementById('tabsContent'+i).style.display = "block";
		} else {
			document.getElementById('tabsButton'+i).className = "TABoff";
			document.getElementById('tabsContent'+i).style.display = "none";
		}
	}	
}
var currentTab=1;
var isAnimating=false;

function setTabs(TAB){
	if(isAnimating==false && currentTab!=TAB){
		isAnimating=true;
		for(i=1; i<3; i++){
			if(i==TAB){
				document.getElementById('tabsButton'+i).className = "TABon";
			} else {
				document.getElementById('tabsButton'+i).className = "TABoff";
			}
		}
		$("#tabsContent"+currentTab).fadeOut(100, function(){
			$("#tabsContent"+TAB).fadeIn(400, function(){
				isAnimating=false;
			});
		});
		currentTab=TAB;
		return false;
	}
}
//]]>
</script>
<?php }








function get_catHeadlines($categoriesID, $categoriesNAME){
	$secHeadline=0;
	$categoriesCount = count($categoriesID);
	?>

	<div id="cat-headlines">
    
    <?php
	for($c=0; $c<$categoriesCount; $c++){
		$isHead = 0;
		$prHead = 0;
			
		$category_link = get_category_link( $categoriesID[$c] );
	  
		$categoriesPosts = new WP_Query();
		$secPost = 0;
		$categoriesPosts->query('showposts=3&cat='.$categoriesID[$c]);
		
		while ($categoriesPosts->have_posts()) : $categoriesPosts->the_post(); 	
				
				if($isHead==0){ 
						$secHeadline++;
						
						if($secHeadline==2){
							$secHeadline=0;
							echo('<div class="cat-right">');
						} else {
							echo('<div class="cat-left">');
						} ?>
			
					<ul class="cat-content">
					
                    <li class="category-name"><a href="<?php echo $category_link; ?>"><?php echo($categoriesNAME[$c]); ?> &raquo;</a></li>
                    
					<?php 
					$prHead=1;
					$isHead=1;
				} 
				
				$secPost++;
				
				if($secPost==1){ ?>
					<li class="title"><a href="<?php the_permalink();?>" title="<?php the_title();?>"><?php custom_title('','',true,40);?></a></li>
					
						<li>
						<?php
						if ( has_post_thumbnail() ) {
						 the_post_thumbnail('cat-headlines');
						} else {
							// the current post lacks a thumbnail
						}
						?>
						</li>
				
					<li><div style="clear:both;"></div></li>
					<li class="border"></li>
				
				<?php } else { ?>
					<li class="title-other"><a href="<?php the_permalink();?>" title="<?php the_title();?>">&raquo; <?php custom_title('','',true,40);?></a></li>				
				<?php };
		
		endwhile; //close loop
			
		if($prHead==1){ 
			echo'</ul><br /></div>';
            $prHead=0;
        }
    }?>
    </div><div class="clear" ></div> 
	
<?php } 




function get_vid_thumb($src, $classname){
	$total_thumb = $src;
	preg_match('/src=("[^"]*")/i', $total_thumb, $total_thumb);
	$video_thumb = str_replace('src="','',$total_thumb[0]);
	$video_thumb = substr_replace($video_thumb ,"",-1);
	?>
	<div class="<?php echo($classname);?>" style="background:url(<?php echo($video_thumb); ?>)">
		<a href="<?php the_permalink(); ?>" title="<?php the_title();?>"><span class="<?php echo($classname);?>-over"></span></a>
	</div>
<?php }



function you_are_here() { 
	global $post;
	$full_path ='<div id="you-here"><a href="'.get_bloginfo('url').'">Home</a> > ';
	$cat = get_the_category(); 
	$cat = $cat[0];
	$catParents = get_category_parents($cat, TRUE, ' > ');
	$catParents = substr_replace($catParents ,"",-2);
	$full_path .= $catParents.'</div>';
	echo $full_path;
}



function get_sb(){?>
	<div class="social-bookmarks">
		<ul>
        	<li><a class="sb sb_delicious" href="http://del.icio.us/post?url=<?php the_permalink() ?>" target="_blank"></a></li>
 			<li><a class="sb sb_digg" href="http://digg.com/submit?url=<?php the_permalink() ?>" target="_blank"></a></li>
			<li><a class="sb sb_newsvine" href="http://www.newsvine.com/_tools/seed&amp;save?u=<?php the_permalink() ?>" target="_blank"></a></li>
			<li><a class="sb sb_stumbleupon" href="http://www.stumbleupon.com/submit?url=<?php the_permalink() ?>" target="_blank"></a></li>
			<li><a class="sb sb_facebook" href="http://www.facebook.com/sharer.php?u=<?php the_permalink();?>" target="_blank"></a></li>		
			<li><a class="sb sb_buzz" href="http://technorati.com/faves?add=<?php the_permalink();?>" target="_blank"></a></li>
		</ul>
		<div class="clear"></div>
	</div>
<?php } 







function get_tagCloud(){?>

    <div class="box" id="tags">        
        
    <?php $args = array(
    'smallest'  => 8, 
    'largest'   => 20,
    'unit'      => 'pt', 
    'number'    => 45,  
    'format'    => 'flat',
    'separator' => ' ',
    'orderby'   => 'name', 
    'order'     => 'ASC',
    'exclude'   => '', 
    'include'   => '', 
    'link'      => 'view', 
    'taxonomy'  => 'post_tag', 
    'echo'      => false );
    
    $tagsSrc = wp_tag_cloud($args); 
	$tagsSrc = str_replace('featured','', $tagsSrc );
	$tagsSrc = str_replace('Featured','', $tagsSrc );
	echo $tagsSrc;
	?>
    
    </div>

<?php } 










function m1cnt_install($post_id){
	
	global $wpdb;
		
	$exists = false;
	$query = "SELECT * FROM ".$wpdb->prefix."posts";	
	$tableFields = mysql_query ($query)
		or die ("Query failed");
	$numFields = mysql_num_fields($tableFields);
	for($i=0; $i<$numFields; $i++){
		if(mysql_field_name($tableFields, $i)=='postCounter'){
			$exists = true;
		} else {
			mysql_error();
		}
	}
	if(!$exists){
		$altersql = "ALTER TABLE ".$wpdb->prefix."posts ADD COLUMN postCounter INT(9) NOT NULL";
		$q = mysql_query($altersql);
	}
	$count_query = $wpdb->get_row("SELECT postCounter FROM {$wpdb->prefix}posts WHERE ID='$post_id'");
	$currCount = $count_query->postCounter+1;
	$count_query = $wpdb->get_results("UPDATE {$wpdb->prefix}posts SET postCounter='$currCount' WHERE ID='$post_id'");
}





function sgr_show_current_cat_on_single($output) {
 	global $post;
	if( is_single() ) {
		$categories = wp_get_post_categories($post->ID);

			foreach( $categories as $catid ) {

				$ancestors = preg_split("/[,]+/",get_category_parents($catid, false, ','));

				foreach ( $ancestors as $ancestor ){
					if ($ancestor !=""){
						$catID = get_cat_ID($ancestor);

						$category = get_category($catID);
						$catParentID = $category->category_parent;

						if(preg_match('#"cat-item cat-item-' . $catID . '"#', $output)) {
							if ($catParentID == 0){
								$output = str_replace('"cat-item cat-item-'.$catID.'"', '"cat-item cat-item-'.$catID . ' current-cat-parent"', $output);
							}else{
								$output = str_replace('"cat-item cat-item-'.$catID.'"', '"cat-item cat-item-'.$catID . ' current-cat"', $output);
							}
						}
					}
				}
			}
	}
	return $output;
}

add_filter('wp_list_categories', 'sgr_show_current_cat_on_single');


?>