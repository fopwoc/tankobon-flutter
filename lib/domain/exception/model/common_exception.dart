class CommonException implements Exception {
  CommonException(this.message);
  final String message;

  @override
  String toString() {
    return message;
  }
}
