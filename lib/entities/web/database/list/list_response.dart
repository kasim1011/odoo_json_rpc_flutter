import 'package:odoo_json_rpc_flutter/entities/error/odoo_error.dart';

class ListResponse {
  var jsonRpc = '2.0';
  var id = 0;
  var result = List<String>();
  var error = OdooError();

  ListResponse();

  ListResponse.fromJsonMap(Map<String, dynamic> map)
      : jsonRpc = map['jsonrpc'] ?? '2.0',
        id = map['id'] ?? 0,
        result = List<String>.from(map['result']) ?? [],
        error = OdooError.fromJsonMap(map['error'] ?? {});

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['jsonrpc'] = jsonRpc;
    data['id'] = id;
    data['result'] = result;
    data['error'] = error.toJson();
    return data;
  }

  bool get isSuccessful => !isError;

  bool get isError => error.message.isNotEmpty;

  int get errorCode => error.code;

  String get errorMessage => error.data.message;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListResponse &&
          runtimeType == other.runtimeType &&
          jsonRpc == other.jsonRpc &&
          id == other.id &&
          result == other.result &&
          error == other.error;

  @override
  int get hashCode =>
      jsonRpc.hashCode ^ id.hashCode ^ result.hashCode ^ error.hashCode;

  @override
  String toString() {
    return 'ListResponse{jsonRpc: $jsonRpc, id: $id, result: $result, error: $error}';
  }
}
