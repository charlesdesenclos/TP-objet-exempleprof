
<?php include ("Personnage.php"); ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Exo1</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
    <script src='main.js'></script>
</head>
<body>
    <h1>Exo 3</h1>
    <?php
        $P1 = new Personnage("julien");
        $P2 = new Personnage("Alice");

        echo "la vie de ".$P1->getPseudo()." est  de : ".$P1->getVie()." pts de vie </br>";
        echo "la vie de ".$P2->getPseudo()." est  de : ".$P2->getVie()." pts de vie";
       
    ?>

</body>
</html>