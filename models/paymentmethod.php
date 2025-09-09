<?php
require_once 'db.php';

class paymentmethod extends db {

    function savepaymentmethod($methodid, $methodname){
        $sql = "CALL sp_savepaymentmethod({$methodid}, '{$methodname}')";
        $this->getData($sql);
        return ["status" => "success", "message" => "Payment method saved successfully."];
    }

    function getpaymentmethod(){
        $sql = "CALL sp_getpaymentmethod()";
        return $this->getJSON($sql);
    }

    function deletepaymentmethod($methodid){
        $sql = "CALL sp_deletepaymentmethod({$methodid})";
        $this->getData($sql);
        return ["status" => "success", "message" => "Payment method deleted successfully."];
    }
}
?>
