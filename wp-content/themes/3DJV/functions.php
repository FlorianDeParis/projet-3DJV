<?php
/**
 * TwentyTen functions and definitions
 *
 * Sets up the theme and provides some helper functions. Some helper functions
 * are used in the theme as custom template tags. Others are attached to action and
 * filter hooks in WordPress to change core functionality.
 *
 * The first function, twentyten_setup(), sets up the theme by registering support
 * for various features in WordPress, such as post thumbnails, navigation menus, and the like.
 *
 * When using a child theme (see https://codex.wordpress.org/Theme_Development and
 * https://codex.wordpress.org/Child_Themes), you can override certain functions
 * (those wrapped in a function_exists() call) by defining them first in your child theme's
 * functions.php file. The child theme's functions.php file is included before the parent
 * theme's file, so the child theme functions would be used.
 *
 * Functions that are not pluggable (not wrapped in function_exists()) are instead attached
 * to a filter or action hook. The hook can be removed by using remove_action() or
 * remove_filter() and you can attach your own function to the hook.
 *
 * We can remove the parent theme's hook only after it is attached, which means we need to
 * wait until setting up the child theme:
 *
 * <code>
 * add_action( 'after_setup_theme', 'my_child_theme_setup' );
 * function my_child_theme_setup() {
 *     // We are providing our own filter for excerpt_length (or using the unfiltered value)
 *     remove_filter( 'excerpt_length', 'twentyten_excerpt_length' );
 *     ...
 * }
 * </code>
 *
 * For more information on hooks, actions, and filters, see https://codex.wordpress.org/Plugin_API.
 *
 * @package WordPress
 * @subpackage Twenty_Ten
 * @since Twenty Ten 1.0
 */
/*
 * Set the content width based on the theme's design and stylesheet.
 *
 * Used to set the width of images and content. Should be equal to the width the theme
 * is designed for, generally via the style.css stylesheet.
 */
 
 
@ini_set( 'upload_max_size' , '250M' ); 
@ini_set( 'post_max_size', '250M'); 
@ini_set( 'max_execution_time', '300' );
 
if ( ! isset( $content_width ) )
	$content_width = 640;
/* Tell WordPress to run twentyten_setup() when the 'after_setup_theme' hook is run. */
add_action( 'after_setup_theme', 'twentyten_setup' );
if ( ! function_exists( 'twentyten_setup' ) ):
/**
 * Set up theme defaults and registers support for various WordPress features.
 *
 * Note that this function is hooked into the after_setup_theme hook, which runs
 * before the init hook. The init hook is too late for some features, such as indicating
 * support post thumbnails.
 *
 * To override twentyten_setup() in a child theme, add your own twentyten_setup to your child theme's
 * functions.php file.
 *
 * @uses add_theme_support()        To add support for post thumbnails, custom headers and backgrounds, and automatic feed links.
 * @uses register_nav_menus()       To add support for navigation menus.
 * @uses add_editor_style()         To style the visual editor.
 * @uses load_theme_textdomain()    For translation/localization support.
 * @uses register_default_headers() To register the default custom header images provided with the theme.
 * @uses set_post_thumbnail_size()  To set a custom post thumbnail size.
 *
 * @since Twenty Ten 1.0
 */
