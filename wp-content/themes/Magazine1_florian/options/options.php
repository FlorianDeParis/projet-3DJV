<?php 

class ControlPanel {
	
	var $default_settings = array(
		'mag1_style_selector' => 'dark',
								  
		'display_blog_title' => 0,
		'blog_title_color' => '#dddddd',
		'blog_tagline_color' => '#777777',
		'blog_logo_url' => '',
		
		'featured_count' => 5,
		'featured_display_category' => 1,
		'featured_display_title' => 1,
		'featured_display_excerpt' => 1,
		
		'recent_home_count' => 6,
		
		'cat_headlines' => array('NM'=>array(), 'ID'=>array(), 'CB'=>array()),
		
		'mag1_home_video' => 1,
		'mag1_home_tabs' => 1,
		'mag1_home_tags' => 1,
		
		'mag1_post_latest' => 1,
		'mag1_post_tabs' => 1,
		'mag1_post_tags' => 1,
		
		'mag1_home_bann_center' => '<a href=\"http://themes1.com\"><img src=\"http://themes1.com/images/ad03.jpg\" alt=\"Themes1\" /></a>',
		'mag1_home_bann_left' => '<a href=\"http://themes1.com\"><img src=\"http://themes1.com/images/ad01.jpg\" alt=\"Themes1\" /></a><a href=\"http://themes1.com\"><img src=\"http://themes1.com/images/ad02.jpg\" alt=\"Themes1\" /></a>',
		
		'contact_enabled' => 1,
		'contact_email' => '',

		'mag1_custom_footer' => '&copy;2010 Magazine1. All rights reserved.<br />Powered by <a href="http://wordpress.org">WordPress</a>. Theme by <a href="http://themes1.com">Themes1</a>.',
		
	);
	
	
	function ControlPanel() {
		add_action('admin_menu', array(&$this, 'admin_menu'));
		add_action('admin_head', array(&$this, 'admin_head'));
	 
	if(function_exists('register_sidebar')) 
		register_sidebar(array('name' => 'Sidebar'));
	
	if(!is_array(get_option('Mag1')))
		add_option('Mag1', $this->default_settings);
		$this->options = get_option('Mag1');	
		

						$args=array(
						  'orderby' => 'name',
						  'order' => 'ASC'
						  );
						
						$categories=get_categories($args);
												
						foreach($categories as $category) { 
							if($category->name!='Uncategorized' && $category->name!='Video' && $category->name!='Photos'){
								array_push($this->default_settings['cat_headlines']['NM'], $category->name);
								array_push($this->default_settings['cat_headlines']['ID'], $category->term_id);								
								$this->default_settings['cat_headlines']['CB'][$category->term_id]=1;
							}
						} 
						


	}
 
	function admin_menu() {
	add_theme_page('Theme Control Panel', 'Magazine1 Options', 'edit_themes', "Magazine1", array(&$this, 'optionsmenu'));
	}
 
