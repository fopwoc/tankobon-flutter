import "package:freezed_annotation/freezed_annotation.dart";

part "token.freezed.dart";
part "token.g.dart";

@freezed
class Token with _$Token {
  const factory Token({
    required String id,
    required String instanceId,
    required String accessToken,
    required String refreshToken,
  }) = _Token;

  factory Token.fromJson(Map<String, Object?> json) => _$TokenFromJson(json);

  @override
  String toString() => toJson().toString();
}
