function sendfeedback()
{
	myApp.showPreloader();
	var subject = document.getElementById('subject').value;
	//alert(subject);
	var feedback = document.getElementById('feedback').value;
	//alert(feedback);
	var emailId = document.getElementById('emailId').value;
	//alert(emailId);
	var request = createCORSRequest( "post", "http://radio.tekticks.com" );

	if(request)
	{
		var data = {"Feedback":[{"subject":subject,"feedback":feedback,"emailId":emailId}]};
		var sendData = function(data)
		{
		$.ajax({
		url:"http://radio.tekticks.com/exhibition/sendFeedback.php",
		type: 'POST',
		contentType: 'application/json',
		data: JSON.stringify(data),
		dataType:"json",
		success:function(response)
		{
					if(JSON.stringify(response.status)==200)
						{
							myApp.hidePreloader();	
							myApp.alert('Successfully added','Feedback');
							mainView.router.loadPage("logo.html");
						}
		}
	  
		});
		} 
	sendData(data);
	}
	
}