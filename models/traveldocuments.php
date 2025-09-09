<?php
require_once 'db.php';

class traveldocuments extends db {

    function savetraveldocument($documentid, $documentname, $documentexpires){
        $sql = "CALL sp_savetraveldocument({$documentid}, '{$documentname}', '{$documentexpires}')";
        $this->getData($sql);
        return ["status" => "success", "message" => "Travel document saved successfully."];
    }

    function gettraveldocument(){
        $sql = "CALL sp_gettraveldocument()";
        return $this->getJSON($sql);
    }

    function deletetraveldocument($documentid){
        $sql = "CALL sp_deletetraveldocument({$documentid})";
        $this->getData($sql);
        return ["status" => "success", "message" => "Travel document deleted successfully."];
    }
}
?>
