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
define('DB_NAME', 'esgi-3djv');

/** Utilisateur de la base de données MySQL. */
define('DB_USER', 'root');

/** Mot de passe de la base de données MySQL. */
define('DB_PASSWORD', '');

/** Adresse de l'hébergement MySQL. */
define('DB_HOST', 'localhost');

/** Jeu de caractères à utiliser par la base de données lors de la création des tables. */
define('DB_CHARSET', 'utf8mb4');

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
define('AUTH_KEY',         '<}#(B7Y>?U#JT/!vTR+}7#b.cws3+7-02q]Gg#wE@duc{|)qoG{bPzsZ j,sp,ql');
define('SECURE_AUTH_KEY',  'L|~c++5;WD{==NWC}<u=]Ylutj+NW3-mILey+GKCEbpxAYSBop3,AI)Yre=[]YZt');
define('LOGGED_IN_KEY',    'MqpOUMX%G50;6dpfnQm>|aqtKF>1T4fgsKl6 &ECZ/ka~,,***_,UiJDP)DSiGo&');
define('NONCE_KEY',        'A2/B`sZBiYj6a 07-Sxh2?qDv&)7Mq_Z/Q&,U#s5ugV83 ^E]8S(^N>5eH:iw+dz');
define('AUTH_SALT',        'Q/pFs7VBG/HpD.&9s?=A(buQ!@{8W||>7Lv+if}=*aW%D#}ei~:Dn$R(}7HhC-}t');
define('SECURE_AUTH_SALT', 'rDXo$Jt)odn: )udXLibi|-.W?/lPN7yRnen%+nG|]bs2jA5BcQx[wSvglFs )aa');
define('LOGGED_IN_SALT',   'NonrP(:aV-.5j9*+P]r! Xwk)1?R|cuUHO&Zd?mJe[8Jk%iP-%Xjv{^->,md3 4H');
define('NONCE_SALT',       'e=*uc/xQT(h95(JO9g2-Gp1gGHrMC&~Q)fe+BeTsCw2I4NQ1x8}Ph+PMP=K]7FXG');
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