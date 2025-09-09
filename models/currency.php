<?php
require_once 'db.php';

class currency extends db {

    function savecurrency($currencyid, $currencyname, $symbol){
        $sql = "CALL sp_savecurrency({$currencyid}, '{$currencyname}', '{$symbol}')";
        $this->getData($sql);
        return ["status" => "success", "message" => "Currency saved successfully."];
    }

    function getcurrency(){
        $sql = "CALL sp_getcurrency()";
        return $this->getJSON($sql);
    }

    function deletecurrency($currencyid){
        $sql = "CALL sp_deletecurrency({$currencyid})";
        $this->getData($sql);
        return ["status" => "success", "message" => "Currency deleted successfully."];
    }
}
?>
