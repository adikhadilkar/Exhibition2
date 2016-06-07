<?php
//Access Control Headers
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Credentials: true');
header('Access-Control-Allow-Headers: Content-Type');
//Include Files
include 'jsonFormat.php';
include 'jsonDeliver.php';
include 'config.php';
//$result=array();
//select news details
$data=array();
@$selectAlbumQuery="SELECT id,name,albumCoverLink,status FROM album where status=1 and flag=0";
@$selectAlbum=mysql_query($selectAlbumQuery,$conn) or die(mysql_error());
//@$newsRows=mysql_num_rows($selectNews);

//@$albumDetail=array();
	
			//@$albumDetail['album']=$rows;

    for ($count = 0; $count < mysql_num_rows($selectAlbum); $count++) 
	{
        $data[] = mysql_fetch_assoc($selectAlbum);
    }

    $json= json_encode($data,JSON_NUMERIC_CHECK);     
	deliver_response(200,"album","albumInformation",$data);

?>