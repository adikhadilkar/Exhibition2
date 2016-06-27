//function to get Exhibitions
function getExhibitions()
{	
	myApp.closePanel();
	myApp.showPreloader();  
	//$("#photos").show();	
	var request = createCORSRequest( "post", "http://radio.tekticks.com" );
	if(request)
	{
		$.ajax({
		url:"http://radio.tekticks.com/exhibition/getExhibitions_json.php",
		dataType:"json",
		contentType: 'application/json',
		success:function(data)
		{
			var n=Object.keys(data.exhibitionsInformation).length;
			if(n>0)
			{
				var ExhibitionId = []; // create array here
				$.each(data.exhibitionsInformation, function (index, exhibitionsInformation) {
				ExhibitionId.push(exhibitionsInformation.id); //push values here
				});
		 
				//array for exhibition name
				var name = []; // create array here
				$.each(data.exhibitionsInformation, function (index,exhibitionsInformation) {
				name.push(exhibitionsInformation.name); //push values here
				}); 
		 
				//array for albumCover
				var exhibitionLink = []; // create array here
				$.each(data.exhibitionsInformation, function (index, exhibitionsInformation) {
				exhibitionLink.push(exhibitionsInformation.link); //push values here
				});
		 
		/* 	for(var i=0;i<n;i++)
			{ 
				$('#photoOutput').append('<div class="row no-gutter"><div class="col-50"style="padding:1px"><a href="sw_photos_lcs.html" id="'+albumId[i]+'" onclick="getAllphotos(this)" class="item close-panel" ><div style="background-image: linear-gradient(rgba(0, 0, 0, 0.3),rgba(0, 0, 0, 0.8)),url('+albumCoverLink[i]+');background-repeat:no-repeat;background-size:100% 100%;height:200px;position:relative;" class="lazy"><span style="color:#FFFFFF;position:absolute;bottom:0;padding-bottom:10px;font-size:18px;font-weight: bold;margin-left: auto;margin-right:auto;left:0;right:0;">'+albumName[i]+'</span></div></a></div><div class="col-50" style="padding:1px"><a href="sw_photos_lcs.html" id="'+albumId[i+1]+'" onclick="getAllphotos(this)" class="item close-panel"><div style="background-image: linear-gradient(rgba(0, 0, 0, 0.3),rgba(0, 0, 0, 0.8)),url('+albumCoverLink[i+1]+');background-repeat:no-repeat;background-size:100% 100%;height:200px; position:relative;" class="lazy"><span style="color:#FFFFFF;position:absolute;bottom:0;padding-bottom:10px;font-size:18px;font-weight:bold;margin-left: auto;margin-right:auto;left:0;right:0;">'+albumName[i+1]+'</span></div></a></div></div>');
				i++;
			} */
			
			for(var i=0;i<n;i++)
			{ 
				if(n % 2 == 0)
				{
				$('#exhibitionPhotos').append('<div class="row no-gutter" style="margin:0px 0px;padding-top:1px"><div class="col-50" style="padding:1px"><a href="gallery.html" id="'+ExhibitionId[i]+'" onclick="getPhotos(this)" class="item close-panel" ><div style="background-image: linear-gradient(rgba(0, 0, 0, 0.3),rgba(0, 0, 0, 0.8)),url('+exhibitionLink[i]+');background-repeat:no-repeat;background-size:100% 100%;height:200px;position:relative;" class="lazy"><span style="color:#FFFFFF;position:absolute;bottom:0;padding-bottom:10px;font-size:18px;font-weight: bold;margin-left: auto;margin-right:auto;left:0;right:0;"><center><b>'+name[i]+'</b></center></span></div></a></div><div class="col-50" style="padding:1px"><a href="gallery.html" id="'+ExhibitionId[i+1]+'" onclick="getPhotos(this)" class="item close-panel"><div style="background-image: linear-gradient(rgba(0, 0, 0, 0.3),rgba(0, 0, 0, 0.8)),url('+exhibitionLink[i+1]+');background-repeat:no-repeat;background-size:100% 100%;height:200px; position:relative;" class="lazy"><span style="color:#FFFFFF;position:absolute;bottom:0;padding-bottom:10px;font-size:18px;font-weight:bold;margin-left: auto;margin-right:auto;left:0;right:0;"><center><b>'+name[i+1]+'</b></center></span></div></a></div></div>');
				i++;
				}
				else
				{
					//alert(ExhibitionId[i]);
					//alert(ExhibitionId[i+1]);
					$('#exhibitionPhotos').append('<div class="row no-gutter" style="margin:0px 0px;padding-top:1px"><div class="col-50" style="padding:1px"><a href="gallery.html" id="'+ExhibitionId[i]+'" onclick="getPhotos(this)" class="item close-panel" ><div style="background-image: linear-gradient(rgba(0, 0, 0, 0.3),rgba(0, 0, 0, 0.8)),url('+exhibitionLink[i]+');background-repeat:no-repeat;background-size:100% 100%;height:200px;position:relative;" class="lazy"><span style="color:#FFFFFF;position:absolute;bottom:0;padding-bottom:10px;font-size:18px;font-weight: bold;margin-left: auto;margin-right:auto;left:0;right:0;"><center><b>'+name[i]+'</b></center></span></div></a></div><div class="col-50" style="padding:1px"><a href="gallery.html" id="'+ExhibitionId[i+1]+'" onclick="getPhotos(this)" class="item close-panel"><div style="background-image: linear-gradient(rgba(0, 0, 0, 0.3),rgba(0, 0, 0, 0.8)),url('+exhibitionLink[i+1]+');background-repeat:no-repeat;background-size:100% 100%;height:200px; position:relative;" class="lazy"><span style="color:#FFFFFF;position:absolute;bottom:0;padding-bottom:10px;font-size:18px;font-weight:bold;margin-left: auto;margin-right:auto;left:0;right:0;"><center><b>'+name[i+1]+'</b></center></span></div></a></div></div>');
					i++;
					
					if(ExhibitionId[i] === undefined)
					{ 
						/* var show = document.getElementById(''+albumId[i+1]+'');
						show.style.visibility = 'hidden'; */
					
						//hides all the div where id is undefined
						$("[id=undefined]").hide();
					
						//$('#'+ExhibitionId[i]+'').hide();
					}
			}
			}
			var show = document.getElementById('exhibitionPhotos');
			show.style.visibility = 'visible';
			myApp.hidePreloader();
		}
		else
		{
				myApp.hidePreloader();
			myApp.alert('There are no more Exhibitions to view.', function () {
    });
		}
		}
		});
	}
}


