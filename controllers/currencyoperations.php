<?php
require_once 'currency.php';

$currency = new currency();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $currencyid   = $_POST['currencyid'] ?? 0;
    $currencyname = $_POST['currencyname'] ?? '';

    echo json_encode($currency->savecurrency($currencyid, $currencyname));
}

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    echo $currency->getcurrency();
}

if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {
    parse_str(file_get_contents("php://input"), $_DELETE);
    $currencyid = $_DELETE['currencyid'] ?? 0;

    echo json_encode($currency->deletecurrency($currencyid));
}
?>
