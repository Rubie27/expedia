<?php
require_once 'db.php';

class flightclasses extends db {

    function saveflightclasses($flightclassid, $flightid, $bookingclassid, $noofseats, $unitprice, $currency){
        $sql = "CALL sp_saveflightclasses({$flightclassid}, {$flightid}, {$bookingclassid}, {$noofseats}, {$unitprice}, '{$currency}')";
        $this->getData($sql);
        return ["status" => "success", "message" => "Flight class saved successfully."];
    }

    function getflightclasses(){
        $sql = "CALL sp_getflightclasses()";
        return $this->getJSON($sql);
    }

    function deleteflightclasses($flightclassid){
        $sql = "CALL sp_deleteflightclasses({$flightclassid})";
        $this->getData($sql);
        return ["status" => "success", "message" => "Flight class deleted successfully."];
    }
}
?>
