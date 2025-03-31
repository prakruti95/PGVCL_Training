class UserModel {
  int id;
  String name;
  String surname;
  String email;
  String password;
  int isSynced;

  UserModel({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
    this.isSynced = 0,
  });

  // ✅ Convert JSON (API Response) to Object
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: int.parse(json['id'].toString()), // Handle String ID from API
      name: json['name'] ?? '',
      surname: json['surname'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      isSynced: json.containsKey('isSynced') ? int.parse(json['isSynced'].toString()) : 0,
    );
  }

  // ✅ Convert Object to JSON (For API Request)
  Map<String, dynamic> toJson() {
    return {
      'id': id.toString(),
      'name': name,
      'surname': surname,
      'email': email,
      'password': password,
      'isSynced': isSynced.toString(),
    };
  }

  // ✅ Convert Map (DB) to Object
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      surname: map['surname'],
      email: map['email'],
      password: map['password'],
      isSynced: map['isSynced'] ?? 0,
    );
  }

  // ✅ Convert Object to Map (For DB)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'email': email,
      'password': password,
      'isSynced': isSynced,
    };
  }
}
