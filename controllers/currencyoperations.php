<?php
require_once '../models/currency.php';

$currency = new currency();

if(isset($_POST['savecurrency'])){
    $currencyid = $_POST['currencyid'];
    $currencyname = $_POST['currencyname'];
    $symbol = $_POST['symbol'];

    $response = $currency->savecurrency($currencyid, $currencyname, $symbol);
    echo json_encode($response);
}

if(isset($_GET['getcurrency'])){
    $response = $currency->getcurrency();
    echo $response;
}

if(isset($_POST['deletecurrency'])){
    $currencyid = $_POST['currencyid'];
    $response = $currency->deletecurrency($currencyid);
    echo json_encode($response);
}
?>
