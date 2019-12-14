import 'package:odoo_json_rpc_flutter/config/config.dart';

class VersionInfoResult {
  var serverVersion = '';
  var serverVersionInfo = List<dynamic>();
  var serverSeries = '';
  var protocolVersion = 0;

  VersionInfoResult();

  VersionInfoResult.fromJsonMap(Map<String, dynamic> map)
      : serverVersion = map['server_version'] ?? '',
        serverVersionInfo = map['server_version_info'] ?? [],
        serverSeries = map['server_serie'] ?? '',
        protocolVersion = map['protocol_version'] ?? 0;

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['server_version'] = serverVersion;
    data['server_version_info'] = serverVersionInfo;
    data['server_serie'] = serverSeries;
    data['protocol_version'] = protocolVersion;
    return data;
  }

  String get serverVersionType {
    if (serverVersionInfo.length > 3)
      return serverVersionInfo[3].toString() ?? '';
    else
      return '';
  }

  bool get isServerVersionEnterprise {
    if (serverVersionInfo.length > 5)
      return serverVersionInfo[5].toString().contains('e') ?? false;
    else
      return false;
  }

  bool get serverVersionIsSupported {
    for (var value in Config.SupportedOdooVersions) {
      if (serverVersion.startsWith(value)) {
        return true;
      }
    }
    return false;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VersionInfoResult &&
          runtimeType == other.runtimeType &&
          serverVersion == other.serverVersion &&
          serverVersionInfo == other.serverVersionInfo &&
          serverSeries == other.serverSeries &&
          protocolVersion == other.protocolVersion;

  @override
  int get hashCode =>
      serverVersion.hashCode ^
      serverVersionInfo.hashCode ^
      serverSeries.hashCode ^
      protocolVersion.hashCode;

  @override
  String toString() {
    return 'VersionInfoResult{serverVersion: $serverVersion, serverVersionInfo: $serverVersionInfo, serverSeries: $serverSeries, protocolVersion: $protocolVersion}';
  }
}
