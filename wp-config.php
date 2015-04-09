<?php
/**
 * La configuration de base de votre installation WordPress.
 *
 * Ce fichier contient les réglages de configuration suivants : réglages MySQL,
 * préfixe de table, clefs secrètes, langue utilisée, et ABSPATH.
 * Vous pouvez en savoir plus à leur sujet en allant sur 
 * {@link http://codex.wordpress.org/fr:Modifier_wp-config.php Modifier
 * wp-config.php}. C'est votre hébergeur qui doit vous donner vos
 * codes MySQL.
 *
 * Ce fichier est utilisé par le script de création de wp-config.php pendant
 * le processus d'installation. Vous n'avez pas à utiliser le site web, vous
 * pouvez simplement renommer ce fichier en "wp-config.php" et remplir les
 * valeurs.
 *
 * @package WordPress
 */

// ** Réglages MySQL - Votre hébergeur doit vous fournir ces informations. ** //
/** Nom de la base de données de WordPress. */
define('DB_NAME', 'projet-3djv');

/** Utilisateur de la base de données MySQL. */
define('DB_USER', 'root');

/** Mot de passe de la base de données MySQL. */
define('DB_PASSWORD', '');

/** Adresse de l'hébergement MySQL. */
define('DB_HOST', 'localhost');

/** Jeu de caractères à utiliser par la base de données lors de la création des tables. */
define('DB_CHARSET', 'utf8');

/** Type de collation de la base de données. 
  * N'y touchez que si vous savez ce que vous faites. 
  */
define('DB_COLLATE', '');

/**#@+
 * Clefs uniques d'authentification et salage.
 *
 * Remplacez les valeurs par défaut par des phrases uniques !
 * Vous pouvez générer des phrases aléatoires en utilisant 
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ le service de clefs secrètes de WordPress.org}.
 * Vous pouvez modifier ces phrases à n'importe quel moment, afin d'invalider tous les cookies existants.
 * Cela forcera également tous les utilisateurs à se reconnecter.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'Bo}cpKB$:`G<P0o6WW&<>z(4MaAoW kE31D!62}](^rNaEwcb>@a=T|yD(+X)&HV');
define('SECURE_AUTH_KEY',  '*AAI+8c2|e<]*r50&uTYn-W)fW0CVR][AYdr;s$E$ 01&Iu$c+!w-,?V`@|LV}(R');
define('LOGGED_IN_KEY',    '6dh:(i1j:ytVLR-#%GcAIbJo=JF4=NSMynUFw!4]y|q|?*&B&P>IX=v!t>~XDgr5');
define('NONCE_KEY',        '(7+gI+j$-ap5JYry:^oL,q>.aFrLAG[E-+j=7CGm-$(/K>Xhk#>s*0^X&E3[#ED2');
define('AUTH_SALT',        'f|v8)p],yUU|lN:0d;:jm?&pMfosSd]T+zUe/P{lr*sH^!,qA((oenhR)dP5fZuQ');
define('SECURE_AUTH_SALT', 'GG#ETAoF+d+ ;fbgjVuk)?a!X,<jl+N~hspcD~-Edi*3yv?jNvE=Y(Q] W,..{Kw');
define('LOGGED_IN_SALT',   ')OQJg,L=ipuXX/%1h:HEL5VFc)$!1-_FdUZ-W{pa+X-;!A3EK2p(T6x+G!x+Yrb6');
define('NONCE_SALT',       'C|0BV]nj|2,=M`+bT6ri45}Kg)~d{]mjG`9o/?p@pVc7=LgTp=u4u/By#svsAs2z');
/**#@-*/

/**
 * Préfixe de base de données pour les tables de WordPress.
 *
 * Vous pouvez installer plusieurs WordPress sur une seule base de données
 * si vous leur donnez chacune un préfixe unique. 
 * N'utilisez que des chiffres, des lettres non-accentuées, et des caractères soulignés!
 */
$table_prefix  = 'wp_';

/** 
 * Pour les développeurs : le mode deboguage de WordPress.
 * 
 * En passant la valeur suivante à "true", vous activez l'affichage des
 * notifications d'erreurs pendant votre essais.
 * Il est fortemment recommandé que les développeurs d'extensions et
 * de thèmes se servent de WP_DEBUG dans leur environnement de 
 * développement.
 */ 
define('WP_DEBUG', false); 

/* C'est tout, ne touchez pas à ce qui suit ! Bon blogging ! */

/** Chemin absolu vers le dossier de WordPress. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Réglage des variables de WordPress et de ses fichiers inclus. */
require_once(ABSPATH . 'wp-settings.php');