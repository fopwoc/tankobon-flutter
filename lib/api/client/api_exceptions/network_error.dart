import 'package:dio/dio.dart';

class NetworkError extends DioError {
  final DioError dioError;

  NetworkError({
    required this.dioError,
  }) : super(requestOptions: dioError.requestOptions);
}
