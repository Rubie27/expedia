<?php
require_once '../models/flightclasses.php';

$fc = new flightclasses();

if(isset($_POST['saveflightclasses'])){
    $flightclassid = $_POST['flightclassid'];
    $flightid = $_POST['flightid'];
    $bookingclassid = $_POST['bookingclassid'];
    $noofseats = $_POST['noofseats'];
    $unitprice = $_POST['unitprice'];
    $currency = $_POST['currency'];

    $response = $fc->saveflightclasses($flightclassid, $flightid, $bookingclassid, $noofseats, $unitprice, $currency);
    echo json_encode($response);
}

if(isset($_GET['getflightclasses'])){
    $response = $fc->getflightclasses();
    echo $response;
}

if(isset($_POST['deleteflightclasses'])){
    $flightclassid = $_POST['flightclassid'];
    $response = $fc->deleteflightclasses($flightclassid);
    echo json_encode($response);
}
?>
