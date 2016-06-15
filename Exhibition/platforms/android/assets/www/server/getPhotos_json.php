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


//select album title and cover link 
@$selectAlbumsQuery="SELECT m.id, m.exhibitionId, m.albumTitle, m.description, v.id, v.exhibitionId, v.mediaId, z.link
FROM exhibitionAlbum m, exhibitionBannerMedia v, media z
WHERE m.exhibitionId = v.exhibitionId
AND v.mediaId = z.id";
@$selectAlbums=mysql_query($selectAlbumsQuery,$conn) or die(mysql_error());
@$albumRows=mysql_num_rows($selectAlbums);

while($albums=mysql_fetch_array($selectAlbums))
{
		$id=$albums['id'];
		$albumTitle=$albums['albumTitle'];
		$description=$albums['description'];
		$link=$albums['link'];
		
		$response['id'] = $id;
		$response['albumTitle']=$albumTitle;
		$response['description']=$description;
		$response['link']= $link;
		
		array_push($data,$response);	
} 

  $json= json_encode($data,JSON_NUMERIC_CHECK);     
	deliver_response(200,"albums","albumsInformation",$data);

?>