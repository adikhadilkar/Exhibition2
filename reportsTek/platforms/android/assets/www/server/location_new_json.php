<?php
//Access Control Headers
date_default_timezone_set("Asia/Kolkata");
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Credentials: true');
header('Access-Control-Allow-Headers: Content-Type');

//Include Files
include 'jsonFormat.php';
include 'jsonDeliver.php';
include 'config.php';

//Fetch and decode JSON
//$json = '{"location":[{"uuid":uuid,"latitude":lat,"longitude":lon}]}'; 
$json = file_get_contents("php://input");
$data = json_decode($json, true);
$jsonresponse =array();
$deviceId=$data['location'][0]['uuid'];
$latitude=$data['location'][0]['latitude'];
$longitude=$data['location'][0]['longitude'];
$createdOn=date('Y-m-d h:i:s', time());
$jsonresponse = array();
$data1 = array();
	//Insert new device Id in database
	if($deviceId=='' or $latitude=='' or $longitude =='')
	{
		deliver_response(203,"Missing Information","location",$jsonresponse);
	}
	else
	{
		/* //encrypted insert with variable
		$insertId="insert into demo(name) values(AES_ENCRYPT('$deviceId', 'usa2010'))";
		$resId=mysql_query($insertId,$conn)or die(mysql_error());  */

		//encrypted insert with text
		/* $insertId="insert into demo(name) values(DES_ENCRYPT('nice','3GFUQm5rDUyBcAn6'))";
		$resId=mysql_query($insertId,$conn)or die(mysql_error()); */
		
		
		$insertDeviceId="insert into serverlocation(locationId,deviceId,latitude,longitude,createdOn) values('','$deviceId','$latitude','$longitude','$createdOn')";
		$resDeviceId=mysql_query($insertDeviceId,$conn)or die(mysql_error());
		
		
		/* $selectQuery="SELECT(CONVERT( DES_DECRYPT(name,'3GFUQm5rDUyBcAn6') USING utf8)) AS name FROM demo"
		$selectData=mysql_query($selectQuery,$conn)or die(mysql_error());
		while($rows=mysql_fetch_array($selectData))
		{
			$jsonresponse[]=$rows['name'];
		}  */

		
		$jsonresponse=$deviceId; 
		json_encode($jsonresponse);
		deliver_response(200,"New Location created","location",$jsonresponse);

	}
			
	
?>