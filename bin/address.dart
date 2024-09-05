import 'addressGeo.dart';

class Address {
    String street;
    String suite;
    String city;
    String zipcode;
    AddressGeo geo;

    Address({
        required this.street, 
        required this.suite, 
        required this.city, 
        required this.zipcode,
        required this.geo       
    });

    // Método para crear una instancia de Address a partir de un JSON
    factory Address.fromJson(Map<String, dynamic> json) {
        return Address(
            street: json['street'],
            suite: json['suite'],
            city: json['city'],
            zipcode: json['zipcode'],
            geo: AddressGeo.fromJson(json['geo'])
        );
    }
}
