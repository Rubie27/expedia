<?php
require_once 'flightclasses.php';

$flightclasses = new flightclasses();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $classid   = $_POST['classid'] ?? 0;
    $classname = $_POST['classname'] ?? '';

    echo json_encode($flightclasses->saveflightclass($classid, $classname));
}

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    echo $flightclasses->getflightclass();
}

if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {
    parse_str(file_get_contents("php://input"), $_DELETE);
    $classid = $_DELETE['classid'] ?? 0;

    echo json_encode($flightclasses->deleteflightclass($classid));
}
?>
f