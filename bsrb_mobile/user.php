<?php

    // if(isset($_POST['norek'])) {

        include 'conn.php';
        
    	// $norek= $_POST['norek'];
        // $password= $_POST['password'];
        // $nama = $_POST['nama'];
        // $alamat = $_POST['alamat'];
        // $notel = $_POST['notel'];
        // $status = $_POST['status'];

        // $datauser= array();

        $query= mysqli_query($connect,"SELECT * FROM tb_users WHERE status='user'");
        
        while($rowdatauser= mysqli_fetch_array($query)){
            $datauser[]= $rowdatauser;
        }

        // header('Content-type : application/json');
        echo json_encode($datauser, JSON_PRETTY_PRINT);
    // }


//     SELECT a.*, b.nama FROM `tb_tabungan` a
// LEFT JOIN tb_users b on a.norek = b.norek

        // $response = array();
        // $sql = mysqli_query($connect, "SELECT a.*, b.nama FROM `tb_tabungan` a
        // LEFT JOIN tb_users b on a.norek = b.norek"); 
?>