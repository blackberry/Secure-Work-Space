<?php

$data = '{}'; // json string

if(array_key_exists('callback', $_GET)){

    header('Content-Type: text/javascript; charset=utf8');
    header('Access-Control-Allow-Origin: http://www.example.com/');
    header('Access-Control-Max-Age: 3628800');
    header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
    $callback = $_GET['callback'];
    $data = file_get_contents("ecl.json");
    echo $callback.'('.$data.');';

}else{
    // normal JSON string
    header('Content-Type: application/json; charset=utf8');

    echo $data;
}

?>
