import 'package:dio/dio.dart';

class UnauthorizedError extends DioError {
  final DioError dioError;

  UnauthorizedError({
    required this.dioError,
  }) : super(requestOptions: dioError.requestOptions);
}
