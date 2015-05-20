<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, and ABSPATH. You can find more information by visiting
 * {@link http://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php}
 * Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', '3d_jeuxvideo');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', 'root');

/** MySQL hostname */
define('DB_HOST', '83.156.178.59:4444');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'QG?Br=|-jvhNdgT:[OzMkSp`>3Ls|4c!i|moo;G==h#ksBKau:xb/gT3eWN&A2a&');
define('SECURE_AUTH_KEY',  'd2wCT;{xX`M7(g`[%)HM=$~P^?Me,(zRoplsFe@j=(RZ%cusGw/<)jK%hWct?%BI');
define('LOGGED_IN_KEY',    'Mj7k94D<=!rZ }Dk9)NhabF4R<frS}8wkLH_C/p6PY~xc,JV*f<{>fyX?Ts}m=6v');
define('NONCE_KEY',        '25Ly1*qJtvPO||,EC<vN0ur(Z/Xuqa2^JvFl7CM=8zMC SWyP)jTeh**[tv#LO?W');
define('AUTH_SALT',        'J&*HMVRg;CDjPjElCY>oSdBG9K6K4u8_(*mK^?9_`?@)|0T)0#K<#0R W-62`x p');
define('SECURE_AUTH_SALT', 'oE^j@oRk=4NJRm0(IAZ%zA.n9-mE!Os#$2dRpd~MW^$KgGI*=t&Z9TqQg) ?1d#Y');
define('LOGGED_IN_SALT',   'C%pU$6K6xhRG5WR#~bheRC<y0hfkvu*AR2qK+w^bAv?lU#A5lP g22V=ess8rJk/');
define('NONCE_SALT',       'ucUv?w?ha|icoBmU=xlLYx9^c8]c>RbB ^5oIdYI8{RWF2!iP8.mLyiJ4DCK9 W+');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
