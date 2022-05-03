
<?php include ("Personnage.php");
highlight_file(__FILE__);

try {
    // ---------------Connexion à la BDD et récupération et traitement du formulaire
    $pdo = new PDO('mysql:host=192.168.65.193;dbname=Combat', 'UserWeb', 'UserWeb');
} catch (Exception  $error) {
    $error->getMessage();
}

?>

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
    <h1> CRUD De Personnage </h1>
    <h2>(SQL Update) </h2>
    <h3>Choix du perso à modifier</h3>

    <?php
    $Perso1 = new Personnage(null,null,null,null,$pdo,null);
    //Traitetement du formulaire du choix du perso
    if(isset($_GET['btnModifier'])){
        $Perso1->getPersonnageById($_GET['idCombatant']);
    }

    if(isset($_POST['btnConfirmerUpdate'])){
            $Perso1 = new Personnage(
                $_POST['idCombatant'], //viens du champ input type hidden
                $_POST['pseudo'],
                $_POST['vie'],
                $_POST['forceAttaque'],
                $pdo,
                $_POST['image']);
            $Perso1->saveInBdd(); //voir la méthode saveInBdd dans l'objet Personnage
    }

    //--------------------Choix Perso-------------
    $tabPersonnage = $Perso1->getAllPersonnage();
    ?>
    <form action="" method="get">
        <select id="idCombatant" name="idCombatant">
            <?php
            foreach ($tabPersonnage as  $ThePerso) {
                echo '<option value="'.$ThePerso->getId().'">'.$ThePerso->getPseudo().'</option>';
            }
            ?>
        </select>
        <input type="submit" value="Choix du Perso" name="btnModifier">
    </form>

    <?php
    //Formulaire HTML de modification -------------------------------------
    //je dois avoir $id,$pseudo,$vie,$forceAttaque,$pdo,$image
    // id sera caché car il est utilisé pour la condition where de l'update
    ?>

    <form action="" method="post" >
    
        <label for="pseudo">Pseudo: </label>
        <input type="text" name="pseudo" id="pseudo" required value="<?php echo $Perso1->getPseudo(); ?>">

        <label for="vie">Vie: </label>
        <input type="text" name="vie" id="vie" required value="<?php echo $Perso1->getVie(); ?>">

        <label for="forceAttaque">Attaques: </label>
        <input type="text" name="forceAttaque" id="forceAttaque" value="<?php echo $Perso1->getForceAttaque(); ?>" required>
    
        <label for="image">Lien Image: </label>
        <input type="text" name="image" id="image" required value="<?php echo $Perso1->getImage(); ?>">
    
        <input type="Hidden" name="idCombatant" id="idCombatant" required value="<?php echo $Perso1->getId(); ?>">
        <input type="submit" name="btnConfirmerUpdate" value="Confirmer l'Update">
    
    </form>


    <?php 
    echo "<ul>";
    foreach ($tabPersonnage as $Perso) {
        echo "<li>";
        echo $Perso->getPseudo();
        echo '<img width="100px" src="'.$Perso->getImage().'" alt="'.$Perso->getPseudo().'">';
        echo "</li>";
    }
    echo "</ul>";
    ?>
  

</body>
</html>