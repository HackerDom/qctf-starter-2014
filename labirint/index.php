<?php
    session_start();
    require('config.php');
    if (!isset($_SESSION['step'])) {
        $id = '1';
        $_SESSION['step'] = '1';
    } else {
        $id = $_SESSION['step'];
    }
    $retval_cat = mysql_query("SELECT COUNT(*) FROM `qctf_quiz_short`", $conn) or die('Could not get data: ' . mysql_error());
    $row_cat = mysql_fetch_array($retval_cat, MYSQL_ASSOC);
    $questions_num = $row_cat['COUNT(*)'] - 1;
    $retval_cat = mysql_query("SELECT `data` FROM `qctf_quiz_short` WHERE `id`={$id}", $conn) or die('Could not get data: ' . mysql_error());
    $row_cat = mysql_fetch_array($retval_cat, MYSQL_ASSOC);
    $list = json_decode($row_cat['data']);
    $answer = $list->{'Answer'};
    $answers = $list->{'Answers_List'};
    if (isset($_GET['answer'])) {
        if ($_GET['answer'] == $answers[$answer]) {
            $_SESSION['step']++;
            $id++;
        } else {
            $_SESSION['step'] = 1;
            $id = 1; 
        }
        $retval_cat = mysql_query("SELECT `data` FROM `qctf_quiz_short` WHERE `id`={$id}", $conn) or die('Could not get data: ' . mysql_error());
        $row_cat = mysql_fetch_array($retval_cat, MYSQL_ASSOC);
        $list = json_decode($row_cat['data']);
    }
    
    $question = $list->{'Question'};
    $answers = $list->{'Answers_List'};
    shuffle($answers);
    
    echo "<!-- {$question} -->";
?>

<html>
  <head>
        <meta charset="utf-8" />
        <link type="text/css" rel="stylesheet" media="all" href="style/style.css" />
        <link type="text/css" rel="stylesheet" media="all" href="//juicy-media.ru/elective/style/animate.min.css" />
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="//juicy-media.ru/elective/scripts/wow.min.js"></script>
        <script>
            new WOW().init();
        </script>
    </head>
    <body>
        <div class="block-answer wow ToTop">
            <form action="index.php" method="post">
                <div class="header"><?php echo ($id == $questions_num + 1 ? '' : $id . ' / ' . $questions_num . '. ') . $question; ?></div>
                <?php
                    for ($i = 0; $i < count($answers); $i++) {
                        $val = htmlspecialchars($answers[$i]);
                        $val_uenc = urlencode($answers[$i]);
                        echo "<a href=\"./index.php?answer={$val_uenc}\"><div class=\"line\"><div class=\"mark\"><input type=\"radio\" name=\"answer\" value=\"{$val}\"></div><div class=\"title\"><label>{$answers[$i]}</label></div></div></a>";
                    }
                ?>
            </form>
        </div>
    </body>
    
    <script>
        $(".line").click(function() {
            $(this).find('input:radio')[0].checked = true;    
        });
    </script>
    
</html>
