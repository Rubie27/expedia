<?php
require_once 'db.php';

class flightbookingpassenger extends db {

    function saveflightbookingpassenger($passengerid, $bookingclassid, $documentid, $firstname, $secondname, $surname, $gender, $dob){
        $sql = "CALL sp_saveflightbookingpassenger({$passengerid}, {$bookingclassid}, {$documentid}, '{$firstname}', '{$secondname}', '{$surname}', '{$gender}', '{$dob}')";
        $this->getData($sql);
        return ["status" => "success", "message" => "Passenger saved successfully."];
    }

    function getflightbookingpassenger(){
        $sql = "CALL sp_getflightbookingpassenger()";
        return $this->getJSON($sql);
    }

    function deleteflightbookingpassenger($passengerid){
        $sql = "CALL sp_deleteflightbookingpassenger({$passengerid})";
        $this->getData($sql);
        return ["status" => "success", "message" => "Passenger deleted successfully."];
    }
}
?>
