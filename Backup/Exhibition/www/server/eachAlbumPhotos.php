<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Credentials: true');
header('Access-Control-Allow-Headers: Content-Type');
include 'jsonFormat.php';
include 'jsonDeliver.php';
include 'config.php'; 
$json = file_get_contents("php://input");
$data = json_decode($json, true);
$data1=array();
$jsonresponse=array();
$albumId=$data['album'][0]['albumId'];
$response=array();

//select photos in a particular album 
@$selectPhotosQuery="SELECT m.mediaId, m.caption, y.albumTitle, z.link
FROM exhibitionAlbum_media m, exhibitionAlbum y, media z
WHERE m.mediaId = z.id AND y.id=m.exhibitionAlbumId
AND m.exhibitionAlbumId = '$albumId'";
@$selectPhotos=mysql_query($selectPhotosQuery,$conn) or die(mysql_error());
@$photoRows=mysql_num_rows($selectPhotos);

while($photos=mysql_fetch_array($selectPhotos))
{
		$response['mediaId'] = $photos['mediaId'];
		$response['caption'] = $photos['caption'];
		$response['link']= $photos['link'];
		$response['albumTitle']= $photos['albumTitle'];
		array_push($data1,$response);	
} 

	$json= json_encode($data,JSON_NUMERIC_CHECK);     
	deliver_response(200,"photos","photosInformation",$data1);

?>