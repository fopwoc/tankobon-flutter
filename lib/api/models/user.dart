import "package:freezed_annotation/freezed_annotation.dart";

part "user.freezed.dart";
part "user.g.dart";

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String username,
    required bool admin,
    required bool active,
    required DateTime creation,
    required DateTime modified,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  @override
  String toString() => toJson().toString();
}
