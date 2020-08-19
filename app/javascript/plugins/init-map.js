const addMarker = (coords) => {
  marker = new google.maps.Marker({
    position:coords,
    map: map
  });
}

const initGoogleMap = () => {
  const mapElement = document.getElementById('map');

  const options = {
    zoom: 8,
    center: { lat: 19.432608, lng: -99.133209 }
  }
  const map = new google.maps.Map(mapElement, options);
  

  marker.addListener('click', () => {
    infoWindow.open(map, marker);
  });
}

// addMarker({ lat: 19.432608, lng: -99.133209 });
//   infoWindow = new google.maps.InfoWindow({
//     content: '<h3>Mexico City</h3>'
//   });

export { initGoogleMap };