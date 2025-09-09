<?php
require_once 'db.php';

class bookingtype extends db {
    function savebookingtype($bookingtypeid, $typename){
        $sql = "CALL sp_savebookingtype({$bookingtypeid}, '{$typename}')";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'Booking Type saved successfully.'
        ];
    }

    function getbookingtype(){
        $sql = "CALL sp_getbookingtype()";
        return $this->getJSON($sql);
    }

    function deletebookingtype($bookingtypeid){
        $sql = "CALL sp_deletebookingtype({$bookingtypeid})";
        $this->getData($sql);
        return [
            'status' => 'success',
            'message' => 'Booking Type deleted successfully.'
        ];
    }
}
?>
