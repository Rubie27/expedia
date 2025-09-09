<?php
require_once 'db.php';

class airline extends db {

    function saveairline($airlineid, $airlinename, $cityid){
        $sql = "CALL sp_saveairline({$airlineid}, '{$airlinename}', {$cityid})";
        $this->getData($sql);
        return ["status" => "success", "message" => "Airline saved successfully."];
    }

    function getairline(){
        $sql = "CALL sp_getairline()";
        return $this->getJSON($sql);
    }

    function deleteairline($airlineid){
        $sql = "CALL sp_deleteairline({$airlineid})";
        $this->getData($sql);
        return ["status" => "success", "message" => "Airline deleted successfully."];
    }
}
?>