function twentyten_setup() {
	// This theme styles the visual editor with editor-style.css to match the theme style.
	add_editor_style();
	// Post Format support. You can also use the legacy "gallery" or "asides" (note the plural) categories.
	add_theme_support( 'post-formats', array( 'aside', 'gallery' ) );
	// This theme uses post thumbnails
	add_theme_support( 'post-thumbnails' );
	// Add default posts and comments RSS feed links to head
	add_theme_support( 'automatic-feed-links' );
	/*
	 * Make theme available for translation.
	 * Translations can be filed in the /languages/ directory
	 */
	load_theme_textdomain( 'twentyten', get_template_directory() . '/languages' );
	// This theme uses wp_nav_menu() in one location.
	register_nav_menus( array(
		'primary' => __( 'Primary Navigation', 'twentyten' ),
	) );
	// This theme allows users to set a custom background.
	add_theme_support( 'custom-background', array(
		// Let WordPress know what our default background color is.
		'default-color' => 'f1f1f1',
	) );
	// The custom header business starts here.
	$custom_header_support = array(
		/*
		 * The default image to use.
		 * The %s is a placeholder for the theme template directory URI.
		 */
		'default-image' => '%s/images/headers/path.jpg',
		// The height and width of our custom header.
		/**
		 * Filter the Twenty Ten default header image width.
		 *
		 * @since Twenty Ten 1.0
		 *
		 * @param int The default header image width in pixels. Default 940.
		 */
		'width' => apply_filters( 'twentyten_header_image_width', 940 ),
		/**
		 * Filter the Twenty Ten defaul header image height.
		 *
		 * @since Twenty Ten 1.0
		 *
		 * @param int The default header image height in pixels. Default 198.
		 */
		'height' => apply_filters( 'twentyten_header_image_height', 198 ),
		// Support flexible heights.
		'flex-height' => true,
		// Don't support text inside the header image.
		'header-text' => false,
		// Callback for styling the header preview in the admin.
		'admin-head-callback' => 'twentyten_admin_header_style',
	);
	add_theme_support( 'custom-header', $custom_header_support );
	if ( ! function_exists( 'get_custom_header' ) ) {
		// This is all for compatibility with versions of WordPress prior to 3.4.
		define( 'HEADER_TEXTCOLOR', '' );
		define( 'NO_HEADER_TEXT', true );
		define( 'HEADER_IMAGE', $custom_header_support['default-image'] );
		define( 'HEADER_IMAGE_WIDTH', $custom_header_support['width'] );
		define( 'HEADER_IMAGE_HEIGHT', $custom_header_support['height'] );
		add_custom_image_header( '', $custom_header_support['admin-head-callback'] );
		add_custom_background();
	}
	/*
	 * We'll be using post thumbnails for custom header images on posts and pages.
	 * We want them to be 940 pixels wide by 198 pixels tall.
	 * Larger images will be auto-cropped to fit, smaller ones will be ignored. See header.php.
	 */
	set_post_thumbnail_size( $custom_header_support['width'], $custom_header_support['height'], true );
	// ... and thus ends the custom header business.
	// Default custom headers packaged with the theme. %s is a placeholder for the theme template directory URI.
	register_default_headers( array(
		'berries' => array(
			'url' => '%s/images/headers/berries.jpg',
			'thumbnail_url' => '%s/images/headers/berries-thumbnail.jpg',
			/* translators: header image description */
			'description' => __( 'Berries', 'twentyten' )
		),
		'cherryblossom' => array(
			'url' => '%s/images/headers/cherryblossoms.jpg',
			'thumbnail_url' => '%s/images/headers/cherryblossoms-thumbnail.jpg',
			/* translators: header image description */
			'description' => __( 'Cherry Blossoms', 'twentyten' )
		),
		'concave' => array(
			'url' => '%s/images/headers/concave.jpg',
			'thumbnail_url' => '%s/images/headers/concave-thumbnail.jpg',
			/* translators: header image description */
			'description' => __( 'Concave', 'twentyten' )
		),
		'fern' => array(
			'url' => '%s/images/headers/fern.jpg',
			'thumbnail_url' => '%s/images/headers/fern-thumbnail.jpg',
			/* translators: header image description */
			'description' => __( 'Fern', 'twentyten' )
		),
		'forestfloor' => array(
			'url' => '%s/images/headers/forestfloor.jpg',
			'thumbnail_url' => '%s/images/headers/forestfloor-thumbnail.jpg',
			/* translators: header image description */
			'description' => __( 'Forest Floor', 'twentyten' )
		),
		'inkwell' => array(
			'url' => '%s/images/headers/inkwell.jpg',
			'thumbnail_url' => '%s/images/headers/inkwell-thumbnail.jpg',
			/* translators: header image description */
			'description' => __( 'Inkwell', 'twentyten' )
		),
		'path' => array(
			'url' => '%s/images/headers/path.jpg',
			'thumbnail_url' => '%s/images/headers/path-thumbnail.jpg',
			/* translators: header image description */
			'description' => __( 'Path', 'twentyten' )
		),
		'sunset' => array(
			'url' => '%s/images/headers/sunset.jpg',
			'thumbnail_url' => '%s/images/headers/sunset-thumbnail.jpg',
			/* translators: header image description */
			'description' => __( 'Sunset', 'twentyten' )
		)
	) );
}
endif;
if ( ! function_exists( 'twentyten_admin_header_style' ) ) :
/**
 * Style the header image displayed on the Appearance > Header admin panel.
 *
 * Referenced via add_custom_image_header() in twentyten_setup().
 *
 * @since Twenty Ten 1.0
 */
function twentyten_admin_header_style() {
?>
<style type="text/css" id="twentyten-admin-header-css">
/* Shows the same border as on front end */
#headimg {
	border-bottom: 1px solid #000;
	border-top: 4px solid #000;
}
/* If header-text was supported, you would style the text with these selectors:
	#headimg #name { }
	#headimg #desc { }
*/
</style>
<?php
}
endif;
/**
 * Show a home link for our wp_nav_menu() fallback, wp_page_menu().
 *
 * To override this in a child theme, remove the filter and optionally add
 * your own function tied to the wp_page_menu_args filter hook.
 *
 * @since Twenty Ten 1.0
 *
 * @param array $args An optional array of arguments. @see wp_page_menu()
 */
