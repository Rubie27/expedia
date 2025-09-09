<?php
require_once 'db.php';

class city extends db {
    function savecity($cityid, $cityname, $countryid){
        $sql = "CALL sp_savecity({$cityid}, '{$cityname}', {$countryid})";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'City saved successfully.'
        ];
    }

    function getcity(){
        $sql = "CALL sp_getcity()";
        return $this->getJSON($sql);
    }

    function deletecity($cityid){
        $sql = "CALL sp_deletecity({$cityid})";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'City deleted successfully.'
        ];
    }
}
?>
