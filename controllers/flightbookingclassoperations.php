<?php
require_once '../models/flightbookingclass.php';

$fbc = new flightbookingclass();

if(isset($_POST['saveflightbookingclass'])){
    $fbclassid = $_POST['fbclassid'];
    $classid = $_POST['classid'];
    $noofseats = $_POST['noofseats'];
    $unitprice = $_POST['unitprice'];
    $currencyid = $_POST['currencyid'];

    $response = $fbc->saveflightbookingclass($fbclassid, $classid, $noofseats, $unitprice, $currencyid);
    echo json_encode($response);
}

if(isset($_GET['getflightbookingclass'])){
    $response = $fbc->getflightbookingclass();
    echo $response;
}

if(isset($_POST['deleteflightbookingclass'])){
    $fbclassid = $_POST['fbclassid'];
    $response = $fbc->deleteflightbookingclass($fbclassid);
    echo json_encode($response);
}
?>
