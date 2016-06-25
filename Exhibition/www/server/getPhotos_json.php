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
$json = file_get_contents("php://input");
$data = json_decode($json, true);
$data1=array();
$jsonresponse=array();
$exhibitionId=$data['exhibition'][0]['exhibitionId'];
$response=array();


//select album title and cover link 
@$selectAlbumsQuery="SELECT e.name, m.id, m.albumTitle, m.description, z.link
FROM exhibition e, exhibitionAlbum m, exhibitionBannerMedia v, media z
WHERE e.id = m.exhibitionId
AND m.id = v.id
AND v.mediaId = z.id
AND m.exhibitionId ='$exhibitionId'";
@$selectAlbums=mysql_query($selectAlbumsQuery,$conn) or die(mysql_error());
@$albumRows=mysql_num_rows($selectAlbums);

while($albums=mysql_fetch_array($selectAlbums))
{
		$exhibitionName=$albums['name'];
		$id=$albums['id'];
		$albumTitle=$albums['albumTitle'];
		$description=$albums['description'];
		$link=$albums['link'];
		
		
		$response['exhibitionName'] = $exhibitionName;
		$response['id'] = $id;
		$response['albumTitle']=$albumTitle;
		$response['description']=$description;
		$response['link']= $link;
		
		array_push($data1,$response);	
} 

  $json= json_encode($data,JSON_NUMERIC_CHECK);     
	deliver_response(200,"albums","albumsInformation",$data1);

?>