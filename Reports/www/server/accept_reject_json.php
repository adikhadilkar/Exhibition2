<?php
header('Access-Control-Allow-Origin: *');
include 'config.php';
date_default_timezone_set("Asia/Kolkata");
//$cars = array();
$cars =@$_POST['type'];
$createdOn=date('Y-m-d h:i:s', time());
//$arrlength = count($cars);

//$devID=$cars[$x];	
	

	$updateQuery="UPDATE doctormobilenumber SET flag=1,statusDate='$createdOn' where doctorId='$cars'";
	$updateRun=mysql_query($updateQuery,$conn);

?>