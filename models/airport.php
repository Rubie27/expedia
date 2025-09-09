<?php
require_once 'db.php';

class airport extends db {

    function saveairport($airportid, $airportname, $cityid){
        $sql = "CALL sp_saveairport({$airportid}, '{$airportname}', {$cityid})";
        $this->getData($sql);
        return ["status" => "success", "message" => "Airport saved successfully."];
    }

    function getairport(){
        $sql = "CALL sp_getairport()";
        return $this->getJSON($sql);
    }

    function deleteairport($airportid){
        $sql = "CALL sp_deleteairport({$airportid})";
        $this->getData($sql);
        return ["status" => "success", "message" => "Airport deleted successfully."];
    }
}
?>
