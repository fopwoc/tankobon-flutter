import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SpinButton extends StatelessWidget {
  const SpinButton({
    super.key,
    this.onClick,
    required this.child,
    required this.spin,
  });

  final VoidCallback? onClick;
  final Widget child;
  final bool spin;

  @override
  Widget build(BuildContext context) {
    return PlatformElevatedButton(
      color: spin ? Colors.black12 : null,
      onPressed: onClick,
      child: spin
          ? SizedBox(
              height: 22,
              width: 22,
              child: PlatformCircularProgressIndicator(),
            )
          : child,
    );
  }
}