function twentyten_page_menu_args( $args ) {
	if ( ! isset( $args['show_home'] ) )
		$args['show_home'] = true;
	return $args;
}
add_filter( 'wp_page_menu_args', 'twentyten_page_menu_args' );
/**
 * Set the post excerpt length to 40 characters.
 *
 * To override this length in a child theme, remove the filter and add your own
 * function tied to the excerpt_length filter hook.
 *
 * @since Twenty Ten 1.0
 *
 * @param int $length The number of excerpt characters.
 * @return int The filtered number of excerpt characters.
 */
 
 
 
 
 
 
 
function twentyten_excerpt_length( $length ) {
	return 40;
}
add_filter( 'excerpt_length', 'twentyten_excerpt_length' );
if ( ! function_exists( 'twentyten_continue_reading_link' ) ) :
/**
 * Return a "Continue Reading" link for excerpts.
 *
 * @since Twenty Ten 1.0
 *
 * @return string "Continue Reading" link.
 */
function twentyten_continue_reading_link() {
	return ' <a href="'. get_permalink() . '">' . __( 'Continue reading <span class="meta-nav">&rarr;</span>', 'twentyten' ) . '</a>';
}
endif;
/**
 * Replace "[...]" with an ellipsis and twentyten_continue_reading_link().
 *
 * "[...]" is appended to automatically generated excerpts.
 *
 * To override this in a child theme, remove the filter and add your own
 * function tied to the excerpt_more filter hook.
 *
 * @since Twenty Ten 1.0
 *
 * @param string $more The Read More text.
 * @return string An ellipsis.
 */
function twentyten_auto_excerpt_more( $more ) {
	if ( ! is_admin() ) {
		return ' &hellip;' . twentyten_continue_reading_link();
	}
	return $more;
}
add_filter( 'excerpt_more', 'twentyten_auto_excerpt_more' );
/**
 * Add a pretty "Continue Reading" link to custom post excerpts.
 *
 * To override this link in a child theme, remove the filter and add your own
 * function tied to the get_the_excerpt filter hook.
 *
 * @since Twenty Ten 1.0
 *
 * @param string $output The "Coninue Reading" link.
 * @return string Excerpt with a pretty "Continue Reading" link.
 */
function twentyten_custom_excerpt_more( $output ) {
	if ( has_excerpt() && ! is_attachment() && ! is_admin() ) {
		$output .= twentyten_continue_reading_link();
	}
	return $output;
}
add_filter( 'get_the_excerpt', 'twentyten_custom_excerpt_more' );
/**
 * Remove inline styles printed when the gallery shortcode is used.
 *
 * Galleries are styled by the theme in Twenty Ten's style.css. This is just
 * a simple filter call that tells WordPress to not use the default styles.
 *
 * @since Twenty Ten 1.2
 */
add_filter( 'use_default_gallery_style', '__return_false' );
 if(!function_exists( 'add_login_logout_menu')) 
{
    function add_login_logout_menu($items, $args)
    {
        if(is_admin() || $args->theme_location != 'primary') return $items; 
        if( is_user_logged_in( ) )
            $link = '<a href="' . wp_logout_url('/projet-3DJV/') . '" title="Logout">' . __( 'Se deconnecter' ) . '</a>';
        else  
            $link = '<a href="' . '/projet-3DJV/?page_id=87' . '" title="Login">' . __( 'Se connecter' ) . '</a>';
        return $items .= '<li id="login_logout_menu-link" class="menu-item menu-type-link">'. $link . '</li>';
    }
}
add_filter( 'wp_nav_menu_items', 'add_login_logout_menu', 20, 5);
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
function redirect_login_page() {
    $login_page  = home_url( '?page_id=87/' );
    $page_viewed = basename($_SERVER['REQUEST_URI']);
 
    if( $page_viewed == "wp-login.php" && $_SERVER['REQUEST_METHOD'] == 'GET') {
        wp_redirect($login_page);
        exit;
    }
}
add_action('init','redirect_login_page');
function login_failed() {
    $login_page  = home_url( '?page_id=87/' );
    wp_redirect( $login_page . '?login=failed' );
    exit;
}
add_action( 'wp_login_failed', 'login_failed' );
 
function verify_username_password( $user, $username, $password ) {
    $login_page  = home_url( '?page_id=87/' );
    if( $username == "" || $password == "" ) {
        wp_redirect( $login_page . "?login=empty" );
        exit;
    }
}
add_filter( 'authenticate', 'verify_username_password', 1, 3);
function logout_page() {
    $login_page  = home_url( '' );
    wp_redirect( $login_page . "?login=false" );
    exit;
}
add_action('wp_logout','logout_page');
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
/**
 * Deprecated way to remove inline styles printed when the gallery shortcode is used.
 *
 * This function is no longer needed or used. Use the use_default_gallery_style
 * filter instead, as seen above.
 *
 * @since Twenty Ten 1.0
 * @deprecated Deprecated in Twenty Ten 1.2 for WordPress 3.1
 *
 * @return string The gallery style filter, with the styles themselves removed.
 */
