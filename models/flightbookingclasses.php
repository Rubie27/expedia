<?php
    require_once 'db.php';

    class flightbookingclasses extends db {

        function saveflightbookingclasses($flightbookingclassid, $bookingclassid, $noofseats, $unitprice, $currencyid) {
            $sql = "CALL `sp_saveflightbookingclasses`({$flightbookingclassid}, {$bookingclassid}, {$noofseats}, {$unitprice}, {$currencyid})";
            $this->getData($sql);
            return ["status"=>"success", "message"=>"Flight booking class stored successfully"];
        }

        function getflightbookingclasses() {
            $sql = "CALL `sp_getflightbookingclasses`()";
            return $this->getJSON($sql);
        }

        function deleteflightbookingclasses($flightbookingclassid) {
            $sql = "CALL `sp_deleteflightbookingclasses`({$flightbookingclassid})";
            $this->getData($sql);
            return ["status"=>"success", "message"=>"Flight booking class deleted successfully"];
        }
    }
?>