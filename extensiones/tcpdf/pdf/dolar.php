<?php
    class Conexion2 {
        static public function conectar(){
            $link = new PDO("mysql:host=localhost;dbname=pos",
                            "root",
                            "");

            $link->exec("set names utf8");

            return $link;
        }

    }

    function readDolarPrice() {
        $stmt = Conexion2::conectar()->prepare("SELECT * FROM dolar_today ORDER BY marca_tiempo DESC LIMIT 1");
        $stmt -> execute();

        $result = $stmt->fetchAll();
        $result = $result[0];

        echo $result['dolar_sicad2'];
    }

    function dolarIsSaved($timestamp) {
        $stmt = Conexion2::conectar()->prepare("SELECT * FROM dolar_today WHERE marca_tiempo=$timestamp");
        $stmt -> execute();

        $result = $stmt->fetchAll();
        if ($stmt->rowCount() == 0)
            return 0;
        else
            return 1;
    }

    function saveDolarPrice() {
        $url = "https://s3.amazonaws.com/dolartoday/data.json";

        $ch = curl_init();

        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_URL,$url);

        $result = curl_exec($ch);

        curl_close($ch);

        $response = json_decode($result, true);
        $dolar_transfer = $response['USD']['transferencia']. '<br>';
        $dolar_sicad2 = $response['USD']['sicad2']. '<br>';
        $timestamp = $response['_timestamp']['epoch'];

        if (dolarIsSaved($timestamp) == 0) {

            $datetime = date('Y-m-d H:i:s', $timestamp);

            $stmt = Conexion2::conectar()->prepare("INSERT INTO dolar_today(dolar_sicad2, dolar_transferencia, marca_tiempo) VALUES (:dolar_sicad2, :dolar_transferencia, :marca_tiempo)");

            $stmt->bindParam(":dolar_sicad2", $dolar_sicad2, PDO::PARAM_STR);
            $stmt->bindParam(":dolar_transferencia", $dolar_transfer, PDO::PARAM_STR);
            $stmt->bindParam(":marca_tiempo", intval($timestamp), PDO::PARAM_INT);

            try {
                $stmt->execute();
            }
            catch(Exception $e) {
                echo "Error: ". $e. "<br>";
            }

            $stmt = null;
        } else {
            echo "Dolar ya esta guardado";
        }
    }
?>