<?php
    require_once 'db.php';

    class traveldocs extends db {

        function savetraveldocs($documentid, $documentname, $documentexpires) {
            $sql = "CALL `sp_savetraveldocs`({$documentid}, '{$documentname}', '{$documentexpires}')";
            $this->getData($sql);
            return ["status"=>"success", "message"=>"Travel document stored successfully"];
        }

        function gettraveldocs() {
            $sql = "CALL `sp_gettraveldocs`()";
            return $this->getJSON($sql);
        }

        function deletetraveldocs($documentid) {
            $sql = "CALL `sp_deletetraveldocs`({$documentid})";
            $this->getData($sql);
            return ["status"=>"success", "message"=>"Travel document deleted successfully"];
        }
    }
?>