<?php

    if(isset($_POST['norek'])) {

        include 'conn.php';
        
    	$norek = $_POST['norek'];
        $tanggal = $_POST['tanggal'];
        $setor = $_POST['setor'];
        $tarik = $_POST['tarik'];
        $berat = $_POST['berat'];
        $jenis = $_POST['jenis'];

        $query = mysqli_query($connect, "INSERT INTO tb_tabungan (norek,tanggal,setor,tarik,berat,jenis) VALUES ('$norek','$tanggal','0','$tarik','0','0')");
        
        if($query){
            $json= array("response" => "berhasil", "status" => 0, "message" => "Submitted");
        } else {
            $json= array("response" => "gagal", "status"=> 1,"message" => "Err");

        }

        // header('Content-type : application/json');
        echo json_encode($json);
    }
?>