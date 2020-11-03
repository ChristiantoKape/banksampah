<?php

    if(isset($_POST['norek']) && isset($_POST['password'])) {

        include 'conn.php';
        
    	$norek= $_POST['norek'];
        $password= $_POST['password'];
        // $nama = $_POST['nama'];
        // $alamat = $_POST['alamat'];
        // $notel = $_POST['notel'];
        // $status = $_POST['status'];

        $datauser= array();

        $query= mysqli_query($connect, "SELECT * FROM tb_users where norek='".$norek."' and password='".$password."'");
        
        while($rowdatauser= mysqli_fetch_array($query)){
            $datauser[]= $rowdatauser;
        }

        // header('Content-type : application/json');
        echo json_encode($datauser, JSON_PRETTY_PRINT);
    }
?>