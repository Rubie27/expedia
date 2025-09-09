<?php
require_once 'bookingclass.php';

$bookingclass = new bookingclass();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $bookingclassid = $_POST['bookingclassid'] ?? 0;
    $classname = $_POST['classname'] ?? '';

    echo json_encode($bookingclass->savebookingclass($bookingclassid, $classname));
}

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    echo $bookingclass->getbookingclass();
}

if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {
    parse_str(file_get_contents("php://input"), $_DELETE);
    $bookingclassid = $_DELETE['bookingclassid'] ?? 0;

    echo json_encode($bookingclass->deletebookingclass($bookingclassid));
}
?>
