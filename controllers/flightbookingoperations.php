<?php
require_once '../models/flightbooking.php';

$fb = new flightbooking();

if(isset($_POST['saveflightbooking'])){
    $bookingid = $_POST['bookingid'];
    $flightid = $_POST['flightid'];
    $bookingdate = $_POST['bookingdate'];
    $bookingtypeid = $_POST['bookingtypeid'];
    $currencyid = $_POST['currencyid'];

    $response = $fb->saveflightbooking($bookingid, $flightid, $bookingdate, $bookingtypeid, $currencyid);
    echo json_encode($response);
}

if(isset($_GET['getflightbooking'])){
    $response = $fb->getflightbooking();
    echo $response;
}

if(isset($_POST['deleteflightbooking'])){
    $bookingid = $_POST['bookingid'];
    $response = $fb->deleteflightbooking($bookingid);
    echo json_encode($response);
}
?>
