import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";

class ProgressBar extends HookWidget {
  const ProgressBar({
    required this.value,
    super.key,
  });

  final double value;

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );

    useEffect(
      () {
        animationController.animateTo(value);

        return null;
      },
      [value],
    );

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, _) {
        return CircularProgressIndicator(
          value: animationController.value,
        );
      },
    );
  }
}