	function admin_head() {
		echo '<link rel="stylesheet" href="'.get_bloginfo('template_url').'/options/options.css" type="text/css" media="screen" />';
	}
	
	
	
	
	
	
	
	
	function optionsmenu() {
		
	if ($_POST['ss_action'] == 'save') {
		  
		$this->options["mag1_style_selector"] = $_POST['mag1_style_selector'];
		  
		$this->options["display_blog_title"] = isset($_POST['cp_displayblogtitle']) ? 1 : 0;
		$this->options["blog_title_color"] = $_POST['cp_blogtitlecolor'];
		$this->options["blog_tagline_color"] = $_POST['cp_blogtaglinecolor'];
		$this->options["blog_logo_url"] = $_POST['cp_bloglogourl'];

		$this->options["featured_count"] = $_POST['mag1_featured_count'];
		$this->options["featured_display_category"] = isset($_POST['mag1_featured_category']) ? 1 : 0;
		$this->options["featured_display_title"] = isset($_POST['mag1_featured_title']) ? 1 : 0;
		$this->options["featured_display_excerpt"] = isset($_POST['mag1_featured_excerpt']) ? 1 : 0;
		
		$this->options["recent_home_count"] = $_POST['mag1_recent_home_count'];

	
		$this->options['cat_headlines']['NM'] = array();
		$this->options['cat_headlines']['ID'] = array();
		$this->options['cat_headlines']['CB'] = array();
		for($QQ=0; $QQ<count($this->default_settings['cat_headlines']['NM']); $QQ++){
			array_push($this->options['cat_headlines']['NM'], $this->default_settings['cat_headlines']['NM'][$QQ]);
			array_push($this->options['cat_headlines']['ID'], $this->default_settings['cat_headlines']['ID'][$QQ]);
			$titttle = $this->options['cat_headlines']['ID'][$QQ];
			$this->options['cat_headlines']['CB'][$titttle] = isset($_POST[$titttle]) ? 1 : 0;
		}
	
		
		$this->options["mag1_home_video"] = isset($_POST['mag1_home_video']) ? 1 : 0;
		$this->options["mag1_home_tabs"] = isset($_POST['mag1_home_tabs']) ? 1 : 0;
		$this->options["mag1_home_tags"] = isset($_POST['mag1_home_tags']) ? 1 : 0;

		$this->options["mag1_post_latest"] = isset($_POST['mag1_post_latest']) ? 1 : 0;
		$this->options["mag1_post_tabs"] = isset($_POST['mag1_post_tabs']) ? 1 : 0;
		$this->options["mag1_post_tags"] = isset($_POST['mag1_post_tags']) ? 1 : 0;

		$this->options["contact_enabled"] = isset($_POST['mag1_contact_enabled']) ? 1 : 0;
		$this->options["contact_email"] = $_POST['mag1_contact_email'];

		$this->options["mag1_home_bann_center"] = $_POST['mag1_home_bann_center'];
		$this->options["mag1_home_bann_left"] = $_POST['mag1_home_bann_left'];

		$this->options["mag1_custom_footer"] = $_POST['mag1_custom_footer'];
		
		update_option('Mag1', $this->options);
		echo '<div class="updated fade" id="message" style="background-color: rgb(255, 251, 204); width: 300px; margin-left: 20px"><p>Settings <strong>saved</strong>.</p></div>';
	}
	  
				
// WRAPPER open
echo '<div class="settings-wrapper">';
	  
		// SETTINGS PAGE TITLE
	  	echo '<h2>Magazine1 Theme Options</h2>';
		echo '<form action="" method="post" class="themeform">';
		echo '<input type="hidden" id="ss_action" name="ss_action" value="save">';
		
echo '<ul class="settings-pages">';
echo '<li class="settings-pages-title">Main</li>';
echo '<li>';

		// MAGAZINE1 SKIN SELECTOR
	  	echo '<span class="settings-subtitle">Theme skin selector</span>';
		
		echo 'Choose: <select name="mag1_style_selector" id="mag1_style_selector">';
			echo '<option value="dark"'; if('dark'==$this->options["mag1_style_selector"]){ echo ' selected="yes" '; } echo '> Dark </option>';
			echo '<option value="light"'; if('light'==$this->options["mag1_style_selector"]){ echo ' selected="yes" '; } echo'> Light </option>';
			echo '<option value="dark-blue"'; if('dark-blue'==$this->options["mag1_style_selector"]){ echo ' selected="yes" '; } echo'> Dark - Blue </option>';
			echo '<option value="dark-yellow"'; if('dark-yellow'==$this->options["mag1_style_selector"]){ echo ' selected="yes" '; } echo'> Dark - Yellow </option>';
		echo '</select><br />';
			
			
			
		echo '<br />Logo<span class="settings-description">*Blog title option (below) has to be disabled for the Logo to be shown.</span>';
			echo 'Logo url: <input style="width: 400px" name="cp_bloglogourl" id="cp_bloglogourl" type="text" value="'.$this->options["blog_logo_url"].'" />';
			
		// BLOG TITLE SETTINGS
	  	echo '<span class="settings-subtitle">Blog Title</span>';
	  	echo '<span class="settings-description">*This is only if you choose to have text instead of an image logo.</span>';
			
			
			echo '<input type="checkbox" name="cp_displayblogtitle" id="cp_displayblogtitle"'.($this->options["display_blog_title"] == 1 ? ' checked' : '').' /><label style="margin-left: 5px;" for="cp_displayblogtitle">Enable Blog Title</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
		  
			echo 'Blog Title colour: <input style="width: 65px" name="cp_blogtitlecolor" id="cp_blogtitlecolor" type="text" value="'.$this->options["blog_title_color"].'" />&nbsp;&nbsp;&nbsp;';
			echo 'Tagline colour: <input style="width: 65px" name="cp_blogtaglinecolor" id="cp_blogtaglinecolor" type="text" value="'.$this->options["blog_tagline_color"].'" />';
	  				
	
echo '</li>';
echo '<li class="settings-pages-title">Homepage</li>';
echo '<li>';


		// FEATURED
	  	echo '<span class="settings-subtitle">Featured Content slider</span>';
		
		echo 'Posts count: <select name="mag1_featured_count" id="mag1_featured_count" type="text" value="'.$this->options["featured_count"].'">';
			for($t=1; $t<8; $t++){
				if(($t+3)==$this->options["featured_count"]){
					echo '<option value="'.($t+3).'" selected="yes">'.($t+3).'</option>';
				} else {
					echo '<option value="'.($t+3).'">'.($t+3).'</option>';
				}
			}
		echo '</select><br />';

	echo '<div class="settings-indent">';		

		echo '<input type="checkbox" name="mag1_featured_category" id="mag1_featured_category"'.($this->options["featured_display_category"] == 1 ? ' checked' : '').' /><label style="margin-left: 5px;" for="mag1_featured_category">Show Category Name</label><br />';
		echo '<input type="checkbox" name="mag1_featured_title" id="mag1_featured_title"'.($this->options["featured_display_title"] == 1 ? ' checked' : '').' /><label style="margin-left: 5px;" for="mag1_featured_title">Title</label><br />';
		echo '<input type="checkbox" name="mag1_featured_excerpt" id="mag1_featured_excerpt"'.($this->options["featured_display_excerpt"] == 1 ? ' checked' : '').' /><label style="margin-left: 5px;" for="mag1_featured_excerpt">Excerpt</label><br />';
		
	echo '</div>';


		// RECENT POSTS HEADLINES
	  	echo '<span class="settings-subtitle">Recent Headlines</span>';
	  	echo '<span class="settings-description">*These are the headlines just under the Featured Content slider.</span>';
		
		echo 'Headlines count: <select name="mag1_recent_home_count" id="mag1_recent_home_count">';
			for($t=0; $t<=8; $t+=2){
				if($t==$this->options["recent_home_count"]){
					echo '<option value="'.$t.'" selected="yes">'.$t.'</option>';
				} else {
					echo '<option value="'.$t.'">'.$t.'</option>';
				}
			}
		echo '</select><br />';
		

		// SELECT CATEGORY HEADLINES
	  	echo '<span class="settings-subtitle">Category Headlines</span>';
	  	echo '<span class="settings-description">*Recent posts blocks from specific Categories.</span>';
		
		echo '<div class="settings-indent">';		
			$namesArray = $this->default_settings['cat_headlines']['NM'];
			$idArray = $this->default_settings['cat_headlines']['ID'];
			$chkbArray = $this->options['cat_headlines']['CB'];
			for($QQ=0; $QQ<count($namesArray); $QQ++){
				echo '<input type="checkbox" name="'.$idArray[$QQ].'" id="'.$idArray[$QQ].'"'.($chkbArray[$idArray[$QQ]] == 1 ? ' checked' : '').' /><label style="margin-left: 5px;" for="'.$idArray[$QQ].'">'.$namesArray[$QQ].'</label><br />';
			}
		echo '</div>';
					
		
		// WIDGETS homepage
	  	echo '<span class="settings-subtitle">Widgets</span>';
	  	echo '<span class="settings-description">*Please select which custom widgets to display in the Sidebar Widget area.</span>';

	echo '<div class="settings-indent">';

		echo '<input type="checkbox" name="mag1_home_video" id="mag1_home_video"'.($this->options["mag1_home_video"] == 1 ? ' checked' : '').' /><label style="margin-left: 5px;" for="mag1_home_video">Video</label><br />';
		echo '<input type="checkbox" name="mag1_home_tabs" id="mag1_home_tabs"'.($this->options["mag1_home_tabs"] == 1 ? ' checked' : '').' /><label style="margin-left: 5px;" for="mag1_home_tabs">Popular posts</label><br />';
		echo '<input type="checkbox" name="mag1_home_tags" id="mag1_box_tags"'.($this->options["mag1_home_tags"] == 1 ? ' checked' : '').' /><label style="margin-left: 5px;" for="mag1_home_tags">Tag cloud</label><br />';
		
	echo '</div>';
		
		
echo '</li>';
echo '<li class="settings-pages-title">Post page</li>';
echo '<li>';
		
		// WIDGETS post
	  	echo '<span class="settings-subtitle">Widgets</span>';
	  	echo '<span class="settings-description">*Please select which boxes to show in the Widget Area.</span>';
		
	echo '<div class="settings-indent">';
		
		echo '<input type="checkbox" name="mag1_post_latest" id="mag1_post_latest"'.($this->options["mag1_post_latest"] == 1 ? ' checked' : '').' /><label style="margin-left: 5px;" for="mag1_post_latest">Latest entries</label><br />';
		echo '<input type="checkbox" name="mag1_post_tabs" id="mag1_post_tabs"'.($this->options["mag1_post_tabs"] == 1 ? ' checked' : '').' /><label style="margin-left: 5px;" for="mag1_post_tabs">Popular posts</label><br />';
		echo '<input type="checkbox" name="mag1_post_tags" id="mag1_post_tags"'.($this->options["mag1_post_tags"] == 1 ? ' checked' : '').' /><label style="margin-left: 5px;" for="mag1_post_tags">Tags</label><br />';
		
	echo '</div>';
	
	
	
echo '</li>';
echo '<li class="settings-pages-title">Contact Page</li>';
echo '<li>';
		
		// CONTACT PAGE SETUP 
		echo '<br /><input type="checkbox" name="mag1_contact_enabled" id="mag1_contact_enabled"'.($this->options["contact_enabled"] == 1 ? ' checked' : '').' /><label style="margin-left: 5px;" for="mag1_contact_enabled">Enable Contact Page</label><br />';
			echo '<br />Your e-mail: <input name="mag1_contact_email" id="mag1_contact_email" type="text" value="'.$this->options["contact_email"].'" /><br />';


echo '</li>';
echo '<li class="settings-pages-title">Ads</li>';
echo '<li>';
		
		// BANNER HOMEPAGE CENTER
	  	echo '<span class="settings-subtitle">Center Banner, 527x77px</span>';
	  	echo '<span class="settings-description">*This is the large banner on homepage (right under Recent Headlines).</span>';
		
			echo 'Url (with html code): <textarea rows="2" class="widefat" style="text-align: left" name="mag1_home_bann_center" id="mag1_home_bann_center" type="text">';
			echo str_replace('\\','',$this->options["mag1_home_bann_center"]);
			echo '</textarea>';
		
		// BANNER HOMEPAGE LEFT
	  	echo '<span class="settings-subtitle">Banners on the Left Sidebar, 125x125px</span>';
	  	echo '<span class="settings-description">*These are displayed on every page and you can put as many as you like here as long as they are of the right dimensions.</span>';
		
			echo 'Url: <textarea rows="3" class="widefat" style="text-align: left" name="mag1_home_bann_left" id="mag1_home_bann_left" type="text">';
			echo str_replace('\\','',$this->options["mag1_home_bann_left"]);
			echo '</textarea>';
		
echo '</li>';

		
		//CUSTOM FOOTER
echo '<li class="settings-pages-title">Footer</li>';
echo '<li>';
	  	echo '<span class="settings-subtitle">Custom Footer</span>';
	  	echo '<span class="settings-description">*You can also insert html code here.</span>';
		
		echo '<textarea rows="4" class="widefat" style="text-align: left" name="mag1_custom_footer" id="mag1_custom_footer" type="text">';
		echo str_replace('\\','',$this->options["mag1_custom_footer"]);
		echo '</textarea>';
		
echo '</li>';
echo '</ul>';

		
		
		// SAVE CHANGES	  
	  	echo '<p class="submit"><input type="submit" value="Save Changes" name="cp_save"/></p>';
	  	echo '</form>';
		
// WRAPPER close
echo '</div>';
	}
	
	
	
}




?>