class ListRequest {
  var jsonRpc = '2.0';
  var method = 'call';
  var id = 0;
  var params = Map<String, dynamic>();

  ListRequest();

  ListRequest.fromJsonMap(Map<String, dynamic> map)
      : jsonRpc = map['jsonrpc'] ?? '2.0',
        method = map['method'] ?? 'call',
        id = map['id'] ?? 0,
        params = {};

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['jsonrpc'] = jsonRpc;
    data['method'] = method;
    data['id'] = id;
    data['params'] = {};
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListRequest &&
          runtimeType == other.runtimeType &&
          jsonRpc == other.jsonRpc &&
          method == other.method &&
          id == other.id &&
          params == other.params;

  @override
  int get hashCode =>
      jsonRpc.hashCode ^ method.hashCode ^ id.hashCode ^ params.hashCode;

  @override
  String toString() {
    return 'ListRequest{jsonRpc: $jsonRpc, method: $method, id: $id, params: $params}';
  }
}
