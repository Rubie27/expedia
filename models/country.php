<?php
require_once 'country.php';

$country = new country();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $countryid   = $_POST['countryid'] ?? 0;
    $countryname = $_POST['countryname'] ?? '';

    echo json_encode($country->savecountry($countryid, $countryname));
}

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    echo $country->getcountry();
}

if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {
    parse_str(file_get_contents("php://input"), $_DELETE);
    $countryid = $_DELETE['countryid'] ?? 0;

    echo json_encode($country->deletecountry($countryid));
}
?>
