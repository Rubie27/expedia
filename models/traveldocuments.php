<?php
require_once 'traveldoc.php';

$traveldoc = new traveldoc();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $traveldocid   = $_POST['traveldocid'] ?? 0;
    $docname       = $_POST['docname'] ?? '';

    echo json_encode($traveldoc->savetraveldoc($traveldocid, $docname));
}

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    echo $traveldoc->gettraveldoc();
}

if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {
    parse_str(file_get_contents("php://input"), $_DELETE);
    $traveldocid = $_DELETE['traveldocid'] ?? 0;

    echo json_encode($traveldoc->deletetraveldoc($traveldocid));
}
?>
