import "dart:async";

import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";

ValueNotifier<T?> useDebounce<T>(T? value, int delay) {
  final debouncedValue = useState(value);
  useEffect(
    () {
      final timeout = Timer(
        Duration(milliseconds: delay),
        () => debouncedValue.value = value,
      );

      return timeout.cancel;
    },
    [value],
  );

  return debouncedValue;
}
