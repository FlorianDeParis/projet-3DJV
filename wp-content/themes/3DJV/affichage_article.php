<?php

/*
  Template Name: affichage article
 */
global $wp_query;
//$args = array_merge( $wp_query->query_vars, array (
//            'post_type' => 'post',
//            'posts_per_page' => 10
//            ) );
//    query_posts( $args );
//	echo "<pre>";
//    print_r($wp_query);
//    echo "</pre>";
if (have_posts()):while (have_posts()) : the_post();
?>
<div class="post">

            <div class="box">
                <div class="postimgbox">
                    
                </div>
                <ul class="post_meta">
                    <li class="post_date">&nbsp;&nbsp;<?php echo get_the_time('m, d, Y') ?></li>
                    <li class="post_comment">
                        &nbsp;&nbsp;
                    <?php //comments_popup_link('No Comments.', '1 Comment.', '% Comments.'); ?></li>
                    <br />
                    <li class="posted_by">&nbsp;&nbsp;&nbsp;<?php _e('By', 'infoway'); ?>&nbsp;&nbsp;<?php the_author_posts_link(); ?></li>
                    <br />
                    <li class="post_category">&nbsp;&nbsp;&nbsp;<?php the_category(', '); ?></li>
                    <br />
                </ul>
            </div>
            <div class="post_content">
                <h1 class="post_title"><a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title_attribute(); ?>"><?php the_title(); ?></a></h1>

                <?php the_excerpt(); ?>
                <div class="clear"></div>
                <?php wp_link_pages(array('before' => '<div class="page-link"><span>' . __('Pages:', 'infoway') . '</span>', 'after' => '</div>')); ?>
                <a class="read_more" href="<?php the_permalink() ?>"><?php _e('Read More', 'infoway'); ?>&nbsp;<span class="button-tip"></span></a> 
            </div>
        </div>
        <!--End Post-->
    <?php
    break;
    endwhile;

endif; ?>
