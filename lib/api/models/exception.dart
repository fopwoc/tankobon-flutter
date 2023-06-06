import "package:freezed_annotation/freezed_annotation.dart";

part "exception.freezed.dart";
part "exception.g.dart";

@freezed
class BackendException with _$BackendException {
  const factory BackendException({
    required String type,
    String? message,
  }) = _BackendException;

  factory BackendException.fromJson(Map<String, Object?> json) =>
      _$BackendExceptionFromJson(json);

  @override
  String toString() => toJson().toString();
}
