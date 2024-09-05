class AddressGeo {
    String lat;
    String lng;

    AddressGeo({
        required this.lat, 
        required this.lng      
    });

    // Método para crear una instancia de AddressGeo a partir de un JSON
    factory AddressGeo.fromJson(Map<String, dynamic> json) {
        return AddressGeo(
            lat: json['lat'],
            lng: json['lng']
        );
    }
}
