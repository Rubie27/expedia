
<?php
require_once("db.php");

class flight extends db {

    function saveflight($flightid, $airlineid, $fromcityid, $tocityid, $departure, $arrival) {
        $sql = "CALL sp_saveflight({$flightid}, {$airlineid}, {$fromcityid}, {$tocityid}, '{$departure}', '{$arrival}')";
        $this->getData($sql);
        return ["status" => "success", "message" => "Flight saved successfully"];
    }

    function getflight($flightid = null) {
        if ($flightid) {
            $sql = "CALL sp_getflight({$flightid})";
        } else {
            $sql = "CALL sp_getflight(NULL)";
        }
        return $this->getJSON($sql);
    }

    function deleteflight($flightid) {
        $sql = "CALL sp_deleteflight({$flightid})";
        $this->getData($sql);
        return ["status" => "success", "message" => "Flight deleted successfully"];
    }
}
?>
