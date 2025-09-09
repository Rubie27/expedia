<?php
require_once '../models/bookingtype.php';

$bt = new bookingtype();

if(isset($_POST['savebookingtype'])){
    $typeid = $_POST['typeid'];
    $typename = $_POST['typename'];

    $response = $bt->savebookingtype($typeid, $typename);
    echo json_encode($response);
}

if(isset($_GET['getbookingtype'])){
    $response = $bt->getbookingtype();
    echo $response;
}

if(isset($_POST['deletebookingtype'])){
    $typeid = $_POST['typeid'];
    $response = $bt->deletebookingtype($typeid);
    echo json_encode($response);
}
?>
