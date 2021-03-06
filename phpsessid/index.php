<?php
	ini_set('display_errors', 1);
	error_reporting(E_ALL);

	function error_handler($errno, $errstr, $errfile, $errline) {
		$err = $errno == 2 ? 'Warning' : 'Notice';
		die("<br />\n<b>${err}</b>:  ${errstr} in <b>${errfile}</b> on line <b>${errline}</b><br />");
	}
	set_error_handler('error_handler');

	$session = unserialize($_COOKIE['session']);

	$username = $session['username'];
	if ($username === 'admin') {
		echo 'QCTF_b62f8ba05a47c424daa9663ac506058f';
	} else {
		echo "Hello, <b>${username}</b>! Flag is available only for <b>admin</b>.";
	}
?>