<?php get_header();?>
<?php $theme_options = get_option('Mag1'); ?>
<?php include('sidebar_left.php');?>

<?php
$theme_options = get_option('Mag1');
$prefix = '';
if($theme_options['contact_prefix']!=''){
	$prefix = $theme_options['contact_prefix'].' ';
}
$name = $_GET['nm'];
$email = $_GET['em'];
$subject = $_GET['sbj'];
$message = $_GET['msg'];
$sending = $_GET['sending'];
$valid_email = 0;
$output = "";

if(eregi("^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$", $email)){
	$valid_email = 1;
} else {
	$valid_email = 0;
}

$to = $theme_options['contact_email'];

if($sending==1){
	if($name!=''&&$valid_email==1&&$subject!=''&&$message!=''){
		$name = str_replace(' ','.',$name);
		$headers ="From: $name\n"."Reply-To: $email\n"."X-Mailer: PHP/".phpversion();
		$message = str_replace('\\','',$message);
		mail($to, $subject, $message, $headers);
		$output = "Your message has been sent! Thank you for contacting us.";
		$name="";$email="";$subject="";$message="";$valid_email=0;$sending=0;
	} else if($name!=''&&$valid_email==0&&$subject!=''&&$message!=''){
		$output = "E-mail is not valid.";
	} else {
		$output = "Please fill out all the fields!";	
	}
}
?>

<div id="container">
	<h2>Contact us</h2><br />
    
	<div class="entry">
	
		<?php if($output!=""){?><span class="contact-page-output"><?php echo $output;?></span><br /><br /><?php }?>
		
		<span>Please use the form below to send us an e-mail, we'll get back to you as soon as possible!</span>

		<br />
		<br />
        <label>Your name: </label>
        <br />
        <input type="text" id="con_name" value="<?php echo($name);?>" size="30" maxlength="25" />
        <br />
        <br />
        <label>E-mail address:<br />
</label>
        <input type="text" id="con_email" value="<?php echo($email);?>" size="30" maxlength="25" />
        <br />
        <label><br />
        Subject:<br />
</label>
        <input type="text" id="con_subject" value="<?php echo($subject);?>" size="30" maxlength="30" />
        <br />
        <label><br />
        Message:<br />
</label>
        <textarea cols="30" rows="4" id="con_message"><?php echo($message);?></textarea>
        <br />
        <br />
        <input type="button" class="btn" onclick="sendmail('<?php bloginfo('url'); echo '/?m=contact';?>');" value="Submit message" />
        <br />
        <br />
<br />
		

  </div>	
    
</div>



<?php include('sidebar_post.php');?>

<?php get_footer();?>