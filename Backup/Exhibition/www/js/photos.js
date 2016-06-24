//function to get albums
function getPhotos()
{	
	myApp.closePanel();
  myApp.showPreloader();  
  //$("#photos").show();	
	var request = createCORSRequest( "post", "http://radio.tekticks.com" );
	if(request)
	{
		$.ajax({
		url:"http://radio.tekticks.com/exhibition/getPhotos_json.php",
		dataType:"json",
		contentType: 'application/json',
		success:function(data)
		{
			var n=Object.keys(data.albumsInformation).length;
			if(n>0)
		{
			var albumId = []; // create array here
			$.each(data.albumsInformation, function (index, albumsInformation) {
				albumId.push(albumsInformation.id); //push values here
			});
		 
			//array for album
			var albumName = []; // create array here
			$.each(data.albumsInformation, function (index,albumsInformation) {
				albumName.push(albumsInformation.albumTitle); //push values here
			}); 
		 
			//array for albumCover
			var albumCoverLink = []; // create array here
			$.each(data.albumsInformation, function (index, albumsInformation) {
				albumCoverLink.push(albumsInformation.link); //push values here
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
				$('#photos').append('<div class="row no-gutter" style="margin:0px 0px;padding-top:1px"><div class="col-50" style="padding:1px"><a href="eachPhoto.html" id="'+albumId[i]+'" onclick="getAllphotos(this)" class="item close-panel" ><div style="background-image: linear-gradient(rgba(0, 0, 0, 0.3),rgba(0, 0, 0, 0.8)),url('+albumCoverLink[i]+');background-repeat:no-repeat;background-size:100% 100%;height:200px;position:relative;" class="lazy"><span style="color:#FFFFFF;position:absolute;bottom:0;padding-bottom:10px;font-size:18px;font-weight: bold;margin-left: auto;margin-right:auto;left:0;right:0;"><center>'+albumName[i]+'</center></span></div></a></div><div class="col-50" style="padding:1px"><a href="eachPhoto.html" id="'+albumId[i+1]+'" onclick="getAllphotos(this)" class="item close-panel"><div style="background-image: linear-gradient(rgba(0, 0, 0, 0.3),rgba(0, 0, 0, 0.8)),url('+albumCoverLink[i+1]+');background-repeat:no-repeat;background-size:100% 100%;height:200px; position:relative;" class="lazy"><span style="color:#FFFFFF;position:absolute;bottom:0;padding-bottom:10px;font-size:18px;font-weight:bold;margin-left: auto;margin-right:auto;left:0;right:0;"><center>'+albumName[i+1]+'</center></span></div></a></div></div>');
				i++;
				}
				else
				{
					$('#photos').append('<div class="row no-gutter" style="margin:0px 0px;padding-top:1px"><div class="col-50" style="padding:1px"><a href="eachAlbum.html" id="'+albumId[i]+'" onclick="getAllphotos(this)" class="item close-panel" ><div style="background-image: linear-gradient(rgba(0, 0, 0, 0.3),rgba(0, 0, 0, 0.8)),url('+albumCoverLink[i]+');background-repeat:no-repeat;background-size:100% 100%;height:200px;position:relative;" class="lazy"><span style="color:#FFFFFF;position:absolute;bottom:0;padding-bottom:10px;font-size:18px;font-weight: bold;margin-left: auto;margin-right:auto;left:0;right:0;"><center>'+albumName[i]+'</center></span></div></a></div><div class="col-50" style="padding:1px"><a href="eachAlbum.html" id="'+albumId[i+1]+'" onclick="getAllphotos(this)" class="item close-panel"><div style="background-image: linear-gradient(rgba(0, 0, 0, 0.3),rgba(0, 0, 0, 0.8)),url('+albumCoverLink[i+1]+');background-repeat:no-repeat;background-size:100% 100%;height:200px; position:relative;" class="lazy"><span style="color:#FFFFFF;position:absolute;bottom:0;padding-bottom:10px;font-size:18px;font-weight:bold;margin-left: auto;margin-right:auto;left:0;right:0;"><center>'+albumName[i+1]+'</center></span></div></a></div></div>');
				i++;
					
					if(albumId[i] === undefined)
				{ 
				//alert(albumId[i]);
				/* var show = document.getElementById(''+albumId[i+1]+'');
				
					show.style.visibility = 'hidden';
				}				 */
					$('#'+albumId[i+1]+'').hide();
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
			myApp.alert('There are no more Photos to  view.', function () {
			//cument.getElementById('bcktohome').click();
			//mainView.router.back(); 
			//showLeftPanel();
    });
		}
		}
		});
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
					{ */
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
						$('#photoOutput').append('<div class="row no-gutter" style="margin:0px 0px;"><div class="col-50"style="padding:1px"><a href="#" id="'+mediaId[i]+'" name="'+number+'" onclick="openPhoto(this)" class="item close-panel" ><div style="background-image: linear-gradient(rgba(0, 0, 0, 0.3),rgba(0, 0, 0, 0.8)),url('+link[i]+');background-repeat:no-repeat;background-size:100% 100%;height:200px;position:relative;" class="lazy"><span style="color:#FFFFFF;position:absolute;bottom:0;padding-bottom:10px;font-size:18px;font-weight: bold;margin-left: auto;margin-right:auto;left:0;right:0;"><center></center></span></div></a></div><div class="col-50" style="padding:1px"><a href="#" id="'+mediaId[i+1]+'" name="'+nextNumber+'" onclick="openPhoto(this)" class="item close-panel"><div style="background-image: linear-gradient(rgba(0, 0, 0, 0.3),rgba(0, 0, 0, 0.8)),url('+link[i+1]+');background-repeat:no-repeat;background-size:100% 100%;height:200px; position:relative;" class="lazy"><span style="color:#FFFFFF;position:absolute;bottom:0;padding-bottom:10px;font-size:18px;font-weight:bold;margin-left: auto;margin-right:auto;left:0;right:0;"><center></center></span></div></a></div></div>');
						i++;
						}
						else
						{
							var number=i;
							var nextNumber=i+1;
							$( "#aName" ).text(albumTitle[0]);
							$('#photoOutput').append('<div class="row no-gutter" style="margin:0px 0px;"><div class="col-50"style="padding:1px"><a href="#" id="'+mediaId[i]+'" name="'+number+'" onclick="openPhoto(this)" class="item close-panel" ><div style="background-image: linear-gradient(rgba(0, 0, 0, 0.3),rgba(0, 0, 0, 0.8)),url('+link[i]+');background-repeat:no-repeat;background-size:100% 100%;height:200px;position:relative;" class="lazy"><span style="color:#FFFFFF;position:absolute;bottom:0;padding-bottom:10px;font-size:18px;font-weight: bold;margin-left: auto;margin-right:auto;left:0;right:0;"><center></center></span></div></a></div><div class="col-50" style="padding:1px"><a href="#" id="'+mediaId[i+1]+'" name="'+nextNumber+'" onclick="openPhoto(this)" class="item close-panel"><div style="background-image: linear-gradient(rgba(0, 0, 0, 0.3),rgba(0, 0, 0, 0.8)),url('+link[i+1]+');background-repeat:no-repeat;background-size:100% 100%;height:200px; position:relative;" class="lazy"><span style="color:#FFFFFF;position:absolute;bottom:0;padding-bottom:10px;font-size:18px;font-weight:bold;margin-left: auto;margin-right:auto;left:0;right:0;"><center></center></span></div></a></div></div>');
							i++;
							
							 if(mediaId[i] === undefined)
								{
								$('#'+mediaId[i+1]+'').hide();
								//$('#mediaId'+[i+1]+'').hide();	
								}		 
						}
						var show = document.getElementById('photoOutput');
						show.style.visibility = 'visible';		
						
						localStorage["caption"] = JSON.stringify(caption);
						localStorage["link"] = JSON.stringify(link);
						localStorage["albumTitle"] = JSON.stringify(albumTitle[0]);
					}
						
					/*}
					else
					{
						myApp.hidePreloader();
						myApp.alert('No photos in this album!');
					} */

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

function photoRefresh()
{
	$("#photos").find("div").remove();
	getPhotos();
}