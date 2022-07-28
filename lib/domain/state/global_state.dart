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
import 'package:tankobon/domain/repositories/current_instance.dart';
import 'package:tankobon/domain/repositories/instances.dart';

class GlobalState extends ChangeNotifier {
  String? _globalState;
  String? get globalState => _globalState;

  void initGlobalState() {
    getTokenListRepository().then((value) {
      if (value.isNotEmpty) {
        getCurrentInstanceRepository().then((instance) {
          _globalState = instance;
          notifyListeners();
        });
      } else {
        _globalState = null;
      }
    });
    //notifyListeners();
  }

  void setGlobalState(String? value) {
    _globalState = value;
    notifyListeners();
  }
}
