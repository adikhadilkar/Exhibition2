<?php
header("Content-Type: text/html; charset=utf-8");
//Access Control Headers
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Credentials: true');
header('Access-Control-Allow-Headers: Content-Type');
//Include Files
include 'jsonFormat.php';
include 'jsonDeliver.php';
include 'config.php';
$data=array();
$response=array();

//select exhibition title and cover link 
@$selectExhibitionsQuery="SELECT m.id, m.name, m.logoMediaId, z.link
FROM exhibition m, media z
WHERE m.logoMediaId = z.id";
@$selectExhibitions=mysql_query($selectExhibitionsQuery,$conn) or die(mysql_error());
@$exhibitionRows=mysql_num_rows($selectExhibitions);

while($exhibition=mysql_fetch_array($selectExhibitions))
{
		$id=$exhibition['id'];
		$name=$exhibition['name'];
		$link=$exhibition['link'];
		
		$response['id'] = $id;
		$response['name']=$name;
		$response['link']= $link;
		
		array_push($data,$response);	
} 

  $json= json_encode($data,JSON_NUMERIC_CHECK);     
	deliver_response(200,"exhibitions","exhibitionsInformation",$data);

?>