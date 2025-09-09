<?php
require_once 'bookingtype.php';

$bookingtype = new bookingtype();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $bookingtypeid = $_POST['bookingtypeid'] ?? 0;
    $typename = $_POST['typename'] ?? '';

    echo json_encode($bookingtype->savebookingtype($bookingtypeid, $typename));
}

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    echo $bookingtype->getbookingtype();
}

if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {
    parse_str(file_get_contents("php://input"), $_DELETE);
    $bookingtypeid = $_DELETE['bookingtypeid'] ?? 0;

    echo json_encode($bookingtype->deletebookingtype($bookingtypeid));
}
?>
