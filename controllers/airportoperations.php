<?php
require_once 'airport.php';

$airport = new airport();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $airportid = $_POST['airportid'] ?? 0;
    $airportname = $_POST['airportname'] ?? '';
    $cityid = $_POST['cityid'] ?? 0;

    echo json_encode($airport->saveairport($airportid, $airportname, $cityid));
}

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    echo $airport->getairport();
}

if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {
    parse_str(file_get_contents("php://input"), $_DELETE);
    $airportid = $_DELETE['airportid'] ?? 0;

    echo json_encode($airport->deleteairport($airportid));
}
?>
