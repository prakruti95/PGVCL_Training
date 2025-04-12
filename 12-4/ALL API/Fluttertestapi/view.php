<?php
  
  include('connect.php');
  
  $sql ="select * from test8";
  $response= array(); 
  $r = mysqli_query($con,$sql);
  
  while($row = mysqli_fetch_array($r))
  {
    $value["id"] = $row["id"];
    $value["name"] = $row["name"];
    $value["surname"] = $row["surname"];
    $value["email"] = $row["email"];
    $value["password"] = $row["password"];
    
    
    array_push($response,$value);
  }
  
  echo json_encode($response);
  
  

?>