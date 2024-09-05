
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user.dart';

void main() async {
    fetchUsers();
}

void fetchUsers() async {
  // URL de la API
  final url = Uri.parse('https://jsonplaceholder.typicode.com/users');

  // Realizar la petición GET
  final response = await http.get(url);

  // Verificar si la petición fue exitosa
  if (response.statusCode == 200) {
    // Parsear la respuesta JSON a una lista
    List<dynamic> jsonData = json.decode(response.body);

    // Crear una lista de Users
    List<User> users = jsonData.map((json) => User.fromJson(json)).toList();

    // Mostrar los datos
    pintarTodos(users);
    pintarUsernameMasde6(users);
    pintarCorreosBIZ(users);
  } else {
    // Manejo de errores
    print('Error al obtener los datos: ${response.statusCode}');
  }
}

void printUser(user) {
    print("------------------------------------------");
    print('User ID: ${user.id}');
    print('Name: ${user.name}');
    print('Username: ${user.username}');
    print('Email: ${user.email}');
    print('Address-Street: ${user.address.street}');
    print('Address-Suite: ${user.address.suite}');
    print('Address-City: ${user.address.city}');
    print('Address-Zipcode: ${user.address.zipcode}');
    print('Address-Geo-Lat: ${user.address.geo.lat}');
    print('Address-Geo-Lng: ${user.address.geo.lng}');
    print('Phone: ${user.phone}');
    print('Website: ${user.website}');
    print('Company-Name: ${user.company.name}');
    print('Company-CatchPhrase: ${user.company.catchPhrase}');
    print('Company-Bs: ${user.company.bs}');
}

void pintarTodos(users){
    print('---------------TODOS LOS USUARIOS------------');
    users.forEach((user) {
      printUser(user);
    });
}

void pintarUsernameMasde6(users){
    print('---------------TODOS LOS USUARIOS CON USERNAME MAYOR A 6 ------------');
    users.forEach((user) {
      if(user.username.length > 6){
        printUser(user);
      }
    });
}

void pintarCorreosBIZ(users){
    print('-------------- CONTEO CORREO TIPO BIZ ------------');
    int cont = 0;
    users.forEach((user) {
      if(user.email.contains('.biz')){
        cont += 1;
      }
    });
    print('TOTAL DE CORREO DOMINIO BIZ: ${cont}');
}