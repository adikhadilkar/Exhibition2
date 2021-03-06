function forgotpass()
{
	
	var Otp = localStorage.getItem("otp");
	//alert(otp);
	var request = createCORSRequest( "post", "http://radio.tekticks.com" );
	if(request)
	{
		var mobileNo = document.getElementById('mobileNo').value;
		//alert(mobileNo);
		var mobileNoValidate = validatePhone(mobileNo);
		if(mobileNoValidate)
		{
			$("#mobileError").hide();
		}
		else
		{
			$("#mobileError").fadeIn();
		}
		
		var otp = document.getElementById('otp').value;
		var otpValidate = validateOtp(otp);
		if(otpValidate)
		{
			$("#otpError").hide();
		}
		else
		{
			$("#otpError").fadeIn();
		}
		
		var newPassword = document.getElementById('newPassword').value;
		var newPasswordValidate = validateNewPassword(newPassword);
		if(newPasswordValidate)
		{
			$("#newPasswordError").hide();
		}
		else
		{
			$("#newPasswordError").fadeIn();
		}
		
		var confirmPassword = document.getElementById('confirmPassword').value;
		var confirmPasswordValidate = validateConfirmPassword(confirmPassword);
		if(confirmPasswordValidate)
		{
			$("#confirmPasswordError").hide();
		}
		else
		{
			$("#confirmPasswordError").fadeIn();
		}
		
		if(mobileNoValidate && otpValidate && newPasswordValidate && confirmPasswordValidate)
		{
			myApp.showPreloader();
		var data = {"password":[{"pOtp":Otp,"nOtp":otp,"mobileNo":mobileNo,"newPassword":newPassword,"confirmPassword":confirmPassword}]};
			var sendData = function(data)
			{   
				$.ajax
				({
				url: 'http://radio.tekticks.com/exhibition/forgotJson.php',
				type: 'POST',
				contentType: 'application/json',
				data: JSON.stringify(data),
				dataType: 'json',
				success: function(response)
										{
						if(JSON.stringify(response.status)==200)
						{
							myApp.hidePreloader();
							myApp.alert('Password Changed','Password');
							
							navi();
							mainView.router.loadPage("logo.html");
							/* var a = document.getElementById('cPasswordNext');
							a.setAttribute("href","logo.html");
							document.getElementById('cPasswordNext').click(); */
							
						}
						else if(JSON.stringify(response.status)==203)
						{
							myApp.hidePreloader();
							$("#newPasswordError").text(JSON.stringify(response.statusMessage).replace(/"/g,""));
							$("#newPasswordError").fadeIn();
							$("#confirmPasswordError").text(JSON.stringify(response.statusMessage).replace(/"/g,""));
							$("#confirmPasswordError").fadeIn();
						}
						
						else if(JSON.stringify(response.status)==202)
						{
							myApp.hidePreloader();
							$("#otpError").text(JSON.stringify(response.statusMessage).replace(/"/g,""));
							$("#otpError").fadeIn();
						}
					},
					error: function(xhr, textStatus, error)
					{
						console.log(xhr.statusText);
						console.log(textStatus);
						console.log(error);
					}
				});
			};
			sendData(data);
		}
		
	}
}

function changePassword()
{
	var visitorId = localStorage.getItem("visitorId");
	var request = createCORSRequest( "post", "http://radio.tekticks.com" );
	if(request)
	{
		var password = document.getElementById('cCurrentPassword').value;
		var passwordValidate = validatePassword(password);
		if(passwordValidate)
		{
			$("#passwordError").hide();
		}
		else
		{
			$("#passwordError").fadeIn();
		}
		
		var newPassword = document.getElementById('cNewPassword').value;
		var newPasswordValidate = validateNewPassword(newPassword);
		if(newPasswordValidate)
		{
			$("#newPasswordError").hide();
		}
		else
		{
			$("#newPasswordError").fadeIn();
		}
		
		var confirmPassword = document.getElementById('cConfirmPassword').value;
		var confirmPasswordValidate = validateConfirmPassword(confirmPassword);
		if(confirmPasswordValidate)
		{
			$("#confirmPasswordError").hide();
		}
		else
		{
			$("#confirmPasswordError").fadeIn();
		}
		if(passwordValidate)
		{
		var data = {"password":[{"visitorId":visitorId,"password":password,"newPassword":newPassword,"confirmPassword":confirmPassword}]};
			var sendData = function(data)
			{   
				$.ajax
				({
				url: 'http://radio.tekticks.com/exhibition/changePasswordJson.php',
				type: 'POST',
				contentType: 'application/json',
				data: JSON.stringify(data),
				dataType: 'json',
				success: function(response)
					{
						if(JSON.stringify(response.status)==200)
						{
							
							myApp.alert('Password Changed','Password');
							
							navi();
							mainView.router.loadPage("logo.html");
							
						}
						else if(JSON.stringify(response.status)==203)
						{
							$("#passwordError").text(JSON.stringify(response.statusMessage).replace(/"/g,""));
							$("#passwordError").fadeIn();
						}
						else if(JSON.stringify(response.status)==202)
						{
							$("#newPasswordError").text(JSON.stringify(response.statusMessage).replace(/"/g,""));
							$("#newPasswordError").fadeIn();
							$("#confirmPasswordError").text(JSON.stringify(response.statusMessage).replace(/"/g,""));
							$("#confirmPasswordError").fadeIn();
						}
			
					},
					error: function(xhr, textStatus, error)
					{
						console.log(xhr.statusText);
						console.log(textStatus);
						console.log(error);
					}
				});
			};
			sendData(data);
		}
		
	}
}

function generateOtp()
{
	myApp.showPreloader();
	var request = createCORSRequest( "post", "http://radio.tekticks.com" );
	if(request)
	{
		var mobileNo = document.getElementById('mobileNo').value;
		var data = {"otp":[{"mobileNo":mobileNo}]};
		
		var sendData = function(data)
		{
		
		$.ajax({
		url:"http://radio.tekticks.com/exhibition/otpGeneration.php",
		type: 'POST',
		contentType: 'application/json',
		data: JSON.stringify(data),
		dataType:"json",
		success:function(response)
		{
			if(JSON.stringify(response.status)==200)
			{
				$("#mobileError").fadeOut();
				$("#moList").css("display", "none");
				$("#buList").css("display", "none");
				$("#otpList").css("display", "block");
				$("#newPassList").css("display", "block");
				$("#conPassList").css("display", "block");
				$("#bu2List").css("display", "block");
				$("#resend").css("display", "block");
				myApp.hidePreloader();
				var otp = JSON.stringify(response.otp).replace(/"/g,"");
				localStorage.setItem("otp", otp);
				myApp.alert('Your OTP Is '+otp,'One Time Password');
				
			}
			else if(JSON.stringify(response.status)==202)
			{
				myApp.hidePreloader();
				$("#mobileError").text(JSON.stringify(response.statusMessage).replace(/"/g,""));
				$("#mobileError").fadeIn();
			}
			else if(JSON.stringify(response.status)==203)
			{
				myApp.hidePreloader();
				$("#mobileError").text(JSON.stringify(response.statusMessage).replace(/"/g,""));
				$("#mobileError").fadeIn();
				//myApp.alert('This Number Does Not Exist..Make A New Account!!','Error');
			}
		},
		error: function(xhr, textStatus, error)
		{
			console.log(xhr.statusText);
			console.log(textStatus);
			console.log(error);
		}
					
		
		});
		}
			sendData(data);
	}
	
}