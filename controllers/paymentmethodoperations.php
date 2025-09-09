<?php
require_once 'paymentmethod.php';

$paymentmethod = new paymentmethod();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $paymentmethodid   = $_POST['paymentmethodid'] ?? 0;
    $paymentmethodname = $_POST['paymentmethodname'] ?? '';

    echo json_encode($paymentmethod->savepaymentmethod($paymentmethodid, $paymentmethodname));
}

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    echo $paymentmethod->getpaymentmethod();
}

if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {
    parse_str(file_get_contents("php://input"), $_DELETE);
    $paymentmethodid = $_DELETE['paymentmethodid'] ?? 0;

    echo json_encode($paymentmethod->deletepaymentmethod($paymentmethodid));
}
?>

