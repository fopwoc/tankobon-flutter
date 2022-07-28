import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SpinState {
  SpinState(this._v, this._onClick);

  @protected
  final ValueNotifier<bool> _v;
  @protected
  final Future<void> Function() _onClick;

  bool get isSpinning => _v.value;

  void run() {
    _v.value = true;

    _onClick().whenComplete(
      () {
        _v.value = false;
      },
    );
  }
}

SpinState useSpin(Future<void> Function() func) {
  final spinState = useState<bool>(false);
  return SpinState(spinState, func);
}
