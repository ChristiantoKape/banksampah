<?php

    if(isset($_POST['norek']) && isset($_POST['password'])) {

        include 'conn.php';
        
    	$norek = $_POST['norek'];
        $password = $_POST['password'];
        // $nama = $_POST['nama'];
        // $alamat = $_POST['alamat'];
        // $notel = $_POST['notel'];
        // $status = $_POST['status'];

        $query = mysqli_query($connect, "update tb_users set password='".$password."' where norek='".$norek."'");
        
        if($query){
            $json= array("response" => "berhasil", "status" => 0, "message" => "Submitted");
        } else {
            $json= array("response" => "gagal", "status"=> 1,"message" => "Err");

        }

        // header('Content-type : application/json');
        echo json_encode($json);
    }
?>