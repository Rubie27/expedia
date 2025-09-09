<?php
require_once 'flightbookingclass.php';

$flightbookingclass = new flightbookingclass();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $fbcid    = $_POST['fbcid'] ?? 0;
    $classid  = $_POST['classid'] ?? 0;
    $bookingid= $_POST['bookingid'] ?? 0;

    echo json_encode($flightbookingclass->saveflightbookingclass($fbcid, $classid, $bookingid));
}

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    echo $flightbookingclass->getflightbookingclass();
}

if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {
    parse_str(file_get_contents("php://input"), $_DELETE);
    $fbcid = $_DELETE['fbcid'] ?? 0;

    echo json_encode($flightbookingclass->deleteflightbookingclass($fbcid));
}
?>
