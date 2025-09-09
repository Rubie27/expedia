<?php
require_once 'airline.php';

$airline = new airline();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $airlineid = $_POST['airlineid'] ?? 0;
    $airlinename = $_POST['airlinename'] ?? '';

    echo json_encode($airline->saveairline($airlineid, $airlinename));
}

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    echo $airline->getairline();
}

if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {
    parse_str(file_get_contents("php://input"), $_DELETE);
    $airlineid = $_DELETE['airlineid'] ?? 0;

    echo json_encode($airline->deleteairline($airlineid));
}
?>
