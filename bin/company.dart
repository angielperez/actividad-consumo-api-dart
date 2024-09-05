class Company {
    String name;
    String catchPhrase;
    String bs;

    Company({
        required this.name, 
        required this.catchPhrase,
        required this.bs      
    });

    // Método para crear una instancia de Company a partir de un JSON
    factory Company.fromJson(Map<String, dynamic> json) {
        return Company(
            name: json['name'],
            catchPhrase: json['catchPhrase'],
            bs: json['bs']
        );
    }
}
