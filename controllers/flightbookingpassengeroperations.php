<?php
require_once '../models/flightbookingpassenger.php';

$fbp = new flightbookingpassenger();

if(isset($_POST['saveflightbookingpassenger'])){
    $passengerid = $_POST['passengerid'];
    $bookingclassid = $_POST['bookingclassid'];
    $documentid = $_POST['documentid'];
    $firstname = $_POST['firstname'];
    $secondname = $_POST['secondname'];
    $surname = $_POST['surname'];
    $gender = $_POST['gender'];
    $dob = $_POST['dob'];

    $response = $fbp->saveflightbookingpassenger($passengerid, $bookingclassid, $documentid, $firstname, $secondname, $surname, $gender, $dob);
    echo json_encode($response);
}

if(isset($_GET['getflightbookingpassenger'])){
    $response = $fbp->getflightbookingpassenger();
    echo $response;
}

if(isset($_POST['deleteflightbookingpassenger'])){
    $passengerid = $_POST['passengerid'];
    $response = $fbp->deleteflightbookingpassenger($passengerid);
    echo json_encode($response);
}
?>
