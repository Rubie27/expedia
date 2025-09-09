<?php
require_once '../models/traveldocuments.php';

$doc = new traveldocuments();

if(isset($_POST['savetraveldocument'])){
    $documentid = $_POST['documentid'];
    $documentname = $_POST['documentname'];
    $documentexpires = $_POST['documentexpires'];

    $response = $doc->savetraveldocument($documentid, $documentname, $documentexpires);
    echo json_encode($response);
}

if(isset($_GET['gettraveldocument'])){
    $response = $doc->gettraveldocument();
    echo $response;
}

if(isset($_POST['deletetraveldocument'])){
    $documentid = $_POST['documentid'];
    $response = $doc->deletetraveldocument($documentid);
    echo json_encode($response);
}
?>
