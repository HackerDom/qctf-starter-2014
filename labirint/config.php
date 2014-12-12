<?php
    $db_host = 'localhost';
    $db_user = '';
    $db_pass = '';
    $db_database = '';
    $conn = mysql_connect($db_host, $db_user, $db_pass);
    mysql_select_db($db_database);
    mysql_query('SET NAMES utf8');
?>
