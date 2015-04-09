<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head profile="http://gmpg.org/xfn/11">
	<meta http-equiv="Content-Type" content="<?php bloginfo('html_type'); ?>; charset=<?php bloginfo('charset'); ?>" />	
	<meta name="generator" content="WordPress <?php bloginfo('version'); ?>" /> <!-- leave this for stats please -->

	<?php $theme_options = get_option('Mag1'); ?>
    
    <style type="text/css">
	<?php if($theme_options['display_blog_title']!=1){ ?>
		<?php if($theme_options['blog_logo_url']!=""){ ?>
			#header #main-logo h1 span {
			background:url("<?php echo($theme_options['blog_logo_url']);?>") no-repeat;
			}
		<?php } else {?>
			#header #main-logo h1 span {
			background:url("<?php bloginfo('template_url'); ?>/images/logo-<?php echo($theme_options['mag1_style_selector']); ?>.gif") no-repeat;
			}
		<?php }?>
	<?php }?>
	</style>

	<title><?php bloginfo('name'); ?><?php wp_title(); ?></title>


<script type="text/javascript" src="<?php bloginfo('template_url'); ?>/js/jquery.js"></script>
<script type="text/javascript" src="<?php bloginfo('template_url'); ?>/js/m1functions.js"></script>
<script type="text/javascript" src="<?php bloginfo('template_url'); ?>/js/easySlider1.7.js"></script>

<script type="text/javascript">

    $(document).ready(function(){  
        $("#slider").easySlider({
            auto: true,
            continuous: true,
			speed: 600,
			numeric: true,
			numericId: 'slider-controller'
        });
		
	$("#video-slider").easySlider({ 
			continuous: true,
			speed: 400,
			nextId: "videonext",
			prevId: "videoprev",
			prevText: "",
			nextText: ""
		});
	
	$("#photos-slider").easySlider({ 
			continuous: false,
			speed: 400,
			nextId: "photosnext",
			prevId: "photosprev",
			prevText: "",
			nextText: ""
		});
	
	setupTabs();
	getCurrentTime();
	getRelated();
	
	
	
    });
	
</script>

	<link rel="stylesheet" href="<?php echo bloginfo('url').'/wp-content/themes/Magazine1/style-'.$theme_options['mag1_style_selector'].'.css'; ?>" type="text/css" media="screen" />
	<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="<?php bloginfo('rss2_url'); ?>" />
	<link rel="alternate" type="text/xml" title="RSS .92" href="<?php bloginfo('rss_url'); ?>" />
	<link rel="alternate" type="application/atom+xml" title="Atom 0.3" href="<?php bloginfo('atom_url'); ?>" />
	<link rel="pingback" href="<?php bloginfo('pingback_url'); ?>" />

	<?php wp_get_archives('type=monthly&format=link'); ?>
	<?php //comments_popup_script(); // off by default ?>
	<?php wp_head(); ?>


</head>
<body>


<div id="wrapper">




<div id="header">

	<div id="header-top">
	
		<div class="left">
        	<ul>
				<li><a class="rss-icon" href="<?php bloginfo('rss2_url'); ?>" title="<?php _e('RSS Feed'); ?>"></a></li>
				<li id="timeDate"></li>
			</ul>
        </div>

		<div class="right">
			<ul>
			<li class="pages"><a href="<?php blogInfo('url'); echo '/?page_id=2'; ?>">About</a></li>  
			<?php if($theme_options['contact_enabled']==1){?><li class="pages"><a href="<?php blogInfo('url'); echo '/?m=contact'; ?>">Contact</a></li><?php }?> 
			<li><?php wp_register('', ''); ?></li>
			<li><?php wp_loginout();?></li>
			<li><?php wp_meta();?></li>
			</ul>
		</div>
	</div>
	
		<div class="clear"></div>

<div id="main-logo">
    <h1><a href="<?php blogInfo('url'); ?>" title="<?php blogInfo('name');?>"><span>
	<?php 
	   $theme_options = get_option('Mag1');
	if ($theme_options["display_blog_title"] == 1) {?>
		<div id="logo-title" style="color:<?php echo($theme_options["blog_title_color"]);?>"> <?php bloginfo('name');?><div id="logo-tagline" style="color:<?php echo($theme_options["blog_tagline_color"]);?>"> <?php bloginfo('description');?></div></div>
	<?php }?>
	


	</span></a></h1>
</div>

<div id="header-right">
	<?php include(TEMPLATEPATH.'/searchform.php');?>
</div>

	
</div>