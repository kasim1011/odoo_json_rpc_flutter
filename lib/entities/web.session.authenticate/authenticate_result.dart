class AuthenticateResult {
  var sessionId = '';
  var uid = 0;
  var isSystem = false;
  var isAdmin = false;
  var userContext = Map<String, dynamic>();
  var db = '';
  var serverVersion = '';
  var serverVersionInfo = List<dynamic>();
  var name = '';
  var username = '';
  var partnerDisplayName = '';
  var companyId = 0;
  var partnerId = 0;
  var webBaseUrl = '';

  AuthenticateResult();

  AuthenticateResult.fromJsonMap(Map<String, dynamic> map)
      : sessionId = map['session_id'] ?? '',
        uid = map['uid'] ?? 0,
        isSystem = map['is_system'] ?? false,
        isAdmin = map['is_admin'] ?? false,
        userContext = map['user_context'] ?? Map<String, dynamic>(),
        db = map['db'] ?? '',
        serverVersion = map['server_version'] ?? '',
        serverVersionInfo = map['server_version_info'] ?? List<dynamic>(),
        name = map['name'] ?? '',
        username = map['username'] ?? '',
        partnerDisplayName = map['partner_display_name'] ?? '',
        companyId = map['company_id'] ?? 0,
        partnerId = map['partner_id'] ?? 0,
        webBaseUrl = map['web.base.url'] ?? '';

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['session_id'] = sessionId;
    data['uid'] = uid;
    data['is_system'] = isSystem;
    data['is_admin'] = isAdmin;
    data['user_context'] = userContext;
    data['db'] = db;
    data['server_version'] = serverVersion;
    data['server_version_info'] = serverVersionInfo;
    data['name'] = name;
    data['username'] = username;
    data['partner_display_name'] = partnerDisplayName;
    data['company_id'] = companyId;
    data['partner_id'] = partnerId;
    data['web.base.url'] = webBaseUrl;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthenticateResult &&
          runtimeType == other.runtimeType &&
          sessionId == other.sessionId &&
          uid == other.uid &&
          isSystem == other.isSystem &&
          isAdmin == other.isAdmin &&
          userContext == other.userContext &&
          db == other.db &&
          serverVersion == other.serverVersion &&
          serverVersionInfo == other.serverVersionInfo &&
          name == other.name &&
          username == other.username &&
          partnerDisplayName == other.partnerDisplayName &&
          companyId == other.companyId &&
          partnerId == other.partnerId &&
          webBaseUrl == other.webBaseUrl;

  @override
  int get hashCode =>
      sessionId.hashCode ^
      uid.hashCode ^
      isSystem.hashCode ^
      isAdmin.hashCode ^
      userContext.hashCode ^
      db.hashCode ^
      serverVersion.hashCode ^
      serverVersionInfo.hashCode ^
      name.hashCode ^
      username.hashCode ^
      partnerDisplayName.hashCode ^
      companyId.hashCode ^
      partnerId.hashCode ^
      webBaseUrl.hashCode;

  @override
  String toString() {
    return 'AuthenticateResult{sessionId: $sessionId, uid: $uid, isSystem: $isSystem, isAdmin: $isAdmin, userContext: $userContext, db: $db, serverVersion: $serverVersion, serverVersionInfo: $serverVersionInfo, name: $name, username: $username, partnerDisplayName: $partnerDisplayName, companyId: $companyId, partnerId: $partnerId, webBaseUrl: $webBaseUrl}';
  }
}
