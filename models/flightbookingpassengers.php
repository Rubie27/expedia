<?php
    require_once 'db.php';

    class flightbookingpassengers extends db {

        function saveflightbookingpassengers($passengerbookingid, $bookingclassid, $documentid, $firstname, $secondname, $surname, $gender, $DoB) {
            $sql = "CALL `sp_saveflightbookingpassengers`({$passengerbookingid}, {$bookingclassid}, {$documentid}, '{$firstname}', '{$secondname}', '{$surname}', '{$gender}', '{$DoB}')";
            $this->getData($sql);
            return ["status"=>"success", "message"=>"Flight booking passenger stored successfully"];
        }

        function getflightbookingpassengers() {
            $sql = "CALL `sp_getflightbookingpassengers`()";
            return $this->getJSON($sql);
        }

        function deleteflightbookingpassengers($passengerbookingid) {
            $sql = "CALL `sp_deleteflightbookingpassengers`({$passengerbookingid})";
            $this->getData($sql);
            return ["status"=>"success", "message"=>"Flight booking passenger deleted successfully"];
        }
    }
?>