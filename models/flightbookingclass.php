<?php
require_once 'db.php';

class flightbookingclass extends db {
    function saveflightbookingclass($bookingclassid, $bookingid, $classid){
        $sql = "CALL sp_saveflightbookingclass({$bookingclassid}, {$bookingid}, {$classid})";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'Flight booking class saved successfully.'
        ];
    }

    function getflightbookingclass(){
        $sql = "CALL sp_getflightbookingclass()";
        return $this->getJSON($sql);
    }

    function deleteflightbookingclass($bookingclassid){
        $sql = "CALL sp_deleteflightbookingclass({$bookingclassid})";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'Flight booking class deleted successfully.'
        ];
    }
}
?>
