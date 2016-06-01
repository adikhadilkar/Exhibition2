<?php
date_default_timezone_set("Asia/Kolkata");
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Credentials: true');
header('Access-Control-Allow-Headers: Content-Type');
include 'jsonFormat.php';
include 'jsonDeliver.php';
include 'config.php';
 
$json = file_get_contents("php://input");
$data = json_decode($json, true);
$jsonresponse=array();
$subject=$data['Feedback'][0]['subject'];
$feedback=$data['Feedback'][0]['feedback'];
$emailId=$data['Feedback'][0]['emailId'];
$createdOn=date('Y-m-d h:i:s', time());

$feedbackQuery="insert into feedback (subject,message,email,createdOn)  values('$subject','$feedback','$emailId','$createdOn')";
$addFeedback=mysql_query($feedbackQuery,$conn) or die(mysql_error());
	
$jsonresponse=$emailId;			
deliver_response(200,"feedback added","Feedback1",$jsonresponse);


 
	
?>