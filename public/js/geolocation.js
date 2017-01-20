$(document).on('ready',function(){
  userGeo = navigator.geolocation
  userGeo.getCurrentPosition(function(position){

    var geoData = position.coords

      $.ajax({
        url: '/restaurants',
        type: 'GET',
        data: geoData,
      })
      .done(function(response) {
        $("#tinderslide ul").append(response);
      });

  });
});
