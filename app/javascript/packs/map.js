// map表示機能
let map

function initMap(){
  geocoder = new google.maps.Geocoder()
  if(document.getElementById('map')){
    map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: 35.690921, lng:139.700257},
      zoom: 12,
    });

    marker = new google.maps.Marker({
      position:  {lat: 35.690921, lng:139.700257},
      map: map
    });
  }else{
    map = new google.maps.Map(document.getElementById('show-map'), {
      center: {lat: <%= @lat %>.lat, lng: gon.lng},
      zoom: 12,
    });

    marker = new google.maps.Marker({
      position:  {lat: gon.lat, lng: gon.lng},
      map: map
    });
  }
}

// map検索機能
let geocoder

function codeAddress(){
  let inputAddress = document.getElementById('address').value;

  geocoder.geocode( { 'address': inputAddress}, function(results, status) {
    if (status == 'OK') {
      map.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
      });
    } else {
      // alert('該当する結果がありませんでした：' + status);
    }
  });
}

// ブラウザにinitMapを定義
window.onload = function() {
    initMap()
}
window.addEventListener("click", codeAddress);
