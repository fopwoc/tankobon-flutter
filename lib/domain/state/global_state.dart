// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:tankobon/domain/repositories/current_instance.dart';
// import 'package:tankobon/domain/repositories/instances.dart';
//
// final currentInstanceState = Future<StateNotifier<String>>(() async {
//   final tokenList = await getTokenListRepository();
//
//   if (tokenList.isNotEmpty) {
//     final currentInstance = await getCurrentInstanceRepository();
//     return StateProvider<String?>((ref) => currentInstance);
//   } else {
//     return StateProvider<String?>((ref) => null);
//   }
// });

import 'package:flutter/material.dart';
import 'package:tankobon/domain/database/current_instance.dart';
import 'package:tankobon/domain/database/instances.dart';

class GlobalState extends ChangeNotifier {
  String? _currentInstance;
  String? get currentInstance => _currentInstance;

  bool _hasInitialized = false;
  bool get hasInitialized => _hasInitialized;

  void initGlobalState() {
    getTokenListDatabase().then((value) {
      if (value.isNotEmpty) {
        getCurrentInstanceDatabase().then((instance) {
          _currentInstance = instance;
          _hasInitialized = true;
          notifyListeners();
        });
      } else {
        _currentInstance = null;
      }
    });
    //notifyListeners();
  }

  void setGlobalState(String? value) {
    _currentInstance = value;
    notifyListeners();
  }
}
