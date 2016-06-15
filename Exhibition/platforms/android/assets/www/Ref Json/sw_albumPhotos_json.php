<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Credentials: true');
header('Access-Control-Allow-Headers: Content-Type');
include 'jsonFormat.php';
include 'jsonDeliver.php';
include 'config.php';
//$josn = '{"signUp":[{"name":"abc","password":"abc","mobileNo":789456124,"emailId":"abc@gmail.com"}]}';
 
//var data = {"album":[{"albumId":albumId}]};
$json = file_get_contents("php://input");
$data = json_decode($json, true);
//$jsonresponse=array();
$albumId=$data['album'][0]['albumId'];
$visitorId=$data['album'][0]['visitorId'];


	
	//Update album table
	$updateAlbumQuery="update album set clicks=clicks+1 where id='$albumId'";
	$updateAlbum=mysql_query($updateAlbumQuery,$conn) or die(mysql_error());
	
	//select photos information
	$selectPhotosQuery1 = "select m.id,m.link,m.status,m.caption,m.clicks,m.likes as noOfLikes,@curRow := @curRow + 1 AS number from media m JOIN (SELECT @curRow := 0)r where albumId='$albumId' and m.status=1 and m.flag=0";
	/* $selectPhotosQuery1 = "select m.id,m.link,m.caption,m.clicks,m.likes as NoOfLikes,@curRow := @curRow + 1 AS number,vp.likes as Like1
from visitorpoststats vp,media m JOIN (SELECT @curRow := 0)r where m.albumId='$albumId' and vp.postId='$albumId' and vp.postTypeId=2 and vp.visitorId='$visitorId'"; */
	$selectPhotos1 = mysql_query($selectPhotosQuery1,$conn) or die(mysql_error());
	$selectPhotosRows1 = mysql_num_rows($selectPhotos1);
	
	if($selectPhotosRows1 > 0)
	{
		
		for ($count = 0; $count < $selectPhotosRows1; $count++) 
		
		{
			$jsonresponse[] = mysql_fetch_assoc($selectPhotos1);
		}
		/*{
		while($selectPhotosResult=mysql_fetch_assoc($selectPhotos1))
		{
		for(var i=0;i<$selectPhotosRows1 ;i++)
		.
		
		$jsonresponse['photos']=$selectPhotosResult['link'];*/
		json_encode($jsonresponse);
		
		deliver_response(200,"photos Information","photos",$jsonresponse);
}
	else
	{
		deliver_response(201,"photos Information","photos",$jsonresponse);
	}
	
		
	
?>