import 'dart:convert';

import 'package:data_channel/data_channel.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tankobon/api/models/token.dart';
import 'package:tankobon/utils/const.dart';
import 'package:tankobon/utils/exceptions.dart';

@LazySingleton()
class LocalSharedPreference {
  LocalSharedPreference(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  Future<DC<Exception, Token?>> getToken() async {
    try {
      final jsonString = _sharedPreferences.getString(SharedPreferencesKeys.AUTH_TOKEN);

      Token? _tokenData;

      if (jsonString != null) {
        _tokenData = Token.fromJson(json.decode(jsonString) as Map<String, dynamic>);
      }

      return DC.data(
        _tokenData,
      );
    } on Exception {
      return DC.error(
        SharedPreferenceExcepion(),
      );
    }
  }

  Future<DC<Exception, Token>> setToken(
    Token tokenData,
  ) async {
    try {
      await _sharedPreferences.setString(
        SharedPreferencesKeys.AUTH_TOKEN,
        json.encode(tokenData.toJson()),
      );

      return DC.data(
        tokenData,
      );
    } on Exception {
      return DC.error(
        SharedPreferenceExcepion(),
      );
    }
  }
}
