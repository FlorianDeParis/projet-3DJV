<?php
    $post = $wp_query->post;
	$Cat = get_the_category();
	ob_start();
	echo(get_category_parents($Cat[0], FALSE, ':')); 
	$parents = ob_get_contents();
	ob_end_clean();
	
    if ( preg_match('/Video:/',$parents) || preg_match('/video:/',$parents)) {
    	include(TEMPLATEPATH . '/single_post2.php');
    } else {
    	include(TEMPLATEPATH . '/single_post.php');
    }
?>