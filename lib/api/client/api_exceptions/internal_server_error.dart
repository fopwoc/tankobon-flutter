import 'package:dio/dio.dart';

class InternalServerError extends DioError {
  final DioError dioError;

  InternalServerError({
    required this.dioError,
  }) : super(requestOptions: dioError.requestOptions);
}
