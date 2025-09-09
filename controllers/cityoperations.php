<?php
require_once 'city.php';

$city = new city();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $cityid   = $_POST['cityid'] ?? 0;
    $cityname = $_POST['cityname'] ?? '';
    $countryid = $_POST['countryid'] ?? 0;

    echo json_encode($city->savecity($cityid, $cityname, $countryid));
}

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    echo $city->getcity();
}

if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {
    parse_str(file_get_contents("php://input"), $_DELETE);
    $cityid = $_DELETE['cityid'] ?? 0;

    echo json_encode($city->deletecity($cityid));
}
?>
