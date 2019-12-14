import 'package:dio/dio.dart';

typedef void OnError(final DioError error);
typedef void OnResponse<T>(final T response);
