<?php
require_once '../models/bookingclass.php';

$bc = new bookingclass();

if(isset($_POST['savebookingclass'])){
    $classid = $_POST['classid'];
    $classname = $_POST['classname'];

    $response = $bc->savebookingclass($classid, $classname);
    echo json_encode($response);
}

if(isset($_GET['getbookingclass'])){
    $response = $bc->getbookingclass();
    echo $response;
}

if(isset($_POST['deletebookingclass'])){
    $classid = $_POST['classid'];
    $response = $bc->deletebookingclass($classid);
    echo json_encode($response);
}
?>
