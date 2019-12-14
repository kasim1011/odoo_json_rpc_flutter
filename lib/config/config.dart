class Config {

  /// SelfHostedUrl:
  ///
  /// * if it is true, it allows user to manually set protocol and host URL.
  /// * if it is false then define your HostUrl below.
  static const SelfHostedUrl = true;

  /// HostUrl:
  static const HostUrl = 'http://754946-12-0-5876e0.runbot28.odoo.com/';

  /// PreConfigDatabase:
  ///
  /// * if it is false, it allows user to manually select the database.
  /// * if it is true then define PreConfigDatabaseName with database name below.
  static const PreConfigDatabase = false;

  /// PreConfigDatabaseName:
  static const PreConfigDatabaseName = 'db_v12';

  /// SelfSignedCert:
  static const SelfSignedCert = false;

  /// SupportedOdooVersions:
  static const SupportedOdooVersions = [
    '10', '11', 'saas~11', '12', 'saas~12', '13', 'saas~13'
  ];

  static const Timeout = 60000;
  static const LogNetworkRequest = true;
  static const LogNetworkRequestHeader = true;
  static const LogNetworkRequestBody = true;
  static const LogNetworkResponseHeader = true;
  static const LogNetworkResponseBody = true;
  static const LogNetworkError = true;

  const Config._();
}
