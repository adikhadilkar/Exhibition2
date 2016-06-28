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
$exhibitionId=$data['album'][0]['albumId'];
$response=array();

//to get cover pic of an album
$coverLink = mysql_query("SELECT a.link
FROM media a, exhibitionBannerMedia b, exhibitionAlbum c
WHERE c.id = b.id
AND b.mediaId = a.id
AND b.id ='$exhibitionId'");
$row = mysql_fetch_row($coverLink);

//select photos in a particular album 
@$selectPhotosQuery="SELECT y.id, y.albumTitle, z.link
FROM exhibitionAlbum_media m, exhibitionAlbum y, media z
WHERE y.id=m.exhibitionAlbumId AND m.mediaId=z.id
AND y.id='$exhibitionId'";
@$selectPhotos=mysql_query($selectPhotosQuery,$conn) or die(mysql_error());
@$photoRows=mysql_num_rows($selectPhotos);

while($photos=mysql_fetch_array($selectPhotos))
{
		$response['mediaId'] = $photos['id'];
		$response['coverLink'] = $row[0];
		$response['link']= $photos['link'];
		$response['albumTitle']= $photos['albumTitle'];
		array_push($data1,$response);	
} 

	$json= json_encode($data,JSON_NUMERIC_CHECK);     
	deliver_response(200,"photos","photosInformation",$data1);

?>