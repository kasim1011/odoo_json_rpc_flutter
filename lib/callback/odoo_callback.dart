import 'package:dio/dio.dart';

typedef void OnError(DioError error);
typedef void OnResponse<T>(T response);
