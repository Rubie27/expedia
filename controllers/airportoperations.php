<?php
require_once '../models/airport.php';

$airport = new airport();

if(isset($_POST['saveairport'])){
    $airportid = $_POST['airportid'];
    $airportname = $_POST['airportname'];
    $cityid = $_POST['cityid'];

    $response = $airport->saveairport($airportid, $airportname, $cityid);
    echo json_encode($response);
}

if(isset($_GET['getairport'])){
    $response = $airport->getairport();
    echo $response;
}

if(isset($_POST['deleteairport'])){
    $airportid = $_POST['airportid'];
    $response = $airport->deleteairport($airportid);
    echo json_encode($response);
}
?>
