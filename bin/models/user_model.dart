import 'dart:math';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? password;

  UserModel(this.id, this.name, this.email, this.password);

  factory UserModel.fromMap(Map map) {
    Random r = Random(12345678);
    return UserModel(
      map['id'] ?? (r.nextInt(1 << 32).toString()),
      map['name'],
      map['email'],
      map['password'],
    );
  }

  factory UserModel.fromSignUpMap(Map map) {
    Random r = Random(123456789);
    return UserModel(
      map['id'] ?? (r.nextInt(1 << 32).toString()),
      map['name'],
      map['email'],
      map['password'],
    );
  }

  Map toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, password: $password)';
  }
}
