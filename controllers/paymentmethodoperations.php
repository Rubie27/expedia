<?php
require_once '../models/paymentmethod.php';

$payment = new paymentmethod();

if(isset($_POST['savepaymentmethod'])){
    $methodid = $_POST['methodid'];
    $methodname = $_POST['methodname'];

    $response = $payment->savepaymentmethod($methodid, $methodname);
    echo json_encode($response);
}

if(isset($_GET['getpaymentmethod'])){
    $response = $payment->getpaymentmethod();
    echo $response;
}

if(isset($_POST['deletepaymentmethod'])){
    $methodid = $_POST['methodid'];
    $response = $payment->deletepaymentmethod($methodid);
    echo json_encode($response);
}
?>
