<?php
require_once 'db.php';

class bookingclass extends db {
    function savebookingclass($bookingclassid, $classname){
        $sql = "CALL sp_savebookingclass({$bookingclassid}, '{$classname}')";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'Booking Class saved successfully.'
        ];
    }

    function getbookingclass(){
        $sql = "CALL sp_getbookingclass()";
        return $this->getJSON($sql);
    }

    function deletebookingclass($bookingclassid){
        $sql = "CALL sp_deletebookingclass({$bookingclassid})";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'Booking Class deleted successfully.'
        ];
    }
}
?>
