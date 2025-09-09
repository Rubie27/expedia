<?php
require_once '../models/airline.php';

$airline = new airline();

if(isset($_POST['saveairline'])){
    $airlineid = $_POST['airlineid'];
    $airlinename = $_POST['airlinename'];
    $cityid = $_POST['cityid'];

    $response = $airline->saveairline($airlineid, $airlinename, $cityid);
    echo json_encode($response);
}

if(isset($_GET['getairline'])){
    $response = $airline->getairline();
    echo $response;
}

if(isset($_POST['deleteairline'])){
    $airlineid = $_POST['airlineid'];
    $response = $airline->deleteairline($airlineid);
    echo json_encode($response);
}
?>
