<?php
require_once 'db.php';

class flightbooking extends db {
    function saveflightbooking($bookingid, $flightid, $bookingtypeid, $bookingclassid, $currencyid, $totalamount){
        $sql = "CALL sp_saveflightbooking({$bookingid}, {$flightid}, {$bookingtypeid}, {$bookingclassid}, {$currencyid}, {$totalamount})";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'Flight booking saved successfully.'
        ];
    }

    function getflightbooking(){
        $sql = "CALL sp_getflightbooking()";
        return $this->getJSON($sql);
    }

    function deleteflightbooking($bookingid){
        $sql = "CALL sp_deleteflightbooking({$bookingid})";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'Flight booking deleted successfully.'
        ];
    }
}
?>
