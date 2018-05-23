// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery

// window.onload = function() {
// 	if (navigator.geolocation) {
// 		// Get the location
// 		navigator.geolocation.getCurrentPosition(function(position) {
// 			var lat = position.coords.latitude;
// 			var lon = position.coords.longitude;
// 			showMap(lat, lon);
// 		});

// 	} else {
// 	  // Print out a message to the user.
// 	  document.write('Your browser does not support GeoLocation');
// 	}
// }

// function showMap(lat, lon) {
// 	var myLatLng = new google.maps.LatLng(lat, lon);

// 	var mapOptions = {
// 	  zoom: 8,
// 	  center: myLatLng,
// 	  mapTypeId: google.maps.MapTypeId.ROADMAP
// 	};

// 	var map = new google.maps.Map(document.getElementById('map'), mapOptions);

// 	var marker = new google.maps.Marker({
// 	  position: myLatLng,
// 	  map: map,
// 	  title: 'Found you!'
// 	});
// }