<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv('DB_NAME') );

/** MySQL database username */
define( 'DB_USER', getenv('DB_USER') );

/** MySQL database password */
define( 'DB_PASSWORD', getenv('DB_USER_PASSWD') );

/** MySQL hostname */
define( 'DB_HOST', getenv('MARIADB_HOST'));

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'L/gx.;Yht.+KD?|l31E_qd3<]T4]CVVC:zZ3^w?l `Z@^l[Lr6I$FAXQNf:+ewm^');
define('SECURE_AUTH_KEY',  ' -PMLg3>y_A@aZ<vGs`/}m}>_|a@dq*Wxr{vai@6gY8epgv8K_LOC|$.+(IfTl}b');
define('LOGGED_IN_KEY',    'q<mN -pVcxLJj>y.b_i%-?D+md)o=ZCm|+W:XS*$j?E8d|Hrg?4o*b+c%Y2~y@l/');
define('NONCE_KEY',        'A~(g60t!;w4D1ec0>C+}>{A+UBD1SESK|bIqkr:QlC{o-lYp->WU@KBoL,LiK9?~');
define('AUTH_SALT',        'p(I2De)F/SOJpm-iA*C-0@*)-V/>X>u7{x8`Y?2J%EDqSM8~RU.hQHwpH%pDt(E,');
define('SECURE_AUTH_SALT', 'c|gl`V{DiQD]%y)Mz{33MkvIuXp-sllz{Y?v4oQ53m}fGBPe:r[UO&RWuXANriFy');
define('LOGGED_IN_SALT',   'qDb1ah.Z<%]QuL-[VkJ:i<>#|k^]c/-{C$Y92RR|`r!L4Sm>&f$Ooc^$nWo$jK}U');
define('NONCE_SALT',       'K+e9k_CMBwJu(<ba,R6kO4[$-:zS~V85^B~[T<bZpm8-hc&#hj%>+76xH$|+?ALu');
/**#@-*/

/**
 * Redis cache
 */

define( 'WP_REDIS_HOST', getenv('WP_REDIS_HOST') ?: '127.0.0.1' );
define( 'WP_REDIS_PORT', getenv('WP_REDIS_PORT') ?: 6379 );
define( 'WP_REDIS_TIMEOUT', getenv('WP_REDIS_TIMOUT') ?: 1 );
define( 'WP_REDIS_READ_TIMEOUT', getenv('WP_REDIS_TIMOUT') ?: 1 );
define( 'WP_REDIS_DATABASE', getenv('WP_REDIS_DATABASE') ?: 0 );

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
