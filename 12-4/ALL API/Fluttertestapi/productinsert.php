<?php

  include('connect.php');
  
  $pname = $_REQUEST["product_name"];
  $pprice = $_REQUEST["product_price"];
  $pdes = $_REQUEST["product_description"];
  
  if($pname=="" && $pprice=="" && $pdes=="")
  {
    echo '0';
  }
  else
  {
    $sql ="insert into products(product_name,product_price,product_description) values ('$pname','$pprice','$pdes')";
    mysqli_query($con,$sql);  
  
  }
  
  


?>
