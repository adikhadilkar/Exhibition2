function validateEmail(mail)   
{  
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;  
	if(mail == ""){   //checking if the form is empty
		$("#emailError").text("Please enter an Email Id");
		return false;
		//displaying a message if the form is empty
    }
	else if(mail.match(mailformat))  
		{  
			return true;
		}  
		else  
		{  
			$("#emailError").text("Please enter a valid Email Id");
			return false;  
		}  
}

function validatePassword(password)  
{  
	if(password == "")
	{
		$("#passwordError").text("Please enter a Password");
        return false;
	}
	else if(password.length < 6)
	{
		$("#passwordError").text("Password must be greater than 6 characters!");
        return false;
	}
	else   
    {  
       return true;  
    }  
 }
 