class Data {
  var name = '';
  var debug = '';
  var message = '';
  var arguments = List<dynamic>();
  var exceptionType = '';

  Data();

  Data.fromJsonMap(Map<String, dynamic> map)
      : name = map['name'] ?? '',
        debug = map['debug'] ?? '',
        message = map['message'] ?? '',
        arguments = map['arguments'] ?? List<dynamic>(),
        exceptionType = map['exception_type'] ?? '';

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['name'] = name;
    data['debug'] = debug;
    data['message'] = message;
    data['arguments'] = arguments;
    data['exception_type'] = exceptionType;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Data &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              debug == other.debug &&
              message == other.message &&
              arguments == other.arguments &&
              exceptionType == other.exceptionType;

  @override
  int get hashCode =>
      name.hashCode ^
      debug.hashCode ^
      message.hashCode ^
      arguments.hashCode ^
      exceptionType.hashCode;

  @override
  String toString() {
    return 'Data{name: $name, debug: $debug, message: $message, arguments: $arguments, exceptionType: $exceptionType}';
  }
}
