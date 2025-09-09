<?php
require_once 'flightbookingpassenger.php';

$flightbookingpassenger = new flightbookingpassenger();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $fbpid       = $_POST['fbpid'] ?? 0;
    $bookingid   = $_POST['bookingid'] ?? 0;
    $passengerid = $_POST['passengerid'] ?? 0;

    echo json_encode($flightbookingpassenger->saveflightbookingpassenger($fbpid, $bookingid, $passengerid));
}

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    echo $flightbookingpassenger->getflightbookingpassenger();
}

if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {
    parse_str(file_get_contents("php://input"), $_DELETE);
    $fbpid = $_DELETE['fbpid'] ?? 0;

    echo json_encode($flightbookingpassenger->deleteflightbookingpassenger($fbpid));
}
?>
