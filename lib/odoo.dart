import 'dart:core';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:odoo_json_rpc_flutter/callback/odoo_callback.dart';
import 'package:odoo_json_rpc_flutter/config/dio_factory.dart';
import 'package:odoo_json_rpc_flutter/entities/web/session/authenticate/authenticate_params.dart';
import 'package:odoo_json_rpc_flutter/entities/web/session/authenticate/authenticate_request.dart';
import 'package:odoo_json_rpc_flutter/entities/web/session/authenticate/authenticate_response.dart';
import 'package:odoo_json_rpc_flutter/entities/web/webclient/versionInfo/version_info_request.dart';
import 'package:odoo_json_rpc_flutter/entities/web/webclient/versionInfo/version_info_response.dart';

class Odoo {
  Odoo._();

  static int _jsonRpcId = 0;
  static int _nextJsonRpcId() {
    _jsonRpcId = _jsonRpcId + 1;
    return _jsonRpcId;
  }

  static Future<bool> versionInfo({
    @required OnError onError,
    @required OnResponse<VersionInfoResponse> onResponse,
  }) async {
    final request = VersionInfoRequest();
    final response = await DioFactory.dio
        .post<Map<String, dynamic>>(
      'web/webclient/version_info',
      data: request.toJson(),
    )
        .catchError((e, stackTrace) {
      print(stackTrace);
      if (e is DioError) {
        if (onError != null) {
          onError(e);
        }
      }
    });
    if (response == null) {
      return false;
    }
    final responseData = VersionInfoResponse.fromJsonMap(response.data ?? {});
    if (onResponse != null) {
      onResponse(responseData);
    }
    return true;
  }

  static Future<bool> authenticate({
    @required String login,
    @required String password,
    @required String db,
    @required OnError onError,
    @required OnResponse<AuthenticateResponse> onResponse,
  }) async {
    if (login == null || password == null || db == null) {
      print('please provide non-null values for parameters');
      if (!kReleaseMode) {
        print('login: $login, password: $password, db: $db');
      }
      return false;
    }
    final params = AuthenticateParams()
      ..login = login.trim()
      ..password = password.trim()
      ..db = db.trim();
    final request = AuthenticateRequest()
      ..id = _nextJsonRpcId()
      ..params = params;
    final response = await DioFactory.dio
        .post<Map<String, dynamic>>(
      'web/session/authenticate',
      data: request.toJson(),
    )
        .catchError((e, stackTrace) {
      print(stackTrace);
      if (e is DioError) {
        if (onError != null) {
          onError(e);
        }
      }
    });
    if (response == null) {
      return false;
    }
    final responseData = AuthenticateResponse.fromJsonMap(response.data ?? {});
    if (onResponse != null) {
      onResponse(responseData);
    }
    return true;
  }
}
