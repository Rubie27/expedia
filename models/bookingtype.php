<?php
require_once 'db.php';

class bookingtype extends db {

    function savebookingtype($typeid, $typename){
        $sql = "CALL sp_savebookingtype({$typeid}, '{$typename}')";
        $this->getData($sql);
        return ["status" => "success", "message" => "Booking type saved successfully."];
    }

    function getbookingtype(){
        $sql = "CALL sp_getbookingtype()";
        return $this->getJSON($sql);
    }

    function deletebookingtype($typeid){
        $sql = "CALL sp_deletebookingtype({$typeid})";
        $this->getData($sql);
        return ["status" => "success", "message" => "Booking type deleted successfully."];
    }
}
?>
