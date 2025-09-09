<?php
require_once 'flight.php';

$flight = new flight();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $flightid    = $_POST['flightid'] ?? 0;
    $airlineid   = $_POST['airlineid'] ?? 0;
    $fromcityid  = $_POST['fromcityid'] ?? 0;
    $tocityid    = $_POST['tocityid'] ?? 0;
    $departure   = $_POST['departure'] ?? '';
    $arrival     = $_POST['arrival'] ?? '';

    echo json_encode($flight->saveflight($flightid, $airlineid, $fromcityid, $tocityid, $departure, $arrival));
}

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    echo $flight->getflight();
}

if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {
    parse_str(file_get_contents("php://input"), $_DELETE);
    $flightid = $_DELETE['flightid'] ?? 0;

    echo json_encode($flight->deleteflight($flightid));
}
?>