//function to get albums
function getPhotos(item)
{
	myApp.closePanel();
  myApp.showPreloader();
	var request = createCORSRequest( "post", "http://radio.tekticks.com" );
	if(request)
	{
		var exhibitionId = $(item).attr("id");
		//alert(exhibitionId);
		var data = {"exhibition":[{"exhibitionId":exhibitionId}]};
		var sendData = function(data)
		{
				
			$.ajax({
			url:"http://radio.tekticks.com/exhibition/getPhotos_json.php",
			type: 'POST', 
			dataType:'json',
			data: JSON.stringify(data),
			contentType: 'application/json',
			success:function(response)
			{
				if(JSON.stringify(response.status)==200)
				{
					if(response.albumsInformation.length>0)
					{
					var exhibitionName = [];
					var albumId = [];
					var albumTitle = [];
					var albumCoverLink = []; 
					
					
					for(var j=0;j<response.albumsInformation.length;j++)
					{
					exhibitionName[j]= JSON.stringify(response.albumsInformation[j].exhibitionName).replace(/"/g,"");
					albumId[j]= JSON.stringify(response.albumsInformation[j].id).replace(/"/g,"");
					albumTitle[j]= JSON.stringify(response.albumsInformation[j].albumTitle).replace(/"/g,"");
					albumCoverLink[j]= JSON.stringify(response.albumsInformation[j].link).replace(/"/g,"");
					}
					
					//alert(response.albumsInformation.length);
					//alert(exhibitionName);
					//alert(albumId);
					//alert(albumTitle);
					//alert(albumCoverLink);
		 
			for(var i=0;i<response.albumsInformation.length;i++)
			{ 
				if(response.albumsInformation.length % 2 == 0)
				{
				$( "#exhibitionName" ).text(exhibitionName[0]);
				$('#photos').append('<div class="row no-gutter" style="margin:0px 0px;padding-top:1px"><div class="col-50" style="padding:1px"><a href="eachPhoto.html" id="'+albumId[i]+'" onclick="getAllphotos(this)" class="item close-panel" ><div style="background-image: linear-gradient(rgba(0, 0, 0, 0.3),rgba(0, 0, 0, 0.8)),url('+albumCoverLink[i]+');background-repeat:no-repeat;background-size:100% 100%;height:200px;position:relative;" class="lazy"><span style="color:#FFFFFF;position:absolute;bottom:0;padding-bottom:10px;font-size:18px;font-weight: bold;margin-left: auto;margin-right:auto;left:0;right:0;"><center>'+albumTitle[i]+'</center></span></div></a></div><div class="col-50" style="padding:1px"><a href="eachPhoto.html" id="'+albumId[i+1]+'" onclick="getAllphotos(this)" class="item close-panel"><div style="background-image: linear-gradient(rgba(0, 0, 0, 0.3),rgba(0, 0, 0, 0.8)),url('+albumCoverLink[i+1]+');background-repeat:no-repeat;background-size:100% 100%;height:200px; position:relative;" class="lazy"><span style="color:#FFFFFF;position:absolute;bottom:0;padding-bottom:10px;font-size:18px;font-weight:bold;margin-left: auto;margin-right:auto;left:0;right:0;"><center>'+albumTitle[i+1]+'</center></span></div></a></div></div>');
				i++;
				}
				else
				{
					$( "#exhibitionName" ).text(exhibitionName[0]);
					$('#photos').append('<div class="row no-gutter" style="margin:0px 0px;padding-top:1px"><div class="col-50" style="padding:1px"><a href="eachPhoto.html" id="'+albumId[i]+'" onclick="getAllphotos(this)" class="item close-panel" ><div style="background-image: linear-gradient(rgba(0, 0, 0, 0.3),rgba(0, 0, 0, 0.8)),url('+albumCoverLink[i]+');background-repeat:no-repeat;background-size:100% 100%;height:200px;position:relative;" class="lazy"><span style="color:#FFFFFF;position:absolute;bottom:0;padding-bottom:10px;font-size:18px;font-weight: bold;margin-left: auto;margin-right:auto;left:0;right:0;"><center>'+albumTitle[i]+'</center></span></div></a></div><div class="col-50" style="padding:1px"><a href="eachPhoto.html" id="'+albumId[i+1]+'"  onclick="getAllphotos(this)" class="item close-panel"><div style="background-image: linear-gradient(rgba(0, 0, 0, 0.3),rgba(0, 0, 0, 0.8)),url('+albumCoverLink[i+1]+');background-repeat:no-repeat;background-size:100% 100%;height:200px; position:relative;" class="lazy"><span style="color:#FFFFFF;position:absolute;bottom:0;padding-bottom:10px;font-size:18px;font-weight:bold;margin-left: auto;margin-right:auto;left:0;right:0;"><center>'+albumTitle[i+1]+'</center></span></div></a></div></div>');
					i++;
					if(albumId[i] === undefined)
					{
					//hides all the div where id is undefined
					 $("[id=undefined]").hide();
					}
			}
			}
			var show = document.getElementById('photos');
			show.style.visibility = 'visible';
			myApp.hidePreloader();
				}
				else
				{
					myApp.hidePreloader();
					myApp.alert('No Albums Available','Albums');
				}
				}
			
			}
		
		});
	
		}					
		sendData(data);	
	} 
}

//function to get photos within a particular album
function getAllphotos(item)
{	
	myApp.showPreloader();
	var request = createCORSRequest( "post", "http://radio.tekticks.com" );
	if(request)
	{
		var albumId = $(item).attr("id");
		//alert(albumId);
		//var visitorId=localStorage.getItem("visitorId");
		var data = {"album":[{"albumId":albumId}]};
		var sendData = function(data)
		{
				
			$.ajax({
			url:"http://radio.tekticks.com/exhibition/eachAlbumPhotos.php",
			type: 'POST', 
			dataType:'json',
			data: JSON.stringify(data),
			contentType: 'application/json',
			success:function(response)
			{
				if(JSON.stringify(response.status)==200)
				{
					myApp.hidePreloader();
					
					 /* var n=Object.keys(response.photosInformation).length;
					if(n>0)
					{  */
						 var mediaId = []; // create array here
						$.each(response.photosInformation, function (index, photosInformation) {
						mediaId.push(photosInformation.mediaId); //push values here
						});
						//alert(mediaId);
						
						 var caption = []; // create array here
						$.each(response.photosInformation, function (index, photosInformation) {
						caption.push(photosInformation.caption); //push values here
						}); 
						//alert(caption);
						
						var link = []; // create array here
						$.each(response.photosInformation, function (index, photosInformation) {
						link.push(photosInformation.link); //push values here
						});
						//alert(link);

						var albumTitle = []; // create array here
						$.each(response.photosInformation, function (index, photosInformation) {
						albumTitle.push(photosInformation.albumTitle); //push values here
						});
						//alert(albumTitle);

						var n=Object.keys(response.photosInformation).length;
						//alert(n);
						for(var i=0;i<n;i++)
						{ 	
						if(n % 2 == 0)
						{
						var number=i;
						var nextNumber=i+1;
						$( "#aName" ).text(albumTitle[0]);
						$('#photoOutput').append('<div class="card demo-card-header-pic" id="each" style="margin:0px 0px"><div style="background-image:url(http://lorempixel.com/1000/609/)" valign="bottom" class="card-header color-white no-border" width="100%" height="100%"><b><h2>'+albumTitle[0]+'</h2></b></div><div class="row no-gutter" style="margin:0px 0px;"><div class="col-50"style="padding:1px"><a href="#" id="'+mediaId[i]+'" name="'+number+'" onclick="openPhoto(this)" class="item close-panel" ><div style="background-image: linear-gradient(rgba(0, 0, 0, 0.3),rgba(0, 0, 0, 0.8)),url('+link[i]+');background-repeat:no-repeat;background-size:100% 100%;height:200px;position:relative;" class="lazy"><span style="color:#FFFFFF;position:absolute;bottom:0;padding-bottom:10px;font-size:18px;font-weight: bold;margin-left: auto;margin-right:auto;left:0;right:0;"><center></center></span></div></a></div><div class="col-50" style="padding:1px"><a href="#" id="'+mediaId[i+1]+'" name="'+nextNumber+'" onclick="openPhoto(this)" class="item close-panel"><div style="background-image: linear-gradient(rgba(0, 0, 0, 0.3),rgba(0, 0, 0, 0.8)),url('+link[i+1]+');background-repeat:no-repeat;background-size:100% 100%;height:200px; position:relative;" class="lazy"><span style="color:#FFFFFF;position:absolute;bottom:0;padding-bottom:10px;font-size:18px;font-weight:bold;margin-left: auto;margin-right:auto;left:0;right:0;"><center></center></span></div></a></div></div></div>');
						i++;
						}
						else
						{
							var number=i;
							var nextNumber=i+1;
							$( "#aName" ).text(albumTitle[0]);
							$('#photoOutput').append('<div class="card demo-card-header-pic" id="each" style="margin:0px 0px"><div style="background-image:url(http://lorempixel.com/1000/609/)" valign="bottom" class="card-header color-white no-border" width="100%" height="100%"><b><h2>'+albumTitle[0]+'</h2></b></div><div class="row no-gutter" style="margin:0px 0px;"><div class="col-50"style="padding:1px"><a href="#" id="'+mediaId[i]+'" name="'+number+'" onclick="openPhoto(this)" class="item close-panel" ><div style="background-image: linear-gradient(rgba(0, 0, 0, 0.3),rgba(0, 0, 0, 0.8)),url('+link[i]+');background-repeat:no-repeat;background-size:100% 100%;height:200px;position:relative;" class="lazy"><span style="color:#FFFFFF;position:absolute;bottom:0;padding-bottom:10px;font-size:18px;font-weight: bold;margin-left: auto;margin-right:auto;left:0;right:0;"><center></center></span></div></a></div><div class="col-50" style="padding:1px"><a href="#" id="'+mediaId[i+1]+'" name="'+nextNumber+'" onclick="openPhoto(this)" class="item close-panel"><div style="background-image: linear-gradient(rgba(0, 0, 0, 0.3),rgba(0, 0, 0, 0.8)),url('+link[i+1]+');background-repeat:no-repeat;background-size:100% 100%;height:200px; position:relative;" class="lazy"><span style="color:#FFFFFF;position:absolute;bottom:0;padding-bottom:10px;font-size:18px;font-weight:bold;margin-left: auto;margin-right:auto;left:0;right:0;"><center></center></span></div></a></div></div></div>');
							i++;
							
							 if(mediaId[i] === undefined)
								{
								//$('#'+mediaId[i]+'').hide();
								//$('#mediaId'+[i+1]+'').hide();
								
								//hides all the div where id is undefined
								$("[id=undefined]").hide();
								}		 
						}
						var show = document.getElementById('photoOutput');
						show.style.visibility = 'visible';		
						
						localStorage["caption"] = JSON.stringify(caption);
						localStorage["link"] = JSON.stringify(link);
						localStorage["albumTitle"] = JSON.stringify(albumTitle[0]);
					}
						
					/* }
					else
					{
						myApp.hidePreloader();
						myApp.alert('No photos in this album!');
					}  */

				}
			
			}
		
		});
	
		}					
		sendData(data);	
	}
}


function openPhoto(index)
{
	myApp.showPreloader();
	var photoId = $(index).attr("id");
	var photoNumber = $(index).attr("name");
	//alert(photoNumber);
	var url = JSON.parse(localStorage["link"]);
	//alert(photoLink);
	var caption = JSON.parse(localStorage["caption"]);
	//alert(photoCaption);
	var title = JSON.parse(localStorage["albumTitle"]);
	//alert(title);
	var m=Object.keys(url).length;
	jsonObj = [];
	for(var i=0;i<m;i++)
	{ 
		item = {};
		item ["url"] = url[i];
		item ["caption"] = caption[i];
		jsonObj.push(item);
	}
	
	var photosBrowser = jsonObj;
	var myPhotoBrowserPopupDark = myApp.photoBrowser({
	photos: photosBrowser,
	//theme: 'dark',
	type: 'popup',
	lazyLoading: 'true',
	lazyLoadingInPrevNext: 'true',                              
	//maxZoom:'3',
	initialSlide: photoNumber,
	toolbar: true,
	navbar:true,
	zoom: true,
	//backLinkText: title
	});
	myPhotoBrowserPopupDark.open();		
		myApp.hidePreloader();
}

function exhibitionRefresh()
{
	$("#exhibitionPhotos").find("div").remove();
	getExhibitions();
}