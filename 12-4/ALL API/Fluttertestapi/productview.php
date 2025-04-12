<?php
  
  include('connect.php');
  
  $sql ="select * from products";
  $response= array(); 
  $r = mysqli_query($con,$sql);
  
  while($row = mysqli_fetch_array($r))
  {
    $value["id"] = $row["id"];
    $value["product_name"] = $row["product_name"];
    $value["product_price"] = $row["product_price"];
    $value["product_description"] = $row["product_description"];
    
    
    array_push($response,$value);
  }
  
  echo json_encode($response);
  
  

?>