function twentyten_remove_gallery_css( $css ) {
	return preg_replace( "#<style type='text/css'>(.*?)</style>#s", '', $css );
}
// Backwards compatibility with WordPress 3.0.
if ( version_compare( $GLOBALS['wp_version'], '3.1', '<' ) )
	add_filter( 'gallery_style', 'twentyten_remove_gallery_css' );
if ( ! function_exists( 'twentyten_comment' ) ) :
/**
 * Template for comments and pingbacks.
 *
 * To override this walker in a child theme without modifying the comments template
 * simply create your own twentyten_comment(), and that function will be used instead.
 *
 * Used as a callback by wp_list_comments() for displaying the comments.
 *
 * @since Twenty Ten 1.0
 *
 * @param object $comment The comment object.
 * @param array  $args    An array of arguments. @see get_comment_reply_link()
 * @param int    $depth   The depth of the comment.
 */
function twentyten_comment( $comment, $args, $depth ) {
	$GLOBALS['comment'] = $comment;
	switch ( $comment->comment_type ) :
		case '' :
	?>
	<li <?php comment_class(); ?> id="li-comment-<?php comment_ID(); ?>">
		<div id="comment-<?php comment_ID(); ?>">
			<div class="comment-author vcard">
				<?php echo get_avatar( $comment, 40 ); ?>
				<?php printf( __( '%s <span class="says">says:</span>', 'twentyten' ), sprintf( '<cite class="fn">%s</cite>', get_comment_author_link() ) ); ?>
			</div><!-- .comment-author .vcard -->
			<?php if ( $comment->comment_approved == '0' ) : ?>
				<em class="comment-awaiting-moderation"><?php _e( 'Your comment is awaiting moderation.', 'twentyten' ); ?></em>
				<br />
			<?php endif; ?>

			<div class="comment-meta commentmetadata"><a href="<?php echo esc_url( get_comment_link( $comment->comment_ID ) ); ?>">
				<?php
					/* translators: 1: date, 2: time */
					printf( __( '%1$s at %2$s', 'twentyten' ), get_comment_date(),  get_comment_time() ); ?></a><?php edit_comment_link( __( '(Edit)', 'twentyten' ), ' ' );
				?>
			</div><!-- .comment-meta .commentmetadata -->

			<div class="comment-body"><?php comment_text(); ?></div>

			<div class="reply">
				<?php comment_reply_link( array_merge( $args, array( 'depth' => $depth, 'max_depth' => $args['max_depth'] ) ) ); ?>
			</div><!-- .reply -->
		</div><!-- #comment-##  -->

	<?php
			break;
		case 'pingback'  :
		case 'trackback' :
	?>
	<li class="post pingback">
		<p><?php _e( 'Pingback:', 'twentyten' ); ?> <?php comment_author_link(); ?><?php edit_comment_link( __( '(Edit)', 'twentyten' ), ' ' ); ?></p>
	<?php
			break;
	endswitch;
}
endif;
/**
 * Register widgetized areas, including two sidebars and four widget-ready columns in the footer.
 *
 * To override twentyten_widgets_init() in a child theme, remove the action hook and add your own
 * function tied to the init hook.
 *
 * @since Twenty Ten 1.0
 *
 * @uses register_sidebar()
 */
 
 
