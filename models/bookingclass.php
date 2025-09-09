<?php
require_once 'db.php';

class bookingclass extends db {

    function savebookingclass($classid, $classname){
        $sql = "CALL sp_savebookingclass({$classid}, '{$classname}')";
        $this->getData($sql);
        return ["status" => "success", "message" => "Booking class saved successfully."];
    }

    function getbookingclass(){
        $sql = "CALL sp_getbookingclass()";
        return $this->getJSON($sql);
    }

    function deletebookingclass($classid){
        $sql = "CALL sp_deletebookingclass({$classid})";
        $this->getData($sql);
        return ["status" => "success", "message" => "Booking class deleted successfully."];
    }
}
?>
