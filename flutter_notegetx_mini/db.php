<?php

$servername = "localhost"; 
$database = "flutter_notegetx_mini";
$username = "root";
$password = "";

$conn = mysqli_connect($servername, $username, $password, $database);

if(!$conn)
{
    die("Connection failed: " . mysqli_connect_error());
}
else 
{
    mysqli_set_charset($conn, "utf8");
}