function twentyten_widgets_init() {
	// Area 1, located at the top of the sidebar.
	register_sidebar( array(
		'name' => __( 'Primary Widget Area', 'twentyten' ),
		'id' => 'primary-widget-area',
		'description' => __( 'Add widgets here to appear in your sidebar.', 'twentyten' ),
		'before_widget' => '<li id="%1$s" class="widget-container %2$s">',
		'after_widget' => '</li>',
		'before_title' => '<h3 class="widget-title">',
		'after_title' => '</h3>',
	) );
	// Area 2, located below the Primary Widget Area in the sidebar. Empty by default.
	register_sidebar( array(
		'name' => __( 'Secondary Widget Area', 'twentyten' ),
		'id' => 'secondary-widget-area',
		'description' => __( 'An optional secondary widget area, displays below the primary widget area in your sidebar.', 'twentyten' ),
		'before_widget' => '<li id="%1$s" class="widget-container %2$s">',
		'after_widget' => '</li>',
		'before_title' => '<h3 class="widget-title">',
		'after_title' => '</h3>',
	) );
	// Area 3, located in the footer. Empty by default.
	register_sidebar( array(
		'name' => __( 'First Footer Widget Area', 'twentyten' ),
		'id' => 'first-footer-widget-area',
		'description' => __( 'An optional widget area for your site footer.', 'twentyten' ),
		'before_widget' => '<li id="%1$s" class="widget-container %2$s">',
		'after_widget' => '</li>',
		'before_title' => '<h3 class="widget-title">',
		'after_title' => '</h3>',
	) );
	// Area 4, located in the footer. Empty by default.
	register_sidebar( array(
		'name' => __( 'Second Footer Widget Area', 'twentyten' ),
		'id' => 'second-footer-widget-area',
		'description' => __( 'An optional widget area for your site footer.', 'twentyten' ),
		'before_widget' => '<li id="%1$s" class="widget-container %2$s">',
		'after_widget' => '</li>',
		'before_title' => '<h3 class="widget-title">',
		'after_title' => '</h3>',
	) );
	// Area 5, located in the footer. Empty by default.
	register_sidebar( array(
		'name' => __( 'Third Footer Widget Area', 'twentyten' ),
		'id' => 'third-footer-widget-area',
		'description' => __( 'An optional widget area for your site footer.', 'twentyten' ),
		'before_widget' => '<li id="%1$s" class="widget-container %2$s">',
		'after_widget' => '</li>',
		'before_title' => '<h3 class="widget-title">',
		'after_title' => '</h3>',
	) );
	// Area 6, located in the footer. Empty by default.
	register_sidebar( array(
		'name' => __( 'Fourth Footer Widget Area', 'twentyten' ),
		'id' => 'fourth-footer-widget-area',
		'description' => __( 'An optional widget area for your site footer.', 'twentyten' ),
		'before_widget' => '<li id="%1$s" class="widget-container %2$s">',
		'after_widget' => '</li>',
		'before_title' => '<h3 class="widget-title">',
		'after_title' => '</h3>',
	) );
}
/** Register sidebars by running twentyten_widgets_init() on the widgets_init hook. */
add_action( 'widgets_init', 'twentyten_widgets_init' );
/**
 * Remove the default styles that are packaged with the Recent Comments widget.
 *
 * To override this in a child theme, remove the filter and optionally add your own
 * function tied to the widgets_init action hook.
 *
 * This function uses a filter (show_recent_comments_widget_style) new in WordPress 3.1
 * to remove the default style. Using Twenty Ten 1.2 in WordPress 3.0 will show the styles,
 * but they won't have any effect on the widget in default Twenty Ten styling.
 *
 * @since Twenty Ten 1.0
 */
function twentyten_remove_recent_comments_style() {
	add_filter( 'show_recent_comments_widget_style', '__return_false' );
}
add_action( 'widgets_init', 'twentyten_remove_recent_comments_style' );
if ( ! function_exists( 'twentyten_posted_on' ) ) :
/**
 * Print HTML with meta information for the current post-date/time and author.
 *
 * @since Twenty Ten 1.0
 */
function twentyten_posted_on() {
	printf( __( '<span class="%1$s">Posted on</span> %2$s <span class="meta-sep">by</span> %3$s', 'twentyten' ),
		'meta-prep meta-prep-author',
		sprintf( '<a href="%1$s" title="%2$s" rel="bookmark"><span class="entry-date">%3$s</span></a>',
			get_permalink(),
			esc_attr( get_the_time() ),
			get_the_date()
		),
		sprintf( '<span class="author vcard"><a class="url fn n" href="%1$s" title="%2$s">%3$s</a></span>',
			get_author_posts_url( get_the_author_meta( 'ID' ) ),
			esc_attr( sprintf( __( 'View all posts by %s', 'twentyten' ), get_the_author() ) ),
			get_the_author()
		)
	);
}
endif;
if ( ! function_exists( 'twentyten_posted_in' ) ) :
/**
 * Print HTML with meta information for the current post (category, tags and permalink).
 *
 * @since Twenty Ten 1.0
 */
function twentyten_posted_in() {
	// Retrieves tag list of current post, separated by commas.
	$tag_list = get_the_tag_list( '', ', ' );
	if ( $tag_list ) {
		$posted_in = __( 'This entry was posted in %1$s and tagged %2$s. Bookmark the <a href="%3$s" title="Permalink to %4$s" rel="bookmark">permalink</a>.', 'twentyten' );
	} elseif ( is_object_in_taxonomy( get_post_type(), 'category' ) ) {
		$posted_in = __( 'This entry was posted in %1$s. Bookmark the <a href="%3$s" title="Permalink to %4$s" rel="bookmark">permalink</a>.', 'twentyten' );
	} else {
		$posted_in = __( 'Bookmark the <a href="%3$s" title="Permalink to %4$s" rel="bookmark">permalink</a>.', 'twentyten' );
	}
	// Prints the string, replacing the placeholders.
	printf(
		$posted_in,
		get_the_category_list( ', ' ),
		$tag_list,
		get_permalink(),
		the_title_attribute( 'echo=0' )
	);
}
endif;
/**
 * Retrieve the IDs for images in a gallery.
 *
 * @uses get_post_galleries() First, if available. Falls back to shortcode parsing,
 *                            then as last option uses a get_posts() call.
 *
 * @since Twenty Ten 1.6.
 *
 * @return array List of image IDs from the post gallery.
 */
