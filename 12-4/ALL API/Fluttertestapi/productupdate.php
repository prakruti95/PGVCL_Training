<?php
 include('connect.php');

 $id = $_POST['id'];
 $product_name= $_POST['product_name'];
 $product_price= $_POST['product_price'];
 $product_description= $_POST['product_description'];



$Sql_Query = "UPDATE products SET product_name='$product_name' ,product_price='$product_price',product_description='$product_description' WHERE id = '$id'";

 if(mysqli_query($con,$Sql_Query))
{
 echo 'Record Updated Successfully';
}
else
{
 echo 'Something went wrong';
 }

 mysqli_close($con);
?>