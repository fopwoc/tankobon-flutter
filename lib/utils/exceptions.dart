class SharedPreferenceExcepion implements Exception {}

class ApiException implements Exception {}

class NetworkException implements Exception {}

class InternalServerException implements Exception {}

class UnauthenticatedException implements Exception {}

class ApiErrorMessageException implements Exception {
  final String? errorMessage;

  ApiErrorMessageException({required this.errorMessage});
}