function twentyten_get_gallery_images() {
	$images = array();
	if ( function_exists( 'get_post_galleries' ) ) {
		$galleries = get_post_galleries( get_the_ID(), false );
		if ( isset( $galleries[0]['ids'] ) )
			$images = explode( ',', $galleries[0]['ids'] );
	} else {
		$pattern = get_shortcode_regex();
		preg_match( "/$pattern/s", get_the_content(), $match );
		$atts = shortcode_parse_atts( $match[3] );
		if ( isset( $atts['ids'] ) )
			$images = explode( ',', $atts['ids'] );
	}
	if ( ! $images ) {
		$images = get_posts( array(
			'fields'         => 'ids',
			'numberposts'    => 999,
			'order'          => 'ASC',
			'orderby'        => 'menu_order',
			'post_mime_type' => 'image',
			'post_parent'    => get_the_ID(),
			'post_type'      => 'attachment',
		) );
	}
	return $images;
}
// Personnalisation du logo de la page de connexion back-office - Ajout� par Florian
function childtheme_custom_login() {
	echo '<link rel="stylesheet" type="text/css" href="' . get_bloginfo('stylesheet_directory') . '/login.css" />';
}
add_action('login_head', 'childtheme_custom_login');
// Ajout de fichiers Javascript personnalis�s - Ajout� par Florian
function custom_js(){
		wp_enqueue_script( 'syncbox',
		get_template_directory_uri() . '/js/syncbox.js',
		array() );
	
}
 
add_action( 'wp_head', 'custom_js' );

// M�thode de personnalisation du site via le Back-End - ajout� par Florian

