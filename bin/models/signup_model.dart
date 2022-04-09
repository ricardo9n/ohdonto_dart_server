class SignUpModel {
  String? name;
  String? email;
  String? password;

  SignUpModel(this.name, this.email, this.password);

  factory SignUpModel.fromJson(Map map) {
    return SignUpModel(
      map['name'],
      map['email'],
      map['password'],
    );
  }

  Map toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'SignUpModel(name: $name, email: $email, password: $password)';
  }
}
