<?php
require_once 'db.php';

class flightclasses extends db {
    function saveflightclass($classid, $classname){
        $sql = "CALL sp_saveflightclass({$classid}, '{$classname}')";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'Flight class saved successfully.'
        ];
    }

    function getflightclasses(){
        $sql = "CALL sp_getflightclasses()";
        return $this->getJSON($sql);
    }

    function deleteflightclass($classid){
        $sql = "CALL sp_deleteflightclass({$classid})";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'Flight class deleted successfully.'
        ];
    }
}
?>