if(is_admin()) 
{
	wp_enqueue_style('wp-color-picker');
	wp_enqueue_script('costumadminjs',  get_template_directory_uri().'/js/admin.js');
	wp_enqueue_script( 'wp-color-picker');
}
register_nav_menus(array( 'header' => 'Menu principal (header)'));
///ajout bdd option 	
add_action( 'admin_init', 'jv_options' );
function jv_options( )
{
	register_setting( 'my_theme', 'background_color' ); // couleur de fond sidebar
	register_setting( 'my_theme', 'logo_site' ); 
	register_setting( 'my_theme', 'text_color' );       // couleur du texte sidebar
	register_setting( 'my_theme', 'image_background');
	register_setting( 'my_theme', 'image_logo');
	register_setting( 'my_theme', 'image_banner');
	register_setting( 'my_theme', 'background_menu'); // couleur background de menu
	register_setting( 'my_theme', 'entete_menu');
	register_setting( 'my_theme', 'all_text_color');
	register_setting( 'my_theme', 'text_police');
	register_setting( 'my_theme', 'back_boxes');
	register_setting( 'my_theme', 'cat_title');
	register_setting( 'my_theme', 'back_gen');
	
}
// la fonction myThemeAdminMenu( ) sera ex�cut�e
// quand WordPress mettra en place le menu d'admin
/// ajout dans la bar admin wordpress
add_action( 'admin_menu', 'jv_AdminMenu' );
function jv_AdminMenu( )
{
	//add_submenu_page( 'themes.php', 'Options th�me', 'Options th�me', 'administrator', 'Options th�me', 'VueOptionPage' );
	add_menu_page(
		'Options theme', // le titre de la page
		'Options theme',            // le nom de la page dans le menu d'admin
		'administrator',        // le r�le d'utilisateur requis pour voir cette page
		'Options theme',        // un identifiant unique de la page
		'VueOptionPage',   // le nom d'une fonction qui affichera la page
		'',
		'60,6'
	);
	
    /*add_theme_page( 'Options th�me', 'Options th�me', 
    'administrator', 'Options th�me', 
    'VueOptionPage' );*/
}
//// page admin
function VueOptionPage( )
{
	$str_string="";
	$array_font_family = array("Georgia","Palatino Linotype","Book Antiqua","Times New Roman","Arial","Helvetica","Arial Black","Impact","Lucida Sans Unicode","Tahoma","Verdana","Courier New","Lucida Console","initial");
	$str_string .= '<option value="" >choisir une police d\' ecriture</option>';
	for($cpt=0;$cpt<count($array_font_family);$cpt++)
	{
		if($array_font_family[$cpt]==get_option( 'text_police' ))
			$str_string .=  '<option value="'.$array_font_family[$cpt].'" selected>'.$array_font_family[$cpt].'</option>';
		else 
			$str_string .=  '<option value="'.$array_font_family[$cpt].'" >'.$array_font_family[$cpt].'</option>';	
	}
	wp_enqueue_media();
	echo '<div class="wrap">
		<h2>Parametrage du theme</h2>
		<form method="post" action="options.php">';
			
				// cette fonction ajoute plusieurs champs cach�s au formulaire
				// pour vous faciliter le travail.
				// elle prend en param�tre le nom du groupe d'options
				// que nous avons d�fini plus haut.
	settings_fields( 'my_theme' );
			echo'
			<table class="form-table">
				<tr valign="top">
					<th scope="row"><label for="image_background">Image du fond d\'ecran</label></th>
						<!-- Personnalisation du fond d\'�cran -->
						<td><image id="image_image_background" src="'.get_option("image_background").'" width="100"></td>
						<td><input type ="text" id="input_image_background" name="image_background" value="'.get_option('image_background').'" size="75"></td>
						<td><a href="#" id="image_background" class="button customaddmedia">Choisir une image</a></td>
				</tr>
				<tr valign="top">
					<th scope="row"><label for="image_logo">Logo du site</label></th>
						<!-- Personnalisation du logo du site -->
						<td><image id="image_logo_site" src="'.get_option("logo_site").'" width="100"> </td>
						<td><input type ="text" id="input_logo_site" name="logo_site" value="'.get_option('logo_site').'" size="75"></td>
						<td><a href="#" id="logo_site" class="button customaddmedia">Choisir une image</a></td>
				</tr>
				<tr valign="top">
					<th scope="row"><label for="image_logo">Image de la favicon</label></th>
						<!-- Personnalisation de la favicon -->
						<td><image id="image_image_logo" src="'.get_option("image_logo").'" width="100"> </td>
						<td><input type ="text" id="input_image_logo" name="image_logo" value="'.get_option('image_logo').'" size="75"></td>
						<td><a href="#" id="image_logo" class="button customaddmedia">Choisir une image</a></td>
				</tr>
				<tr valign="top">
					<th scope="row"><label for="image_logo">Image de la banniere</label></th>
					
						<td><image id="image_image_banner" src="'.get_option("image_banner").'" width="100"> </td>
						<td><input type ="text" id="input_image_banner" name="image_banner" value="'.get_option('image_banner').'" size="75"></td>
						<td><a href="#" id="image_banner" class="button customaddmedia">Choisir une image</a></td>
				</tr>
				<tr valign="top">
					<th scope="row"><label for="background_color">Couleur de fond de la zone widget</label></th>
					<td><input type="text" id="background_color" name="background_color" class="background_color" value="'.get_option( 'background_color' ).'" /></td>
				</tr>
				<tr valign="top">
					<th scope="row"><label for="text_color">Couleur du texte de la zone widget</label></th>
					<td><input type="text" id="text_color" name="text_color" class="text_color" value="'.get_option( 'text_color' ).'" /></td>
				</tr>
				<tr valign="top">
					<th scope="row"><label for="background_menu">Couleur de fond du menu</label></th>
					<td><input type="text" id="background_menu" name="background_menu" class="background_menu" value="'.get_option( 'background_menu' ).'" /></td>
				</tr>
				<tr valign="top">
					<th scope="row"><label for="entete_menu">Couleur de fond des en-tetes de menu</label></th>
					<td><input type="text" id="entete_menu" name="entete_menu" class="entete_menu" value="'.get_option( 'entete_menu' ).'" /></td>
				</tr>
				<tr valign="top">
					<th scope="row"><label for="back_boxes">Couleur de fond des cadres d\'informations</label></th>
					<td><input type="text" id="back_boxes" name="back_boxes" class="back_boxes" value="'.get_option( 'back_boxes' ).'" /></td>
				</tr>
				<tr valign="top">
					<th scope="row"><label for="all_text_color">Couleur du corps du texte</label></th>
					<td><input type="text" id="all_text_color" name="all_text_color" class="all_text_color" value="'.get_option( 'all_text_color' ).'" /></td>
				</tr>
				<tr valign="top">
					<th scope="row"><label for="text_police">Police d\'ecriture</label></th>
					<td><select name="text_police">'.$str_string.'</select></td>
				</tr>
				<tr valign="top">
					<th scope="row"><label for="cat_title">Couleur des titres des catégories</label></th>
					<td><input type="text" id="cat_title" name="cat_title" class="cat_title" value="'.get_option( 'cat_title' ).'" /></td>
				</tr>
				<tr valign="top">
					<th scope="row"><label for="back_gen">Couleur de fond</label></th>
					<td><input type="text" id="back_gen" name="back_gen" class="back_gen" value="'.get_option( 'back_gen' ).'" /></td>
				</tr>
			</table>
			<p class="submit">
				<input type="submit" class="button-primary" value="Appliquer les modifications" />
			</p>
		</form>
	</div>';
	
	// Selection du type de police
	/*<select>
if(get_option('font_family') == "")
      <option value="" selected>choisir sa famille</option>
else
       <option value="get_option('font_famille')" selected >get_option('font_famille')</option>
  <option value="volvo">Volvo</option>
  <option value="saab">Saab</option>
  <option value="opel">Opel</option>
  <option value="audi" selected>Audi</option>
</select>*/
	
}
///// ajout au head
add_action( 'wp_head', 'myThemeCss' );
function myThemeCss( )
{
	// on cr�e un bloc style qui appliquera nos couleurs � l'�l�ment body
	if (get_option('image_logo') != '') {
        echo '<link rel="shortcut icon" href="' .get_option('image_logo'). '"/>' . "\n";
    } 
    else { ?>
        <link rel="shortcut icon" href="<?php echo get_stylesheet_directory_uri() ?>/images/favicon.ico" />
    <?php }?>
	<?php if ((get_option('image_background') != '')
		|| (get_option('background_color')!= '') 
		|| (get_option('image_banner') != '')
		|| (get_option('background_color')!= '')
		|| (get_option('text_color') != '')
		|| (get_option('background_menu') != '')
		|| (get_option('entete_menu') != '')
		|| (get_option('back_boxes') != '')
		|| (get_option('all_text_color') != '')
		|| (get_option('police_ecriture') != '')
		|| (get_option('cat_title') != '')
		|| (get_option('back_gen') != '')) 
		{ ?>		
		<style type="text/css">
			<?php if (get_option('image_background') != ''){ ?>
				body, .banner {
					background: inherit;
					background-image: url(<?php echo get_option( 'image_background');?>);
					
				}
				.body{
					background-color: white;
				}
			<?php } 

			if (get_option('image_banner') != ''){ ?>
				#banner-text{background-image: url(<?php echo get_option( 'image_banner');?>);}
			<?php } 

			if (get_option('background_color') != ''){ ///// pour la side bar ?>
				.side{border: 1px solid green; width: 29.4%; background-color:<?php echo get_option('background_color'); ?>;}
					.login-box{background-color: <?php echo get_option('background_color'); ?>;}
				<?php }

			if (get_option('text_color') != ''){ ?>
				.welcome_user{color: <?php echo get_option( 'text_color' ); ?>;}
				    .welcome_user a{text-decoration:none; font-weight: bold; color: <?php echo get_option( 'text_color' ); ?>;}
				.disconnect_user{text-decoration:none; color: <?php echo get_option( 'text_color' ); ?>;}
			<?php } 
			
			if (get_option('background_menu') != ''){ ?>
				#access{background-color: <?php echo get_option( 'background_menu' ); ?> !important;}
				
			<?php } 
			if (get_option('entete_menu') != ''){ ?>
				.main-box-header, .menu_utilisateur_header{background-color: <?php echo get_option( 'entete_menu' ); ?>!important;}
			<?php } 
			
			if (get_option('back_boxes') != ''){ 
			?>
				#container .main-box-content,
				#container #main-box-1, 
				#container #main-box-2, 
				#container #main-box-3, 
				#container #main-box-4,
				.menu_utilisateur,
				#content .type-post{background-color: <?php echo get_option( 'back_boxes' ); ?>!important;}
			<?php } 
			if (get_option('all_text_color') != ''){
			?>
				#container .main-box-content ul li a,
				#container .main-box-content ul li a > p,
				#container .main-box-content li a,
				#container .main-box-content li > p,
				#container #main-box-1 ul li a,
				#container #main-box-1 ul li a > p,  
				#container #main-box-2 ul li a,
				#container #main-box-2 ul li a > p, 
				#container #main-box-3 ul li a,
				#container #main-box-3 ul li a > p, 
				#container #main-box-4 ul li a,
				#container #main-box-4 ul li a > p,
				.menu_utilisateur a, .menu_utilisateur_header a,
				.menu_utilisateur,
				.meta-prep, .meta-prep-author,.entry-date,.meta-sep,.author,.vcard,.author a,.vcard a,
				.cat-links,.cat-links a,.comments-link,.comments-link a,.edit-link,.edit-link a,
				.entry-utility-prep, .entry-utility-prep-cat-links, .entry-utility, .entry-utility a,
				.logged-in-as, .logged-in-as a{color:<?php echo get_option( 'all_text_color' ); ?> !important ;}
			<?php 
			
			}
			if (get_option('text_police') != ''){
			?>
				#container{ font-family:<?php echo get_option( 'text_police' ); ?> !important;}
			<?php
			
			}
			if (get_option('back_gen') != ''){
			?>
				#main{ background-color: <?php echo get_option( 'back_gen' ); ?>!important;}
			<?php
			
			}
			if (get_option('cat_title') != ''){
			?>
				.main-box-title, 
				#site-description,
				.type-post .entry-title a, .entry-title, .comment-reply-title{color:<?php echo get_option( 'cat_title' ); ?> !important ;}
			<?php
			}
			?>

		</style>
	<?php } 
}
