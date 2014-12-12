<?php
    session_start();
    require('config.php');
    $retval_cat = mysql_query("SELECT MAX(`group_id`) AS `id` FROM `orders`", $conn) or die('Could not get data: ' . mysql_error());
    $row_cat = mysql_fetch_array($retval_cat, MYSQL_ASSOC);
    $group_id = 1;
    if ($row_cat['id'] != 'NULL') {
        $group_id = $row_cat['id'] + 1;
    }   
    if (!isset($_SESSION['id'])) {
        $_SESSION['id'] = $group_id;
        mysql_query("INSERT INTO `orders` (group_id, name, price) VALUES ({$group_id}, '', -1)", $conn);
    } else {
        $group_id = $_SESSION['id'];
    }
    if (isset($_POST['dish'])) {
        
        $retval_cat1 = mysql_query("SELECT * FROM `dishes` WHERE `id`={$_POST['dish']} and `id` != -1", $conn) or die('Could not connect: ' . mysql_error());
        
        if (mysql_num_rows($retval_cat1) != 1) {
            return 0;
        }
        $row_cat1 = mysql_fetch_array($retval_cat1, MYSQL_ASSOC);
    
        $name = htmlspecialchars($row_cat1['name']);
        $price = htmlspecialchars($row_cat1['price']);
        $id1 = $row_cat1['id'];
        $img_location = sprintf("./images/dishes/%05s.jpg", $id1);

        mysql_query("INSERT INTO `orders` (group_id, name, price, dish_id) VALUES ({$group_id}, '{$name}', {$price}, {$id1})", $conn);

        echo "<div class=\"basket-block\">";
        echo "<img src=\"{$img_location}\" width=\"90%\" />";
        echo "<span>{$name}</span>";
        echo "<!--<a class=\"del_lnk\" value=\"{$ord_id}\" href=\"#\">Удалить</a>-->";
        echo "</div>";
    }


?>
