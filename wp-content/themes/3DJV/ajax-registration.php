<?php

/*
Template Name: Page inscription
*/

function vb_registration_form() { ?>

<div class="vb-registration-form">
  <form class="form-horizontal registraion-form" role="form">

  	<div class="form-group">
      <label for="vb_name" class="sr-only">Your Name</label>
      <input type="text" name="vb_name" id="vb_name" value="" placeholder="Your Name" class="form-control" />
    </div>

    <div class="form-group">
      <label for="vb_email" class="sr-only">Your Email</label>
      <input type="email" name="vb_email" id="vb_email" value="" placeholder="Your Email" class="form-control" />
    </div>

    <div class="form-group">
      <label for="vb_nick" class="sr-only">Your Nickname</label>
      <input type="text" name="vb_nick" id="vb_nick" value="" placeholder="Your Nickname" class="form-control" />
    </div>

    <div class="form-group">
      <label for="vb_username" class="sr-only">Choose Username</label>
      <input type="text" name="vb_username" id="vb_username" value="" placeholder="Choose Username" class="form-control" />
      <span class="help-block">Please use only a-z,A-Z,0-9,dash and underscores, minimum 5 characters</span>
    </div>

    <div class="form-group">
      <label for="vb_pass" class="sr-only">Choose Password</label>
      <input type="password" name="vb_pass" id="vb_pass" value="" placeholder="Choose Password" class="form-control" />
      <span class="help-block">Minimum 8 characters</span>
    </div>

    <?php wp_nonce_field('vb_new_user','vb_new_user_nonce', true, true ); ?>

    <input type="submit" class="btn btn-primary" id="btn-new-user" value="Register" />
  </form>

    <div class="indicator">Please wait...</div>
    <div class="alert result-message"></div>
</div>

<?php
}

/**
 * Enqueue and localize js
 *
 */

function vb_register_user_scripts() {
  // Enqueue script
  wp_register_script('vb_reg_script', get_template_directory_uri() . '/wp-content/themes/3DJV/ajax-registration.js', array('jquery'), null, false);
  wp_enqueue_script('vb_reg_script');
 
  wp_localize_script( 'vb_reg_script', 'vb_reg_vars', array(
        'vb_ajax_url' => admin_url( 'admin-ajax.php' ),
      )
  );
}
add_action('wp_enqueue_scripts', 'vb_register_user_scripts', 100);



/**
 * New User registration
 *
 */
function vb_reg_new_user() {
 
  // Verify nonce
  if( !isset( $_POST['nonce'] ) || !wp_verify_nonce( $_POST['nonce'], 'vb_new_user' ) )
    die( 'Ooops, something went wrong, please try again later.' );

  // Post values
	$username = $_POST['user'];
	$password = $_POST['pass'];
	$email    = $_POST['mail'];
	$name     = $_POST['name'];
	$nick     = $_POST['nick'];
 	
 	/**
 	 * IMPORTANT: You should make server side validation here!
 	 *
 	 */

	$userdata = array(
		'user_login' => $username,
		'user_pass'  => $password,
		'user_email' => $email,
		'first_name' => $name,
		'nickname'   => $nick,
	);

	$user_id = wp_insert_user( $userdata ) ;

	//On success
	if( !is_wp_error($user_id) ) {
		echo '1';
	} else {
		echo $user_id->get_error_message();
	} 
  die();
	
}
 
add_action('wp_ajax_register_user', 'vb_reg_new_user');
add_action('wp_ajax_nopriv_register_user', 'vb_reg_new_user');