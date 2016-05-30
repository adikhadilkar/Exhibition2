<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Credentials: true');
header('Access-Control-Allow-Headers: Content-Type');
include 'jsonFormat.php';
include 'jsonDeliver.php';
include 'config.php';
//$josn = '{"signUp":[{"name":"abc","password":"abc","mobileNo":789456124,"emailId":"abc@gmail.com"}]}'; 
$josn = file_get_contents("php://input");
$data = json_decode($josn, true);
$jsonresponse =	array();
$name=$data['signUp'][0]['name'];
$password=$data['signUp'][0]['password'];
$mobileNo=$data['signUp'][0]['mobileNo'];
$email=$data['signUp'][0]['emailId'];
$createdOn=date('Y-m-d h:i:s', time());



if($name=='' or $mobileNo=='' or $email=='' or $password=='')
{
	deliver_response(203,"Missing Information","visitor",$jsonresponse);
}
else
{
	//Check if Mobile Number exists
	$selectVisitorQuery1 = "select * from visitor where mobileNo='$mobileNo'";
	$selectVisitor1 = mysql_query($selectVisitorQuery1,$conn) or die(mysql_error());
	$selectVisitorRows1 = mysql_num_rows($selectVisitor1);
	if($selectVisitorRows1 > 0)
	{
		deliver_response(203,"Account With This Mobile Number Already Exists","visitor",$jsonresponse);
	}
	else
	{
		//Check if Email exists
		$selectVisitorQuery2="select * from visitor where emailId='$email'";
		$selectVisitor2=mysql_query($selectVisitorQuery2,$conn) or die(mysql_error());
		$selectVisitorRows2=mysql_num_rows($selectVisitor2);
		if($selectVisitorRows2 > 0)
		{
			deliver_response(203,"Account With This Email Id Already Exists","visitor",$jsonresponse);
		}
		else
		{
			//Insert new Visitor into Visitor table
			$insertVisitorQuery="insert into visitor (name,mobileNo,emailId,password,createdOn,modifiedOn)  values('$name','$mobileNo','$email','$password','$createdOn','$createdOn')";
			$insertVisitor=mysql_query($insertVisitorQuery,$conn) or die(mysql_error());
			

			
			//select id from visitor table
			$selectVisitorQuery2 = "select id from visitor where mobileNo='$mobileNo'";
			$selectVisitor2 = mysql_query($selectVisitorQuery2 ,$conn) or die(mysql_error());
			$selectVisitorResult1=mysql_fetch_assoc($selectVisitor2);
			
			$selectVisitorRows1 = mysql_num_rows($selectVisitor2);
			if($selectVisitorRows1 > 0)
			{
				//id1 has the current id from auto incremented column
				$id1=mysql_insert_id();
			}
			
			//inserting data into visitorProfile
			$insertVisitorProfileQuery="insert into visitorProfile (name,createdOn,modifiedOn,createdBy,modifiedBy)  values('$name','$createdOn','$createdOn','$id1','$id1')";
			$insertVisitorProfile=mysql_query($insertVisitorProfileQuery,$conn) or die(mysql_error());

			
			$selectVisitorQuery1="select id,name from visitor where mobileNo='$mobileNo'";
			$selectVisitor1=mysql_query($selectVisitorQuery1,$conn)or die(mysql_error());
			$visitorResultRows=mysql_num_rows($selectVisitor1);
				while($selectVisitorResult=mysql_fetch_assoc($selectVisitor1))
				{
					$jsonresponse[] = $selectVisitorResult;
				}
				json_encode($jsonresponse);
				deliver_response(200,"visitor created","visitor",$jsonresponse);

			
		}
	}
}


			

?>