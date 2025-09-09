<?php
require_once 'flightbooking.php';

$flightbooking = new flightbooking();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $bookingid  = $_POST['bookingid'] ?? 0;
    $flightid   = $_POST['flightid'] ?? 0;
    $passengerid= $_POST['passengerid'] ?? 0;

    echo json_encode($flightbooking->saveflightbooking($bookingid, $flightid, $passengerid));
}

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    echo $flightbooking->getflightbooking();
}

if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {
    parse_str(file_get_contents("php://input"), $_DELETE);
    $bookingid = $_DELETE['bookingid'] ?? 0;

    echo json_encode($flightbooking->deleteflightbooking($bookingid));
}
?>
