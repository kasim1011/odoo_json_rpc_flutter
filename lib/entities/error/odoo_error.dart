import 'package:odoo_json_rpc_flutter/entities/error/data.dart';

class OdooError {
  var code = 200;
  var message = '';
  var data = Data();

  OdooError();

  OdooError.fromJsonMap(Map<String, dynamic> map)
      : code = map['code'] ?? 200,
        message = map['message'] ?? '',
        data = Data.fromJsonMap(map['data'] ?? {});

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['code'] = code;
    data['message'] = message;
    data['data'] = this.data.toJson();
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OdooError &&
          runtimeType == other.runtimeType &&
          code == other.code &&
          message == other.message &&
          data == other.data;

  @override
  int get hashCode => code.hashCode ^ message.hashCode ^ data.hashCode;

  @override
  String toString() {
    return 'OdooError{code: $code, message: $message, data: $data}';
  }
}
