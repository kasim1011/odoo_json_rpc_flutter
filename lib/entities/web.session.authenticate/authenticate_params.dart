class AuthenticateParams {
  var login = '';
  var password = '';
  var db = '';

  AuthenticateParams();

  AuthenticateParams.fromJsonMap(Map<String, dynamic> map)
      : login = map['login'] ?? '',
        password = map['password'] ?? '',
        db = map['db'] ?? '';

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['login'] = login;
    data['password'] = password;
    data['db'] = db;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthenticateParams &&
          runtimeType == other.runtimeType &&
          login == other.login &&
          password == other.password &&
          db == other.db;

  @override
  int get hashCode => login.hashCode ^ password.hashCode ^ db.hashCode;

  @override
  String toString() {
    return 'AuthenticateParams{login: $login, password: $password, db: $db}';
  }
}
