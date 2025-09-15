<?php
    require_once 'db.php';

    class airports extends db {

        function saveairport($airportid, $airportcode, $airportname, $cityid) {
            $sql = "CALL `sp_saveairport`({$airportid}, '{$airportcode}', '{$airportname}', {$cityid})";
            $this->getdata($sql);
            return ["status"=>"success", "message"=>"Airport stored successfully"];
        }

        function getairports() {
            $sql = "CALL `sp_getairports`()";
            return $this->getJSON($sql);
        }

        function deleteairport($airportid) {
            $sql = "CALL `sp_deleteairport`({$airportid})";
            $this->getdata($sql);
            return ["status"=>"success", "message"=>"Airport deleted successfully"];
        }
    }
?>