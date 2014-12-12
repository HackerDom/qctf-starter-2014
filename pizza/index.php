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
?>


<html>
    <head>
        <meta charset="utf-8" />
        <title>SUPER PIZZA</title>
        <link type="text/css" rel="stylesheet" media="all" href="./style/style.css" />
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script>
            jQuery(document).ready(function($){
                $(".make_order").on("click",function(){
                    $.ajax({
                        url: "./add.php",
                        type: "POST",
                        data: { dish: this.getAttribute('value') },
                        success: function(data){
                            $('#inner-part').append(data);
                        }
                    });
                    
                });

                $(".del_lnk").on("click",function(){
                    $(this).parent().remove();
                    $.ajax({
                        url: "./del.php",
                        type: "POST",
                        data: { order: this.getAttribute('value') },
                        success: function(data){
                            alert(data);
                        }
                    });
                    
                });
                
                $("#click").on("click",function(){
                    $("#basket .content").toggleClass('open');
                });
            });

        </script>
    </head>
    <body>
        </div>
        <div id="header">
            <div id="click" style="position: absolute; z-index: 999; right: 0px; width: 100px; height: 84px;"></div>
            <div id="basket">
                <div id="inner-part" class="content">
                    <?php
                        $retval_cat = mysql_query("SELECT * FROM `orders` WHERE `group_id`={$group_id}", $conn) or die('Could not connect: ' . mysql_error());
                        while ($row_cat = mysql_fetch_array($retval_cat, MYSQL_ASSOC)) {
                            $name = htmlspecialchars($row_cat['name']);
                            $price = htmlspecialchars($row_cat['price']);
                            $id1 = $row_cat['dish_id'];
                            $img_location = sprintf("./images/dishes/%05s.jpg", $id1);
                            if ($price != -1) {
                                echo "<div class=\"basket-block\">";
                                echo "<img src=\"{$img_location}\" width=\"90%\" />";
                                echo "<span>{$name}</span>";
                                echo "<!--<a class=\"del_lnk\" value=\"{$row_cat['id']}\" href=\"#\">Удалить</a>-->";
                                echo "</div>";
                            }
                        }
                    ?>
                    <!-- ТУТ НУЖЕН СКРОЛЛБАР!!! (не всё влазит) -->
                </div>
            </div>
        </div>
        <div id="main">
            <?php
                $retval_cat = mysql_query("SELECT * FROM `dishes`", $conn) or die('Could not connect: ' . mysql_error());
                while ($row_cat = mysql_fetch_array($retval_cat, MYSQL_ASSOC)) {
                    $name = htmlspecialchars($row_cat['name']);
                    $price = htmlspecialchars($row_cat['price']);
                    $id = $row_cat['id'];
                    $img_location = sprintf("./images/dishes/%05s.jpg", $id);
                    
                    
                    echo "<div class=\"block\"><img src=\"{$img_location}\" />";
                    echo "<h1>" . $name  . "</h1>";
                    echo "<div class='bottom'>Цена: {$price} руб.<br />";
                    echo "<a href=\"#\" class=\"make_order\" value=\"{$id}\"><div class='cart'><div></div></div></a></div></div>";
                }
            ?>
        </div>
        <div id="footer">
            (c) Juicy-Media
        </div>
    </body>
</html>
