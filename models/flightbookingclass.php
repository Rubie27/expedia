<?php
require_once 'db.php';

class flightbookingclass extends db {

    function saveflightbookingclass($fbclassid, $classid, $noofseats, $unitprice, $currencyid){
        $sql = "CALL sp_saveflightbookingclass({$fbclassid}, {$classid}, {$noofseats}, {$unitprice}, {$currencyid})";
        $this->getData($sql);
        return ["status" => "success", "message" => "Flight booking class saved successfully."];
    }

    function getflightbookingclass(){
        $sql = "CALL sp_getflightbookingclass()";
        return $this->getJSON($sql);
    }

    function deleteflightbookingclass($fbclassid){
        $sql = "CALL sp_deleteflightbookingclass({$fbclassid})";
        $this->getData($sql);
        return ["status" => "success", "message" => "Flight booking class deleted successfully."];
    }
}
?>
