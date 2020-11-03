<?php
    // if(isset($_POST['norek'])) {

        include 'conn.php';
        
        $norek=isset($_GET['norek'])?$_GET['norek']:'';

        $query= mysqli_query($connect,"Select t1.norek, t1.tanggal, t1.setor, t1.tarik, t1.berat, t1.jenis,
                                        case when t1.norek<>t2.norek then @saldo:=setor-tarik 
                                        else @saldo:=@saldo+setor-tarik end saldo 
                                    FROM( 
                                        select norek, tanggal, setor, tarik, berat, jenis, @baris1:=@baris1+1 baris 
                                        FROM tb_tabungan, (SELECT @baris1 :=0) tx 
                                        order by norek 
                                    ) t1 
                                    LEFT JOIN ( 
                                        SELECT norek, @baris2:=@baris2+1 baris 
                                        from tb_tabungan, (select @baris2 := 1) tx 
                                        order by norek 
                                    ) t2 on t1.baris=t2.baris 
                                    JOIN ( 
                                        SELECT @saldo:=0 
                                    ) t3 
                                    where t1.norek='".$norek."'");
        
        while($rowdatauser= mysqli_fetch_array($query)){
            $datauser[]= $rowdatauser;
        }

        // header('Content-type : application/json');
        echo json_encode($datauser, JSON_PRETTY_PRINT);
?>